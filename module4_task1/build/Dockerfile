# Dockerfile
FROM golang:1.15.8-buster
# Add working directory and copy files
RUN apt install git
RUN git clone https://github.com/crasride/holbertonschool-validation.git
WORKDIR /go/holbertonschool-validation/module4_task1
# install tools
RUN apt update
RUN apt install zip -y
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb
RUN apt install ./hugo.deb
RUN rm ./hugo.deb
# for test intranet which go hugo golangci-lint
RUN rm -rf /usr/local/go
# test make
