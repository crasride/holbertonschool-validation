# Dockerfile
FROM golang:1.15.8-buster
WORKDIR /module4_task1
COPY . /module4_task1
RUN make /module4_task1
RUN ./setup.sh
CMD run /module4_task1/docker/Dockerfile
