FROM alpine:latest

RUN apk add --no-cache openssl
WORKDIR /out

RUN openssl req -x509 -newkey rsa:4096 \
    -keyout /out/server.key \
    -out /out/server.pem \
    -days 730 \
    -nodes \
    -subj "/CN=ocserv.local"

RUN openssl x509 -in /out/server.pem -noout -pubkey | \
    openssl pkey -pubin -outform DER | \
    openssl dgst -sha256 -binary | \
    openssl base64 > /fingerprint.txt

COPY start.sh.template /start.sh.template
RUN FINGERPRINT=$(cat /fingerprint.txt) && \
    sed "s|FINGERPRINT_PLACEHOLDER|$FINGERPRINT|g" /start.sh.template > /out/start.sh
RUN chmod +x /out/start.sh

CMD [ "ls", "-l", "/out" ]
