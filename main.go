package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("Running a basic golang application on alpine docker image...")
	fmt.Print("Getting time: ")
	fmt.Println(time.Now())

	time.Local, _ = time.LoadLocation("America/Sao_Paulo")
	fmt.Print("Getting Sao Paulo time: ")
	fmt.Println(time.Now())
}
