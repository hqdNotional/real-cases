#!/bin/bash

docker run -it -d --hostname cosmos1 --name cosmos1 --net host archlinux:latest
docker run -it -d --hostname cosmos2 --name cosmos2 --net host archlinux:latest
docker run -it -d --hostname hermes --name hermes --net host archlinux:latest

# docker run -it -d --hostname cosmos1 --name cosmos1 --net host hermes:latest
# docker run -it -d --hostname cosmos2 --name cosmos2 --net host cosmos:latest
# docker run -it -d --hostname hermes --name hermes --net host cosmos:latest
