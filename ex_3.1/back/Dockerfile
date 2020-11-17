FROM alpine

WORKDIR /usr/app

RUN apk add --no-cache git nodejs nodejs-npm && \
    git clone https://github.com/docker-hy/backend-example-docker.git . && \
    npm install

EXPOSE 8000

CMD npm start