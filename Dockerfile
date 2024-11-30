# Stage 1: build the application  
FROM golang:1.17-alpine as builder  
  
WORKDIR /src  
  
RUN go get -d -v github.com/groovy-sky/what-is-my-ip-container/v2  
RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/what-is-my-ip-container github.com/groovy-sky/what-is-my-ip-container/v2  
  
# Stage 2: create a minimal image with the built binary  
FROM scratch  
  
COPY --from=builder /bin/what-is-my-ip-container /what-is-my-ip-container  
  
ENTRYPOINT ["/what-is-my-ip-container"]  
