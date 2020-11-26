---
title: "Installation"
weight: 3
---

__hof__ is available for all major operation systems
and architectures. Thank you to the Golang developers, Goreleaser, and the community!

You will only need to install __hof__ once like this.
__hof__ has an update command which you can use to check and install any version with.

## Precompiled binaries

Download a precompiled binary from the github
[releases page](https://github.com/hofstadter-io/hof/releases).

The latest release is [v0.5.11](https://github.com/hofstadter-io/hof/releases/tag/v0.5.11)


## Test the installation

To make sure the tool is available, run

```sh
hof help
```

## Updating __hof__

```sh
# Check for an update
hof update --check

# Update to the latest version
hof update

# Install a specific version
hof update --version vX.Y.Z
```


## Build from source

You can clone and compile the latest on `_dev` with:

```sh
git clone https://github.com/hofstadter-io/hof

go mod vendor

go install ./cmd/hof
```


## Windows Users

There may be issues with your anti-virus and
trusting the binary as well as the "`$HOME/.hof`" directory.

