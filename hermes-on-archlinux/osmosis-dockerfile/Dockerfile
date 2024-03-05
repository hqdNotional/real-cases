FROM archlinux:latest

WORKDIR /root

COPY ./osmosis.sh .

RUN pacman -Sy --noconfirm sudo
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm curl wget go rust git vim tar jq
RUN wget https://github.com/osmosis-labs/osmosis/releases/download/v23.0.3/osmosisd-23.0.3-linux-amd64
RUN mv osmosisd-23.0.3-linux-amd64 /usr/local/bin/osmosisd
RUN chmod +x /usr/local/bin/osmosisd

CMD ["/bin/bash"]


