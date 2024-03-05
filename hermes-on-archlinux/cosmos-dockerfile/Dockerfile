FROM archlinux:latest

COPY ../cosmos2.sh /root/

RUN pacman -Sy --noconfirm sudo
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm curl wget go rust git vim tar
RUN export VER="v14.1.0"
RUN wget https://github.com/cosmos/gaia/releases/download/${VER}/gaiad-${VER}-linux-amd64
RUN mv gaiad-${VER}-linux-amd64 /usr/local/bin/gaiad
RUN chmod +x /usr/local/bin/gaiad

CMD ["/bin/bash"]

