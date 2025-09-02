FROM alpine:latest
RUN apk add --no-cache openconnect curl
COPY start.sh .
CMD [ "tail", "-f", "/dev/null" ]
