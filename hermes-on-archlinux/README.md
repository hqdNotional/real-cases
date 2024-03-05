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
docker run -it -d --hostname cosmos1 --name cosmos1 --net host hermes:latest
docker run -it -d --hostname cosmos2 --name cosmos2 --net host cosmos:latest
docker run -it -d --hostname hermes --name hermes --net host cosmos:latest
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
docker exec -it $COSMOS2HASH /bin/bash
```
