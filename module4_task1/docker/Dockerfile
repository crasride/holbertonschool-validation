# Dockerfile
FROM golang:1.15.8-buster
WORKDIR /module4_task1
COPY . /module4_task1
RUN make /module4_task1
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb
RUN apt install ./hugo.deb
CMD run /module4_task1/docker/Dockerfile
