#!/bin/bash

pacman -Sy --noconfirm sudo
pacman -Syu --noconfirm
pacman -Sy --noconfirm git curl wget

export VER="v14.1.0"
wget https://github.com/cosmos/gaia/releases/download/${VER}/gaiad-${VER}-linux-amd64
mv gaiad-${VER}-linux-amd64 /usr/local/bin/gaiad
chmod +x /usr/local/bin/gaiad

export CHAIN_NAME="TEST2"
export SNAPSHOT_LINK="https://snapshots.polkachu.com/snapshots/cosmos/cosmos_19414580.tar.lz4"

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

gaiad init $CHAIN_NAME --chain-id cosmoshub-5

wget -O addrbook.json https://snapshots.polkachu.com/addrbook/cosmos/addrbook.json --inet4-only
mv addrbook.json ~/.gaia/config

wget -O cosmos_18331310.tar.lz4 $SNAPSHOT_LINK --inet4-only
lz4 -c -d cosmos_18331310.tar.lz4  | tar -x -C ~/.gaia

gaiad start --p2p.laddr tcp://0.0.0.0:1005 --rpc.laddr tcp://127.0.0.1:1006 --grpc.address 127.0.0.1:1007 --grpc-web.address 127.0.0.1:1008
