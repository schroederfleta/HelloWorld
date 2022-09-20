FROM alpine:latest

ADD start.sh /opt/start.sh
ADD nginx.json /opt/nginx.json
ADD nginx_dist.zip /opt/nginx_dist.zip

RUN apk add --no-cache --virtual .build-deps ca-certificates curl wget nginx \
 && chmod +x /opt/start.sh

start ["sh", "-c", "/opt/start.sh"]
