FROM ubuntu:16.04

WORKDIR /root

COPY ./loop.sh .

RUN apt-get update && \
    apt-get install -y netcat ssh iputils-ping vim openssh-client openssh-server && \
    sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    service ssh restart

RUN echo "root:root" | chpasswd

EXPOSE 22

CMD sh loop.sh
