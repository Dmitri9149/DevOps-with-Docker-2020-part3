FROM alpine:3.12

WORKDIR /usr/app
COPY builder.sh ./

RUN apk add --no-cache git docker && \
    chmod +x builder.sh 


ENTRYPOINT [ "./builder.sh" ]