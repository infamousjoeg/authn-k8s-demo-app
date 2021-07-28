package main

import (
	"log"
	"os"

	"github.com/cyberark/conjur-api-go/conjurapi"
)

//ENV Vars for def in K8s:
// CONJUR_PASS_OBJECT, CONJUR_USER_OBJECT, CONJUR_APPLIANCE, CONJUR_ACCOUNT

var (
	//Defining Username & Password objects to retrieve, as per 12 factor
	//this is being accomplished via env variables.
	variableUserIdentifier = os.Getenv("CONJUR_USER_OBJECT")
	variableIdentifier     = os.Getenv("CONJUR_PASS_OBJECT")
	conjurApplianceURL     = os.Getenv("CONJUR_APPLIANCE")
	conjurAccount          = os.Getenv("CONJUR_ACCOUNT")
)

func main() {

	//Create Conjur config for client
	conjurConfig := conjurapi.Config{
		Account:      conjurAccount,
		ApplianceURL: conjurApplianceURL,
	}

	//Get Authorization token from shared store from sidecar
	conjur, err := conjurapi.NewClientFromTokenFile(conjurConfig, "/run/conjur/access-token")

	if err != nil {
		panic(err)
	}

	//Grab Password from Conjur
	secretValue, err := conjur.RetrieveSecret(variableIdentifier)
	if err != nil {
		panic(err)
	}

	//Grab Username from Conjur
	secretValueUser, err := conjur.RetrieveSecret(variableUserIdentifier)
	if err != nil {
		panic(err)
	}

	//Display Username & Password in log.
	log.Printf("%s:%s", "The Username Used: ", secretValueUser)
	log.Printf("%s:%s", "The Password Used: ", secretValue)
}
