# HERMES for relay

## Preparation
#### 1. Repo
```
cd $HOME
git clone git@github.com:hqdNotional/real-cases.git
cd $HOME/real-cases
```

#### 2. Images
Hermes:
```
cd $HOME/real-cases/hermes-on-archlinux/hermes-dockerfile
docker build -f Dockerfile . -t hermes:latest
```
Cosmos:
```
cd $HOME/real-cases/hermes-on-archlinux/cosmos-dockerfile
docker build -f Dockerfile . -t cosmos:latest
```

#### 3. Run containers
```
docker run -it -d --hostname cosmos1 --name cosmos1 --net host cosmos:latest
docker run -it -d --hostname cosmos2 --name cosmos2 --net host cosmos:latest
docker run -it -d --hostname hermes --name hermes --net host hermes:latest
```
ENV:
```
export HERMESHASH=
```
```
export COSMOS1HASH=
```
```
export COSMOS2HASH=
```

#### 4. Run script inside containers
Cosmos1:
```
docker exec -it $COSMOS1HASH /bin/bash
sh $HOME/cosmos1.sh
```
Cosmos2:
```
docker exec -it $COSMOS2HASH /bin/bash
sh $HOME/cosmos2.sh
```
Hermes:
```
docker exec -it $HERMESHASH /bin/bash
```
#### 5. Add key on COSMOS
Cosmos1:
```
docker exec -it $COSMOS1HASH /bin/bash
gaiad keys add $KEY --output json
```

Cosmos2:
```
docker exec -it $COSMOS2HASH /bin/bash
gaiad keys add $KEY --output json
```

Hermes:

Write down your `json` output from `cosmos1` and `cosmos2`:
```
docker exec -it $HERMESHASH /bin/bash
vim $HOME/key1.json $HOME/key2.json 
```
#### 6. Add key on Hermes
Write default `config.toml` to `HERMES`. Remember to edit the config file follow your config:

```
docker exec -it $HERMESHASH /bin/bash
mkdir -p $HOME/.hermes
vim $HOME./hermes/config.toml
```
Add keys:

Why `cosmoshub-4` and `cosmoshub-5`. I specify it in `cosmos1.sh` and `cosmos2.sh`.
```
docker exec -it $HERMESHASH /bin/bash
hermes keys add --chain cosmoshub-4 IN_ID --key-file ./key1.json
hermes keys add --chain cosmoshub-5 IN_ID --key-file ./key2.json
```
#### 7. Initialize client, connection and channel
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