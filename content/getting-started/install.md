---
title: "Install"
description: "Install the hof cli tool"
brief: "the hof cli"
weight: 3
---

__hof__ is available for all major operation systems
and architectures. Thank you to the Golang developers, Goreleaser, and the community!

## Download

Current version: <b>{{<hof-rel-link>}}</b>

{{<codeInner lang="sh">}}
hof update --check

or

go install github.com/hofstadter-io/hof/cmd/hof@latest

or

go install github.com/hofstadter-io/hof/cmd/hof@{{<hof-version>}}
{{</codeInner>}}

<br>

{{<hof-dl-btns>}}

<br>

Container images are also available on [docker hub](https://hub.docker.com/r/hofstadter/hof/tags).


##### You'll want to rename the file to `hof` and ensure it is executable and in your PATH.

<br>

You can also download a precompiled binary from the github
__[releases page](https://github.com/hofstadter-io/hof/releases)__.

Instructions for compiling can be found on GitHub.


## Test the installation

To make sure the tool is available, run the following in your terminal.

{{<codeInner lang="sh">}}
$ hof help

hof - the high code framework

  Learn more at https://docs.hofstadter.io
	
...
{{</codeInner>}}

## Updating __hof__

The builtin update command can be used to check and install any version.

{{<codeInner lang="sh">}}
# Check for an update
hof update --check

# Update to the latest version
hof update

# Install a specific version
hof update --version vX.Y.Z
{{</codeInner>}}


