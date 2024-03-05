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
