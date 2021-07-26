# Make is verbose by default. Make it silent.
MAKEFLAGS += --silent

# run-env will perform go run on main.go for authn-k8s-env
run-env:
	go run cmd/authn-k8s-env/main.go

# build-env will compile authn-k8s-env based on your current GOOS and GOARCH
build-env:
	go build -o bin/authn-k8s-env cmd/authn-k8s-env/main.go
	echo "Compiled authn-k8s-env into bin/."

# compile-env will compile Linux, MacOS and Windows binaries
compile-env:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o bin/authn-k8s-env-nix-amd64 cmd/authn-k8s-env/main.go
	echo "Compiled authn-k8s-env-nix-amd64 into bin/."
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o bin/authn-k8s-env-darwin-amd64 cmd/authn-k8s-env/main.go
	echo "Compiled authn-k8s-env-darwin-amd64 into bin/."
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -o bin/authn-k8s-env-darwin-arm64 cmd/authn-k8s-env/main.go
	echo "Compiled authn-k8s-env-darwin-arm64 into bin/."
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o bin/authn-k8s-env-win-amd64 cmd/authn-k8s-env/main.go
	echo "Compiled authn-k8s-env-win-amd64.exe into bin/."