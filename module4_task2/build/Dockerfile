# Dockerfile
FROM golang:1.15.8-buster

USER "docker"
WORKDIR /module4_task2
COPY . .
RUN apt-get --no-install-recommends update \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/module4_task2/ls"]
