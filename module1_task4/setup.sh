#!/bin/bash
apt-get update && apt-get install -y hugo make
make build
