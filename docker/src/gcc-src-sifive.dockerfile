# syntax=docker/dockerfile:1.0.0-experimental

FROM alpine:3.13.5
LABEL description="Store Git repository for GNU RISC-V toolchain"
LABEL maintainer="Emmanuel Blot <emmanuel.blot@sifive.com>"
RUN apk update
RUN apk add openssh-client git
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
WORKDIR /toolchain
RUN --mount=type=ssh git clone --depth 1 --branch sifive-gcc-2021.06.1 \
    git@github.com:sifive/riscv-gcc-internal gcc
WORKDIR /

# Docker 18.09+ is required
# export DOCKER_BUILDKIT=1
# eval `ssh-agent -s`
# ssh-add ~/.ssh/id_...
# docker build --ssh default -f gcc-src-sifive.dockerfile -t sifive/gcc-src:r2021.06.1 .
# unset DOCKER_BUILDKIT
