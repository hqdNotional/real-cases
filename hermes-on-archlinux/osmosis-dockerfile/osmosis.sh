#!/bin/bash

export CHAIN_NAME="TEST2"
export SNAPSHOT_LINK="https://snapshots.polkachu.com/snapshots/osmosis/osmosis_14140435.tar.lz4"

osmosisd init $CHAIN_NAME --chain-id osmosis-1

wget -O addrbook.json https://snapshots.polkachu.com/addrbook/osmosis/addrbook.json --inet4-only
mv addrbook.json ~/.osmosisd/config

wget -O osmosis_18331310.tar.lz4 $SNAPSHOT_LINK --inet4-only
lz4 -c -d osmosis_18331310.tar.lz4  | tar -x -C ~/.gaia

# Start chain
osmosisd start --p2p.laddr tcp://0.0.0.0:1001 --rpc.laddr tcp://127.0.0.1:1002 --grpc.address 127.0.0.1:1003 --grpc-web.address 127.0.0.1:1004
