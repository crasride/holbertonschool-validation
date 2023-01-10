#!/bin/bash
apt-get update && apt-get install -y hugo make
apt-get install curl -y
curl -Lo install_hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb
apt-get install ./install_hugo.deb
npm install -g markdownlint-cli
rm ./install_hugo.deb
