#!/bin/bash
rm -rf /usr/local/go
sudo apt update
sudo apt install zip -y
npm install -g markdownlint-cli
npm install markdownlint --save-dev
