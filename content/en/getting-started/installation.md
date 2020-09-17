---
title: "Installing hof"
weight: 3
---

__hof__ is available for all major operation systems
and architectures. Thank you to the Golang developers, Goreleaser, and the community!


## Precompiled Binaries

Download a precompiled binary from the github
[releases page](https://github.com/hofstadter-io/hof/releases).

The latest release is [v0.5.10](https://github.com/hofstadter-io/hof/releases/tag/v0.5.10)


## Test the installation

Run `hof help` to make sure the tool is available.


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

