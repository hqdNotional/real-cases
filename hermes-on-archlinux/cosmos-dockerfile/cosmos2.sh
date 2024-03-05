#!/bin/bash

export CHAIN_NAME="TEST2"
export SNAPSHOT_LINK="https://snapshots.polkachu.com/snapshots/cosmos/cosmos_19414580.tar.lz4"

gaiad init $CHAIN_NAME --chain-id cosmoshub-5

wget -O addrbook.json https://snapshots.polkachu.com/addrbook/cosmos/addrbook.json --inet4-only
mv addrbook.json ~/.gaia/config

wget -O cosmos_18331310.tar.lz4 $SNAPSHOT_LINK --inet4-only
lz4 -c -d cosmos_18331310.tar.lz4  | tar -x -C ~/.gaia

gaiad start --p2p.laddr tcp://0.0.0.0:1005 --rpc.laddr tcp://127.0.0.1:1006 --grpc.address 127.0.0.1:1007 --grpc-web.address 127.0.0.1:1008

