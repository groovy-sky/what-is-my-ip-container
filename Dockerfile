FROM golang:1.19-alpine as base

RUN go install github.com/groovy-sky/what-is-my-ip-container/v2@latest

ENTRYPOINT ["/what-is-my-ip-container"]