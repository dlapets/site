package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/jackc/pgx/v5"
	"github.com/joho/godotenv"
)

const (
	Port = ":8080"
)

func main() {
	// Load env
	err := godotenv.Load()
	if err != nil {
		log.Panicf("failed to load .env file: %s", err)
	}

	port := os.Getenv("SERVER_PORT")
	if port == "" {
		log.Panicf("missing SERVER_PORT")
	}
	log.Printf("server port: %s", port)

	staticDir := os.Getenv("SERVER_STATIC_CONTENT_DIR")
	if staticDir == "" {
		log.Panicf("missing SERVER_STATIC_CONTENT_DIR")
	}
	log.Printf("static content dir: %s", staticDir)

	// Set up handlers
	http.HandleFunc("/", handler)

	// Use file server for image files/etc. for now.
	http.Handle(
		"/images/{name}",
		http.StripPrefix("/images/", http.FileServer(http.Dir(staticDir))),
	)

	// Serve
	log.Fatal(http.ListenAndServe(":"+port, nil))
}

// TODO Remove this junk
func handler(w http.ResponseWriter, r *http.Request) {
	log.Println("GOT A REQUEST FOR 1", r)
	// urlExample := "postgres://username:password@localhost:5432/database_name"
	conn, err := pgx.Connect(context.Background(), os.Getenv("DATABASE_URL"))
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		os.Exit(1)
	}
	defer conn.Close(context.Background())

	w.Write([]byte("fdsafdas"))
}
func handler2(w http.ResponseWriter, r *http.Request) {
	log.Println("GOT A REQUEST FOR 2", r)
	w.Write([]byte("RUIEOWRUIEOW"))
}
