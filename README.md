# authn-k8s-demo-app <!-- omit in toc -->

A simple Golang-based application that echos environment variables given to it on a continuous loop. 

This is an updated version of `go-app` developed by Evan Litwak (@daswak).

- [Environment Requirements](#environment-requirements)
- [How does it work?](#how-does-it-work)
- [Compiling](#compiling)
- [License](#license)

## Environment Requirements

`CONJUR_USER_OBJECT`
The variable path to the username as it exists in Conjur.

`CONJUR_PASS_OBJECT`
The variable path to the password as it exists in Conjur.

`CONJUR_APPLIANCE`
The Base URL of the Conjur API service.

`CONJUR_ACCOUNT`
The org account established during initial deployment of Conjur.

## How does it work?

_The application will first look for relevant Kubernetes Secrets to use, by default._ If none are found, it is assumed that the CyberArk Conjur authn-k8s will be used for secure secrets retrieval.

__NOTE:__ _Italics denote "Under Development"._

## Compiling

To build a binary for your current environment:

```shell
make build
```

To build a binary for every OS and ARCH supported:

```shell
make compile
```

All compiled binaries will be placed in the [bin/]() directory of this repository.

## License

MIT