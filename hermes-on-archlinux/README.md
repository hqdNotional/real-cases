# HERMES for relay

## Preparation
#### 1. Repo
```
cd $HOME
git clone --single-branch -b gm https://github.com/hqdNotional/real-cases.git
cd $HOME/real-cases
```
Update repo:

Note: This will delete all your containers and images:
```
sh $HOME/real-cases/hermes-on-archlinux/update.sh
```

#### 2. Images
Hermes:
```
cd $HOME/real-cases/hermes-on-archlinux/hermes-dockerfile
docker build -f Dockerfile . -t hermes:latest
```
#### 3. Run containers
```
docker run -it -d --hostname hermes --name hermes --net host hermes:latest
```
ENV:
```
export HERMESHASH=
```
#### 4. Run script inside containers
Hermes:
```
docker exec -it $HERMESHASH /bin/bash
```
#### 5. Initialize client, connection and channel
```
docker exec -it $HERMESHASH /bin/bash
```
Client:
```
hermes create client --host-chain cosmoshub-5 --reference-chain cosmoshub-4
hermes create client --host-chain cosmoshub-4 --reference-chain cosmoshub-5
```
Connection:
```
hermes create connection --a-chain cosmoshub-4 --a-client 07-tendermint-0 --b-client 07-tendermint-0
```
Channel:
```
hermes create channel --a-chain cosmoshub-4 --a-connection connection-0 --a-port transfer --b-port transfer
```
Check:
```
hermes query channels --show-counterparty --chain cosmoshub-4
```
