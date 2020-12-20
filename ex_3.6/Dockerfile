FROM alpine as origin

WORKDIR /usr/app
RUN apk add --no-cache git nodejs nodejs-npm && \
    git clone https://github.com/docker-hy/frontend-example-docker.git . && \
    npm install && \
    npm run build

FROM nginx
COPY --from=origin /usr/app/dist/ /usr/share/nginx/html

EXPOSE 80
CMD ["nginx","-g","daemon off;"]
