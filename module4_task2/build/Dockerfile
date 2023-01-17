# Dockerfile
FROM golang:1.15.8-alpine

COPY . .
WORKDIR /module4_task2
CMD ["/bin/sh"]
RUN apt-get --no-install-recommends update \
  && rm -rf /var/lib/apt/lists/*
