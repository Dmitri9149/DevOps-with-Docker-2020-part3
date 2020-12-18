FROM node:alpine as build

WORKDIR /usr/app

RUN apk add --no-cache git && \
    git clone https://github.com/docker-hy/frontend-example-docker.git . && \
    npm install && \
    npm run build


## -D do not assign password; -G add user to existing group
#    adduser -D -G new_user new_group && \
## -R recursion
#    chown -R new_user:new_group /usr/app

FROM node:alpine 
WORKDIR /usr/app
COPY --from=build /usr/app/dist /usr/app/dist
RUN npm install -g serve
EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "dist"]