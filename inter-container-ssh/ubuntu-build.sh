#!/bin/bash

tag=$1

docker build --platform="linux/amd64" -t haquocdat543/ubuntu:$tag -f ubuntu.Dockerfile .






