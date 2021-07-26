package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
	// For without constraints loops forever
	for {
		// Get environment variable values for expected variables
		dbUsername := os.Getenv("DB_USERNAME")
		dbPassword := os.Getenv("DB_PASSWORD")
		// Print values of environment variables
		fmt.Println("Username: ", dbUsername)
		fmt.Println("Password: ", dbPassword)
		// Sleep for 5 seconds before looping
		time.Sleep(5 * time.Second)
	}
}
