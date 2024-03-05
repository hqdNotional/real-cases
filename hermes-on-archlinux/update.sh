#!/bin/bash

docker rm -f cosmos1
docker rm -f cosmos2
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
docker run -it -d --hostname cosmos1 --name cosmos1 --net host cosmos:latest
docker run -it -d --hostname cosmos2 --name cosmos2 --net host cosmos:latest
docker run -it -d --hostname hermes --name hermes --net host hermes:latest
docker ps
