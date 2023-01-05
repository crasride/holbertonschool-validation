#!/bin/bash
curl -L https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_0.84.0_Linux-64bit.deb -o hugoversion.deb
apt install ./hugoversion.deb
