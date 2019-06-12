FROM alpine:latest

RUN apk add -U --no-cache \
    git gcc python python3-dev \
    zsh openssh-client \
    curl less man \
    docker su-exec \
    musl-dev linux-headers \
    neovim npm nodejs

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

RUN pip3 install pynvim

RUN npm install -g tern

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

RUN mkdir -p ~/.config/nvim/colors && curl https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim -o ~/.config/nvim/colors/solarized.vim

# Install Vim Plug for plugin management
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
RUN nvim +'PlugInstall --sync' +qa
RUN nvim +'UpdateRemotePlugins' +qa

USER root

# Default entrypoint, can be overridden CMD ["/bin/entrypoint.sh"]
CMD ["/bin/entrypoint.sh"]


# TODO
# CTRL+P being weird
# Linter can't send data to closed streamuser - error goes away after manually running :UpdateRemotePlugins
# Linting not working
# Auto prettifying not working
# Deoplete not working
# Persist startify data
