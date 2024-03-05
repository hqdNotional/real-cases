#!/bin/bash

export CHAIN_NAME="TEST1"
export SNAPSHOT_LINK="https://snapshots.polkachu.com/snapshots/cosmos/cosmos_19414580.tar.lz4"

gaiad init $CHAIN_NAME --chain-id cosmoshub-4

wget -O addrbook.json https://snapshots.polkachu.com/addrbook/cosmos/addrbook.json --inet4-only
mv addrbook.json ~/.gaia/config

wget -O cosmos_18331310.tar.lz4 $SNAPSHOT_LINK --inet4-only
lz4 -c -d cosmos_18331310.tar.lz4  | tar -x -C ~/.gaia

gaiad start --p2p.laddr tcp://0.0.0.0:1001 --rpc.laddr tcp://127.0.0.1:1002 --grpc.address 127.0.0.1:1003 --grpc-web.address 127.0.0.1:1004
