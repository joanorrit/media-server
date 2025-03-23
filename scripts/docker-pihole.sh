#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <api_password>"
  exit 1
fi

docker run -d \
  --name pihole \
  -e TZ='Europe/London' \
  -e FTLCONF_webserver_api_password="$1" \
  -e FTLCONF_dns_listeningMode='all' \
  -v ./etc-pihole:/etc/pihole \
  -p 53:53/tcp \
  -p 53:53/udp \
  -p 8585:80/tcp \
  -p 443:443/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_TIME \
  --cap-add=SYS_NICE \
  --restart unless-stopped \
  pihole/pihole:latest
