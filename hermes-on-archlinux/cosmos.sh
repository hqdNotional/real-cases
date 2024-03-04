#!/bin/bash

black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
orange='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
gray='\033[0;37m'
gray2='\033[1;30m'
red2='\033[1;31m'
green2='\033[1;32m'
yellow='\033[1;33m'
blue2='\033[1;34m'
purple2='\033[1;35m'
cyan2='\033[1;36m'
white='\033[1;37m'
nc='\033[0m' # No Color
read -p "$(echo -e "Enter ${yellow}node ${green}name${nc} [${green2}test${nc}]: ")" name
name=${name:-test}
read -p "$(echo -e "Enter ${yellow}snapshot ${green}snapshotLink${nc} [${green2}your snapshot snapshotLink${nc}]: ")" snapshotLink
snapshotLink=${snapshotLink:-test}

rm -rvf /usr/local/go/
wget https://golang.org/dl/go1.21.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
rm go1.21.1.linux-amd64.tar.gz

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

git clone https://github.com/cosmos/gaia cosmos
cd cosmos
git checkout v14.1.0
make install

cp -f ~/go/bin/gaiad /usr/local/bin

gaiad init $name --chain-id cosmoshub-4

wget -O addrbook.json https://snapshots.polkachu.com/addrbook/cosmos/addrbook.json --inet4-only
mv addrbook.json ~/.gaia/config

wget -O cosmos_18331310.tar.lz4 $snapshotLink --inet4-only
lz4 -c -d cosmos_18331310.tar.lz4  | tar -x -C ~/.gaia

gaiad start --p2p.laddr tcp://0.0.0.0:1000 --rpc.laddr tcp://127.0.0.1:1001 --grpc.address 127.0.0.1:1002 --grpc-web.address 127.0.0.1:1003
