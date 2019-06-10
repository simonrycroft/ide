FROM alpine:latest

RUN apk add -U --no-cache \
    neovim git \
    zsh openssh-client \
    curl less man \
    docker su-exec

RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true

COPY ./zshrc /home/me/.zshrc
COPY ./vimrc /home/me/.config/nvim/init.vim
COPY ./nvim /home/me/nvim


# Create a user called 'me'
RUN adduser -D -s /bin/zsh -h /home/me me

# Do everything from now in that users home directory
WORKDIR /home/me
ENV HOME /home/me

# Entrypoint script does switches u/g ID's and `chown`s everything
COPY entrypoint.sh /bin/entrypoint.sh

# Set working directory to /workspace
WORKDIR /workspace

RUN chown -R me:me /home/me

USER me

RUN ls -la /home/me

# Install Vim Plug for plugin management
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
RUN nvim -u /home/me/nvim/node/init.vim +'PlugInstall --sync' +qa

USER root

# Default entrypoint, can be overridden CMD ["/bin/entrypoint.sh"]
CMD ["/bin/entrypoint.sh"]

