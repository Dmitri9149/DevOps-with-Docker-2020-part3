FROM alpine:3.12

WORKDIR /usr/app
COPY builder.sh ./

RUN apk add git docker && \
    chmod +x builder.sh 


CMD ./builder.sh