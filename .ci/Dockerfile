FROM alpine:latest
RUN apk add --no-cache openconnect curl
COPY --from=cert /out/start.sh .
CMD [ "tail", "-f", "/dev/null" ]
