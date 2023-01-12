#!/bin/bash
rm -rf /usr/local/go
curl -Lo install_hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb
sudo apt-get install ./install_hugo.deb
