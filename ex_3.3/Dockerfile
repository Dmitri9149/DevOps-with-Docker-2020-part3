FROM alpine:3.12

WORKDIR /usr
COPY builder.sh ./

RUN apk add --no-cache git docker && \
    chmod +x /usr/builder.sh

CMD /usr/builder.sh