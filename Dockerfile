FROM golang:1.19-alpine as base

RUN go build main.go && cmod +x main

FROM alpine:latest

COPY --from=base main /main

ENTRYPOINT ["/main"]