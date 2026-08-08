FROM ubuntu:26.04

ENV HOME=/root

WORKDIR ${HOME}

ENV DEBIAN_FRONTEND="noninteractive"

ENV TZ="Europe/Rome"
RUN apt-get update && apt-get install -y \
    tzdata \
    locales \
    && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN apt-get update && apt-get install -q -y \
    build-essential \
    git \
    cmake \
    clangd \
    clang-format \
    clang-tidy \
    gdb \
    ninja-build \
    doxygen \
    && rm -rf /var/lib/apt/lists/*

