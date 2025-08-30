FROM freeradius/freeradius-server:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y postgresql-client

COPY etc /etc

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
