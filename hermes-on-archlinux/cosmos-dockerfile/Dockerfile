FROM archlinux:latest

WORKDIR /root

COPY ./cosmos1.sh .
COPY ./cosmos2.sh .

RUN pacman -Sy --noconfirm sudo
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm curl wget go rust git vim tar
RUN wget https://github.com/cosmos/gaia/releases/download/v14.1.0/gaiad-v14.1.0-linux-amd64
RUN mv gaiad-v14.1.0-linux-amd64 /usr/local/bin/gaiad
RUN chmod +x /usr/local/bin/gaiad

CMD ["/bin/bash"]

