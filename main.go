package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
)

func httpTriggerHandler(w http.ResponseWriter, r *http.Request) {
	if r.Header.Get("X-Forwarded-For") != "" {
		w.Write([]byte(strings.Split(r.Header.Get("X-Forwarded-For"), ":")[0]))
	} else if r.Header.Get("Host") != "" {
		w.Write([]byte(strings.Split(r.Header.Get("Host"), ":")[0]))
	} else if r.RemoteAddr != "" {
		w.Write([]byte(strings.Split(r.RemoteAddr, ":")[0]))
	}
}

func main() {
	httpInvokerPort, exists := os.LookupEnv("FUNCTIONS_HTTPWORKER_PORT")
	if exists {
		fmt.Println("FUNCTIONS_HTTPWORKER_PORT: " + httpInvokerPort)
	} else {
		httpInvokerPort = "8080"
	}
	mux := http.NewServeMux()
	mux.HandleFunc("/", httpTriggerHandler)
	log.Println("Go server Listening...on httpInvokerPort:", httpInvokerPort)
	log.Fatal(http.ListenAndServe(":"+httpInvokerPort, mux))
}
