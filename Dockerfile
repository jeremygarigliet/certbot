FROM alpine:3.10

LABEL maintainer="Jeremy Garigliet <jeremy.garigliet@gmail.com>"

RUN apk add --no-cache certbot

COPY entrypoint.sh /usr/bin/entrypoint

RUN chmod 755 /usr/bin/entrypoint

ENTRYPOINT [ "entrypoint" ]