# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM ubuntu:18.04

MAINTAINER Pterodactyl Software, <support@pterodactyl.io>

RUN apt update && ((while true; do echo 8; done) | apt-get -y install mono-runtime) \
    && adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
