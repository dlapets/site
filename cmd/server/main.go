package main

import (
	"log"
	"net/http"
)

const (
	Port = ":8080"
)

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(Port, nil))
}

func handler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("fdsafdas"))
}
