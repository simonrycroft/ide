FROM alpine:latest

RUN apk add -U --no-cache \
    neovim git \
    zsh openssh-client \
    curl less man \
    docker su-exec

RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true

COPY zshrc .zshrc
COPY vimrc .config/nvim/init.vim

# Install Vim Plug for plugin management
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
RUN nvim +PlugInstall +qall >> /dev/null

# Create a user called 'me'
RUN adduser -D -s /bin/zsh me

# Do everything from now in that users home directory
WORKDIR /home/me
ENV HOME /home/me

# Entrypoint script does switches u/g ID's and `chown`s everything
COPY entrypoint.sh /bin/entrypoint.sh

# Set working directory to /workspace
WORKDIR /workspace

# Default entrypoint, can be overridden
CMD ["/bin/entrypoint.sh"]

