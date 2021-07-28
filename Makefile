# Make is verbose by default. Make it silent.
MAKEFLAGS += --silent

# run-env will perform go run on main.go for authn-k8s-env
run:
	go run cmd/main.go

# build-env will compile authn-k8s-env based on your current GOOS and GOARCH
build:
	go build -o bin/ cmd/main.go
	echo "Compiled authn-k8s-demo-app into bin/."

# compile-env will compile Linux, MacOS and Windows binaries
compile:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o bin/authn-k8s-demo-app-nix-amd64 cmd/main.go
	echo "Compiled authn-k8s-demo-app-nix-amd64 into bin/."
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o bin/authn-k8s-demo-app-darwin-amd64 cmd/main.go
	echo "Compiled authn-k8s-demo-app-darwin-amd64 into bin/."
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -o bin/authn-k8s-demo-app-darwin-arm64 cmd/main.go
	echo "Compiled authn-k8s-demo-app-darwin-arm64 into bin/."
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o bin/authn-k8s-demo-app-win-amd64 cmd/main.go
	echo "Compiled authn-k8s-demo-app-win-amd64.exe into bin/."