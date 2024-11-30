# Stage 1: build the application  
FROM golang:1.19-alpine as builder  
  
RUN go install github.com/groovy-sky/what-is-my-ip-container/v2@latest  
  
# Stage 2: create a minimal image with the built binary  
FROM scratch  
  
COPY --from=builder /go/bin/what-is-my-ip-container /what-is-my-ip-container  
  
ENTRYPOINT ["/what-is-my-ip-container"]  
