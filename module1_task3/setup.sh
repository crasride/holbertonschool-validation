#!/bin/bash
apt-get update && apt-get install -y make hugo
make build
