# Dockerfile
FROM golang:1.15.8-alpine

WORKDIR /module4_task2
COPY . .

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl=* zip=* && \
    rm -rf /var/lib/apt/lists/*

ENV NODE_VERSION=16.13.0

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash && \
    nvm install ${NODE_VERSION} && \
    nvm use v$ && \
    nvm alias default v${NODE_VERSION} && \
    PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}" \
    node --version && \
    npm --version && \
    curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb && \
    test -e /tmp/hugo.deb && dpkg -i /tmp/hugo.deb || echo 'File not found' && \
    npm install -g markdownlint-cli@* && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends docker.io=* python3-pip=* jq=* && \
    pip3 install --no-cache-dir awscli==* && \
    rm -rf /var/lib/apt/lists/* \
    make build && \
    make package
