---
title: "Install"
brief: "the hof tool"
weight: 3
---

__hof__ is available for all major operation systems
and architectures. Thank you to the Golang developers, Goreleaser, and the community!

## Precompiled binaries

Download a precompiled binary from the github
__[releases page](https://github.com/hofstadter-io/hof/releases)__.
Then install __hof__ where you normally install tools or binaries.

The latest release is 
<b>{{<hof-dl-link>}}</b>

## Test the installation

To make sure the tool is available, run

```sh
hof help
```

## Updating __hof__

You will only need to manually download __hof__ once.
The update command can be used to check and install any version.

```sh
# Check for an update
hof update --check

# Update to the latest version
hof update

# Install a specific version
hof update --version vX.Y.Z
```


## Windows Users

There may be issues with your anti-virus or
trusting the binary as well as the "`$HOME/.hof`" directory.

