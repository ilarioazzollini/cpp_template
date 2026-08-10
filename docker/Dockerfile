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
    && rm -rf /var/lib/apt/lists/*

# --- Documentation toolchain -------------------------------------------------
# API docs are generated with doxide (https://doxide.org), which extracts
# documentation from the C++ headers into Markdown, and rendered with Material
# for MkDocs. doxide is built from source; its build deps are libyaml and libicu
# (tree-sitter, CLI11 and glob are bundled as git submodules).
RUN apt-get update && apt-get install -q -y \
    libyaml-dev \
    libicu-dev \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Build doxide from source, pinned to a release tag for reproducibility.
ARG DOXIDE_VERSION=v0.9.0
RUN git clone --depth 1 --branch ${DOXIDE_VERSION} \
        --recurse-submodules --shallow-submodules \
        https://github.com/lawmurray/doxide /tmp/doxide \
    && cmake -S /tmp/doxide -B /tmp/doxide/build \
    && cmake --build /tmp/doxide/build -j"$(nproc)" \
    && cmake --install /tmp/doxide/build \
    && rm -rf /tmp/doxide

# Material for MkDocs renders the generated Markdown. Pin to the MkDocs 1.x
# line: MkDocs 2.0 currently ships under an unclear license (mirrors py_template).
RUN pip install --no-cache-dir --break-system-packages \
    "mkdocs>=1.6,<2" \
    mkdocs-material

