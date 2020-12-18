## the same Dockefile as in ex 3.4 
## here we use FROM alpine 

FROM alpine

WORKDIR /usr/app

RUN apk add --no-cache git nodejs nodejs-npm && \
    git clone https://github.com/docker-hy/frontend-example-docker.git . && \
    npm install && \
    addgroup new_group && adduser -D new_user -G new_group && \
    chown -R new_user:new_group /usr/app

USER new_user

EXPOSE 5000

CMD ["npm", "start"]