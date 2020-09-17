FROM ubuntu:18.04

RUN  apt-get update
RUN  apt-get install -y build-essential autoconf libtool 
RUN  apt-get install -y python-setuptools python-dev python3-dev
RUN  apt-get install -y python-pip python3-pip
RUN  apt-get install -y python-virtualenv unixodbc-dev libffi-dev git

# Install Wireguard, Generate Keys
RUN  apt install -y wireguard
RUN umask 077
RUN  wg genkey |  tee server_private_key |  wg pubkey > /etc/wireguard/server_public_key
RUN  wg genkey |  tee client_private_key |  wg pubkey > /etc/wireguard/client_public_key

COPY etc /etc
COPY run /run

EXPOSE 51820/udp

CMD ./run
