FROM alpine:3.10

RUN apk add -U --no-cache \
    git gcc python python3-dev \
    zsh openssh-client \
    curl less man \
    docker su-exec \
    musl-dev linux-headers \
    neovim neovim-doc \
    npm nodejs ctags \
    tmux openssh-client bash ncurses

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

RUN pip3 install pynvim

RUN npm install -g tern
RUN npm install -g git+https://github.com/ramitos/jsctags.git
RUN npm install -g livedown

# Create a user called 'me'
RUN adduser -D -s /bin/zsh -h /home/me me

COPY ./zshrc /home/me/.zshrc
COPY ./vimrc /home/me/.config/nvim/init.vim
#COPY ./tmux.conf /home/me/.tmux.conf

# Do everything from now in that users home directory
WORKDIR /home/me
ENV HOME /home/me

# Entrypoint script does switches u/g ID's and `chown`s everything
COPY entrypoint.sh /bin/entrypoint.sh

RUN chown -R me:me /home/me

USER me

RUN mkdir -p ~/.config/nvim/colors && curl https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim -o ~/.config/nvim/colors/solarized.vim

# Install Vim Plug for plugin management
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
RUN nvim +'PlugInstall --sync' +qa
RUN nvim +'UpdateRemotePlugins' +qa

# Install Tmux Plugin Manager
#ENV TMUX_PLUGIN_MANAGER_PATH = /home/me/.tmux/plugins
#RUN git clone https://github.com/tmux-plugins/tpm /home/me/.tmux/plugins/tpm
# Install plugins
#RUN /home/me/.tmux/plugins/tpm/bin/install_plugins

USER root

CMD ["/bin/entrypoint.sh"]
