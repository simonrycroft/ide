```
docker build -t simonrycroft/ide:latest .
```
```
docker run -it --rm \
    -v $HOME/git/services/kuzzle:/workspace \
    -e HOST_USER_ID=$(id -u $USER) \
    -e HOST_GROUP_ID=$(id -g $USER) \
    -e GIT_USER_NAME="Simon Rycroft" \
    -e GIT_USER_EMAIL="simon.rycroft@gmail.com" \
    -v ~/.ssh:/home/me/.ssh \
    simonrycroft/ide:latest
```
