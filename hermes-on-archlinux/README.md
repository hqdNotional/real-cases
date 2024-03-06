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
Write gm config:
```
cat << EOF | sudo tee -a $HOME/.gm/gm.config
[global]
  add_to_hermes = false
  auto_maintain_config = true
  extra_wallets = 2
  gaiad_binary = "/usr/local/bin/gaiad"
  hdpath = ""
  home_dir = "$HOME/.gm"
  ports_start_at = 27000
  validator_mnemonic = ""
  wallet_mnemonic = ""

  [global.hermes]
    binary = "/usr/local/bin/hermes" #change this path according to your setup
    config = "$HOME/.hermes/config.toml"
    log_level = "info"
    telemetry_enabled = true
    telemetry_host = "127.0.0.1"
    telemetry_port = 3001

[ibc-0]
  ports_start_at = 27010

[ibc-1]
  ports_start_at = 27020

[node-0]
  add_to_hermes = true
  network = "ibc-0"
  ports_start_at = 27030

[node-1]
  add_to_hermes = true
  network = "ibc-1"
  ports_start_at = 27040
EOF
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
