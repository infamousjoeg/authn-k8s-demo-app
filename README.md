# authn-k8s-demo-app

A Golang-based demonstration application that just repeats back values that are given to it by various means.

## Environment Variable

The environment variable binary will read two (2) environment variable values and report them to STDOUT:

* DB_USERNAME
* DB_PASSWORD

### Compile Binaries

To compile the application into binaries for Linux, MacOS (AMD & ARM) and Windows, run the following command from the root of this repository:

```shell
make compile-env
```

All compiled binaries will be output into the [bin/]() directory.

### Testing

Ensure [Summon](https://cyberark.github.io/summon) and the [Summon Conjur provider](https://github.com/cyberark/summon-conjur) is installed.

#### Without Comiling Binary

From the root directory of this repository, execute the following command:

```shell
summon make run-env
```

#### After Compiling Binary

From the root directory of this repository, execute the following command while setting `OS` and `ARCH` to your local environment values:

```shell
OS=darwin
ARCH=amd64
summon ./bin/authn-k8s-env-$OS-$ARCH
```

## Conjur API

Under development

## Kubernetes Secrets

Under development

## License

MIT