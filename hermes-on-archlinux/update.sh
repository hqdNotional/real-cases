#!/bin/bash

docker rm -f hermes
docker image rm archlinux:latest
cd $HOME/real-cases
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git pull
cd $HOME/real-cases/hermes-on-archlinux/hermes-dockerfile
docker build -f Dockerfile . -t hermes:latest
docker run -it -d --hostname hermes --name hermes --net host hermes:latest
docker ps
