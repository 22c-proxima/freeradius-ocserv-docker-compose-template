FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y autoconf build-essential pkg-config git ipcalc gperf \
    protobuf-c-compiler iptables iproute2 freeradius \
    libgnutls28-dev libev-dev libreadline-dev libprotobuf-c-dev libradcli-dev

WORKDIR /src
RUN git clone https://gitlab.com/openconnect/ocserv.git
RUN cd ocserv && ./autogen.sh && ./configure && make && make install

COPY etc /etc
RUN chmod -R 600 /etc/ocserv/*
RUN chmod 600 /etc/radcli/servers && chmod 640 /etc/radcli/radiusclient.conf
# Для лимитов полосы канала
RUN sed -i -E 's/^#(\$INCLUDE[[:space:]]+\/etc\/radcli\/dictionary\.roaringpenguin)/\1/' /etc/radcli/dictionary

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
