#!/bin/bash
apt-get update && apt-get install -y shellcheck git make wget build-essential
curl -L https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_0.84.0_Linux-64bit.deb -o h.deb
apt install ./h.deb
