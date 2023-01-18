# Dockerfile
FROM golang:1.15.8-alpine

WORKDIR /module4_task2
COPY . .

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl=* zip=* && \
    rm -rf /var/lib/apt/lists/*
