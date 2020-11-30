FROM alpine

WORKDIR /usr/app

RUN apk add --no-cache git nodejs nodejs-npm && \
    git clone https://github.com/docker-hy/frontend-example-docker.git . && \
    npm install -g serve && \
    npm install && \
    npm run build


CMD serve -s -l $PORT dist