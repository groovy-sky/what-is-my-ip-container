FROM golang:1.19-alpine as base

RUN install github.com/groovy-sky/what-is-my-ip-container/v2@latest

FROM scratch:latest

COPY --from=base /go/bin/what-is-my-ip-container /main

ENTRYPOINT ["/main"]