package main

import (
	// Connectivity
	"github.com/aws/aws-sdk-go/aws/session"

	// Utility
	"fmt"
	"errors"
	"log"
	"os/exec"
)

func main() {
	verify()
	installLt()
}

func verify() (map[string]string, error) {
	sess, err := session.NewSessionWithOptions(session.Options{
		// Using ~/.aws/config defaults (~/.aws/credentials also used by default)
		SharedConfigState: session.SharedConfigEnable,
	})

	if err != nil {
		log.Fatal(err)
		return nil, errors.New("Error creating session")
	}

	result, err := sess.Config.Credentials.Get()
	if err != nil {
		log.Fatal(err)
		return nil, errors.New("Error getting credentials")
	}

	fmt.Println("Using credentials: ", result)

	return nil,nil;

}

func installLt() {

	out, err := exec.Command("./../launchscript.sh").Output()

	// err := cmd.Run()

	if err != nil {
		log.Fatal(err)
	} else {
		fmt.Print(string(out))
	}

}