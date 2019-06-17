#!/bin/sh

# Git config
if [ ! -z "$GIT_USER_NAME" ] && [ ! -z "$GIT_USER_EMAIL" ]; then
    git config --global user.name "$GIT_USER_NAME"
    git config --global user.email "$GIT_USER_EMAIL"
fi

# Get standard cali USER_ID variable
# USER_ID=${HOST_USER_ID:-9001}
# GROUP_ID=${HOST_GROUP_ID:-9001}

# Change 'me' uid to host user's uid
#if [ ! -z "$USER_ID" ] && [ "$(id -u me)" != "$USER_ID" ]; then
    # Create the user group if it does not exist
    #addgroup -g "$GROUP_ID" group
    # Set the user's uid and gid
    #addgroup me group
    #usermod --non-unique --uid "$USER_ID" --gid "$GROUP_ID" me
#fi

# Setting permissions on /home/me
#chown -R me: /home/me

# Setting permissions on docker.sock
#chown me: /var/run/docker.sock


# TODO open nv on startup
exec /sbin/su-exec me nvim
