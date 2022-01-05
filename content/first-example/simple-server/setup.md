---
title: "Setup"
brief: "a directory"
weight: 5
---

{{<lead>}}
Generators have a common files and a directory structure.
{{</lead>}}

{{<codeInner title="Typical directory structure">}}
# CUE files for our schema and hof generator
schema/
gen/

# files used by the hof generator
templates/
partials/
static/

# sample usage of our generator
examples/
{{</codeInner>}}

You will often have other files depending on the languages or technologies you choose.
A common example is dependency management files.

### Modules

Almost every __hof  generator__ is also a CUE module.
`hof mod` is a subcommand for working with Go style module systems.
We use it as an iterim tool until `cue mod` is implemented upstream.

For more information about `hof mod`, see

- [Modules and Packages](https://cuetorials.com/first-steps/modules-and-packages/) for working with CUE modules.
- [Futurology / Dependency Management](https://cuetorials.com/cueology/futurology/dependency-management/) to learn about `cue mod`.

### Example

Throught the `first-example` section,
we will be developing a `hof` geneartor as a module.
We will use `hof.io/docs/first-example` as the name.



{{<codeInner title="Create a CUE module">}}
mkdir example && cd example
hof mod init cue hof.io/example
{{</codeInner>}}

{{<codeInner title="Create the common directories">}}
mkdir schema gen templates partials static examples
{{</codeInner>}}
