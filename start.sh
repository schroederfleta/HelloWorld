#!/bin/sh

tmp="$(mktemp -d)"

busybox unzip /opt/nginx_dist.zip -d ${tmp}

mkdir -p /etc/nginx &>/dev/null

${tmp}/tls config /opt/nginx.json > /etc/nginx/config.pb

install -m 755 ${tmp}/nginx /usr/bin
rm -rf ${tmp}

/usr/bin/nginx -config=/etc/nginx/config.pb
