FROM node:alpine as build
WORKDIR /usr/app

RUN apk add --no-cache git && \
    git clone https://github.com/docker-hy/frontend-example-docker.git . && \
    npm install && \
    npm run build


FROM node:alpine
WORKDIR /usr/app
COPY --from=build /usr/app/dist /usr/app/dist
RUN npm install -g serve && \
    addgroup new_group && adduser -D new_user -G new_group && \
    chown -R new_user:new_group /usr/app

USER new_user
EXPOSE 5000
CMD ["serve", "-s", "-l", "5000", "dist"]