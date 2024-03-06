# HERMES for relay

## Preparation
#### 1. Repo
```
cd $HOME
git clone https://github.com/hqdNotional/real-cases.git
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
Cosmos:
```
cd $HOME/real-cases/hermes-on-archlinux/cosmos-dockerfile
docker build -f Dockerfile . -t cosmos:latest
```

Osmosis:
```
cd $HOME/real-cases/hermes-on-archlinux/osmosis-dockerfile
docker build -f Dockerfile . -t osmosis:latest
```

#### 3. Run containers
```
docker run -it -d --hostname cosmos --name cosmos --net host cosmos:latest
docker run -it -d --hostname osmosis --name osmosis --net host osmosis:latest
docker run -it -d --hostname hermes --name hermes --net host hermes:latest
```
ENV:
```
export HERMESHASH=
```
```
export COSMOSHASH=
```
```
export OSMOSISHASH=
```

#### 4. Run script inside containers
Cosmos:
```
docker exec -it $COSMOSHASH /bin/bash
```
```
sh $HOME/cosmos.sh
```
Osmosis:
```
docker exec -it $OSMOSISHASH /bin/bash
```
```
sh $HOME/osmosis.sh
```
Hermes:
```
docker exec -it $HERMESHASH /bin/bash
```
#### 5. Add key on COSMOS
Cosmos:
```
docker exec -it $COSMOSHASH /bin/bash
```
```
export KEY=
```
```
gaiad keys add $KEY --output json
```

Osmosis:
```
docker exec -it $OSMOSISHASH /bin/bash
```
```
export KEY=
```
```
osmosisd keys add $KEY --output json
```

Hermes:

Write down your `json` output from `cosmos` and `osmosis`:
```
docker exec -it $HERMESHASH /bin/bash
vim $HOME/key1.json $HOME/key2.json 
```
#### 6. Add key on Hermes
Write default `config.toml` to `HERMES`. Remember to edit the config file follow your config:

```
docker exec -it $HERMESHASH /bin/bash
```
```
mkdir -p $HOME/.hermes
vim $HOME/.hermes/config.toml
```
Add keys:

Why `cosmoshub-4` and `osmosis-1`. I specify it in `cosmos.sh` and `osmosis.sh`.
```
docker exec -it $HERMESHASH /bin/bash
```
```
hermes keys add --chain cosmoshub-4 --key-file ./key1.json
hermes keys add --chain osmosis-1 --key-file ./key2.json
```
#### 7. Initialize client, connection and channel
```
docker exec -it $HERMESHASH /bin/bash
```
Client:
```
hermes create client --host-chain osmosis-1 --reference-chain cosmoshub-4
hermes create client --host-chain cosmoshub-4 --reference-chain osmosis-1
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
