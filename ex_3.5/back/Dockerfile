FROM alpine

WORKDIR /usr/app

RUN apk add --no-cache git nodejs nodejs-npm && \
    git clone https://github.com/docker-hy/backend-example-docker.git . && \
    npm install && \
## -D do not assign password; -G add user to existing group
    adduser -D -G new_user new_group && \
# -R recursion
    chown -R new_user:new_group /usr/app

EXPOSE 8000

CMD ["npm", "start"] add .