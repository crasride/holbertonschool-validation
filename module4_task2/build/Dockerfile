# Dockerfile
FROM golang:1.15.8-alpine

WORKDIR /module4_task2
COPY . .
RUN apt-get --no-install-recommends update \
  && rm -rf /var/lib/apt/lists/*

CMD ["/bin/sh"]
