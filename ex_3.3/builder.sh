#!/bin/sh
error_exit() {
    echo "$1" 1>&2
    exit 1
}

if [ -d "repo" ]; then 
  echo "./repo already exist -> Exiting."
  exit 1
fi


if [ -z "$GIT_URL" ]; then
  echo "GIT_URL env variable not set. Exiting."
  exit 1
fi

if [ -z "$CONTAINER_NAME" ]; then
  echo "CONTAINER NAME env variable not set. Exiting."
  exit 1
fi

git clone $GIT_URL repo || error_exit "Unable to clone $GIT_URL. Exiting."
cd repo || error_exit "Can not change directory! Exiting"

if [ ! -f "Dockerfile" ]; then
  echo "Dockerfile not found. Exiting."
  exit 1
fi

docker build -t $CONTAINER_NAME . || error_exit "Unable to build image. Exiting"

if [ "$PUSH_TO_DOCKER" = true ]; then
  echo "start login"
  docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD || error_exit "Unable to login. Exiting"
  docker push $CONTAINER_NAME || error_exit "Unable to push. Exiting"
fi