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
A common example are the files for dependency management like `package.json` and `go.mod`.
There are no restrictions or limits on what you can include.

### Modules

Almost every __hof  generator__ is also a CUE module.
`hof mod` is a subcommand for working with Go style module systems.
We use it as an iterim tool until `cue mod` is implemented upstream.

For more information about `hof mod`, see

- [Modules and Packages](https://cuetorials.com/first-steps/modules-and-packages/) for working with CUE modules.
- [Futurology / Dependency Management](https://cuetorials.com/cueology/futurology/dependency-management/) to learn about `cue mod`.

### Example

Through the `first-example` section,
we will be developing a `hof` geneartor as a module.
The following steps will get your project setup.

{{<codeInner title="1. Start a CUE module">}}
mkdir first-example && cd first-example
hof mod init cue hof.io/docs/first-example
{{</codeInner>}}

{{<codeInner title="2. In cue.mods - add hof as a dependency">}}
require github.com/hofstadter-io/hof v0.6.2
{{</codeInner>}}

{{<codeInner title="3. Fetch CUE dependencies">}}
hof mod vendor cue
{{</codeInner>}}

{{<codeInner title="4. Create common sub-directories">}}
mkdir schema gen templates partials static examples
{{</codeInner>}}

Your working directory should now look like:

{{<codeInner title="Module layout">}}
first-example/
|
├── examples/
├── gen/
├── partials/
├── schema/
├── static/
├── templates/
|
├── cue.mods
├── cue.sums
└── cue.mod/
    ├── module.cue
    └── pkg/
        └── github.com/
            └── hofstadter-io/
                ├── ghacue/...
                ├── hof/...
                ├── hofmod-cli/...
                └── hofmod-cuefig/...
{{</codeInner>}}

