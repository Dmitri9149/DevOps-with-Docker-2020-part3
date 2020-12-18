FROM node:alpine

WORKDIR /usr/app

RUN apk add --no-cache git && \
    git clone https://github.com/docker-hy/backend-example-docker.git . && \
    npm install && \
    apk del git && \
    addgroup -S new_group && adduser -S new_user -G new_group && \
    chown -R new_user:new_group /usr/app
USER new_user

EXPOSE 8000

CMD ["npm", "start"]