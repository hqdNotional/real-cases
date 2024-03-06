FROM archlinux:latest

WORKDIR /root

RUN pacman -Sy --noconfirm sudo
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm curl wget go rust git vim tar jq go which
RUN wget https://github.com/informalsystems/hermes/releases/download/v1.8.0/hermes-v1.8.0-x86_64-unknown-linux-gnu.tar.gz
RUN tar -xvzf hermes-v1.8.0-x86_64-unknown-linux-gnu.tar.gz
RUN mv -f hermes /usr/local/bin
RUN rm -f hermes-v1.8.0-x86_64-unknown-linux-gnu.tar.gz
RUN wget https://github.com/cosmos/gaia/releases/download/v14.1.0/gaiad-v14.1.0-linux-amd64
RUN mv gaiad-v14.1.0-linux-amd64 /usr/local/bin/gaiad
RUN chmod +x /usr/local/bin/gaiad
RUN git clone https://github.com/informalsystems/gm && cp -f $HOME/gm/bin/* /usr/local/bin
RUN go install github.com/freshautomations/sconfig@latest && cp $HOME/go/bin/sconfig /usr/local/bin
RUN wget https://github.com/freshautomations/stoml/releases/download/v0.7.1/stoml_linux_amd64 && mv stoml /usr/local/bin/stoml && chmod +x /usr/local/bin/stoml
RUN mkdir -p $HOME/.gm
RUN mv /root/go/bin/sconfig /usr/local/bin/sconfig

CMD ["/bin/bash"]

