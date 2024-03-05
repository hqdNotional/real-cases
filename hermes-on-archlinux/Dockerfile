FROM archlinux:latest

RUN pacman -Sy --noconfirm sudo
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm curl wget go rust git vim tar
RUN wget https://github.com/informalsystems/hermes/releases/download/v1.8.0/hermes-v1.8.0-x86_64-unknown-linux-gnu.tar.gz
RUN tar -xvzf hermes-v1.8.0-x86_64-unknown-linux-gnu.tar.gz
RUN mv -f hermes /usr/local/bin
RUN rm -f hermes-v1.8.0-x86_64-unknown-linux-gnu.tar.gz

CMD ["/bin/bash"]
TAG hermes:latest

FROM archlinux:latest

RUN pacman -Sy --noconfirm sudo
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm curl wget go rust git vim tar
RUN export VER="v14.1.0"
RUN wget https://github.com/cosmos/gaia/releases/download/${VER}/gaiad-${VER}-linux-amd64
RUN mv gaiad-${VER}-linux-amd64 /usr/local/bin/gaiad
RUN chmod +x /usr/local/bin/gaiad

CMD ["/bin/bash"]
TAG cosmos:latest
