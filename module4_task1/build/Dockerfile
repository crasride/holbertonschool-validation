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
# test install nodejs and nvm
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.50.1
ENV NODE_VERSION=16.13.0
RUN apt-get install -y zip yamllint shellcheck
RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
RUN chmod a+x /usr/local/bin/yq
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version
RUN npm install -g markdownlint-cli
# for test intranet which go hugo golangci-lint
RUN rm -rf /usr/local/go
# test make
