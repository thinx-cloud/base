FROM node:18-alpine

LABEL maintainer="Matej Sychra <suculent@me.com>"

# RUN adduser --system --disabled-password --shell /bin/bash thinx

# WHY? See blame.
# RUN sh -c "echo 'Dir::Ignore-Files-Silently:: \"(.save|.distupgrade)$\";' > /etc/apt/apt.conf.d/99ignoresave"

# Packages

RUN apk add git jq zip curl openssh

# RUN apt-get update -qq && \
#     apt-get install -qq -y --fix-missing --no-install-recommends \
#     apt-transport-https \
#     apt-utils \
#     btrfs-progs \
#     ca-certificates \
#     curl \
#     e2fsprogs \
#     gnutls-bin \
#     iptables \
#     lxc \
#     pigz \
#     python \
#     openssh-client \
#     xfsprogs \
#     xz-utils \
#     net-tools \
#     git \
#     jq \
#     zip \
#     && rm -rf /var/lib/apt/lists/*

# Docker

ENV VER="20.10.12"
RUN curl -sL -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz && \
    tar -xz -C /tmp -f /tmp/docker-$VER.tgz && \
    rm -rf /tmp/docker-$VER.tgz && \
    mv /tmp/docker/* /usr/bin

VOLUME /var/lib/docker

# Node.js app

WORKDIR /opt/thinx/thinx-device-api

# App dependencies

COPY ./package.json ./
COPY .snyk ./.snyk

# USER 1000:1000