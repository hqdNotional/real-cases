#!/bin/bash

docker rm -f cosmos
docker rm -f osmosis
docker rm -f hermes
docker image rm cosmos:latest
docker image rm hermes:latest
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
cd $HOME/real-cases/hermes-on-archlinux/cosmos-dockerfile
docker build -f Dockerfile . -t cosmos:latest
cd $HOME/real-cases/hermes-on-archlinux/osmosis-dockerfile
docker build -f Dockerfile . -t osmosis:latest
docker run -it -d --hostname cosmos --name cosmos --net host cosmos:latest
docker run -it -d --hostname osmosis --name osmosis --net host osmosis:latest
docker run -it -d --hostname hermes --name hermes --net host hermes:latest
docker ps
