---
title: "Setup"
brief: "a directory"
weight: 5
---

{{<lead>}}
Generators have common files and directories.
{{</lead>}}

{{<codeInner title="Typical directory structure">}}
# files for your schema and generators
schema/
generators/
creators/

# files for the code gen system
templates/
partials/
statics/

# sample usage of your generator
examples/
{{</codeInner>}}

You will often have other files depending on the languages or technologies you choose.
A common example are the files for dependency management like `package.json` and `go.mod`.
There are no restrictions or limits on what you can include.

### Hof Generator Modules

Every __hof generator__ is also a CUE __module__, 

"`hof mod`" is the subcommand for working with the module system.
You will see how to use it as we go through this first example.

You can learn more about `hof mod` from the
[Modules and Packages](https://cuetorials.com/first-steps/modules-and-packages/) section on Cuetorials.

### Bootstraping Your Geneartor

Throughout the `first-example` section,
we will be developing a `hof` geneartor as a module.
The following commands will bootstrap your generator.

{{<codeInner title="Setup Commands">}}
// create a directory
mkdir first-example && cd first-example
git init   // (optional)

// initialize a generator module
hof gen --init hof.io/docs/first-example
{{</codeInner>}}

Your working directory should now look like:

{{<codeInner title="Module layout">}}
first-example/
|  // default directories
├── creators/
├── examples/
├── generators/
├── partials/
├── schema/
├── statics/
├── templates/
|
|  // dependency files
├── cue.mods
├── cue.sums
└── cue.mod/
{{</codeInner>}}

