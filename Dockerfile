FROM alpine:3.18

RUN apk add --no-cache curl jq

COPY entrypoint.sh /workdir/entrypoint.sh

WORKDIR /workdir

RUN chmod +x /workdir/entrypoint.sh

ENTRYPOINT ["/workdir/entrypoint.sh" ]