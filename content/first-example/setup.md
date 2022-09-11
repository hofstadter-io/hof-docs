---
title: "Setup"
brief: "a new hof generator"
weight: 5
---

{{<lead>}}
Generators are made of some CUE files and directories of templates.
You can run `hof gen --init <name>` to bootstrap a new generator module.
{{</lead>}}

### Bootstraping Your Geneartor

Throughout the first example, you will be
building a code generation module.
The following commands will create a new
directory, git repository, and hof generator
for you to start with.

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


You will often have other files depending on the languages or technologies you choose.
A common example are the files for dependency management like `package.json` and `go.mod`.
There are no restrictions or limits on what you can include.

The default directories:

- `schema` is where your schemas for the other parts go
- `generators` hold CUE files for specifiying your generators
- `templates`, `partials`, and `statics` are files for generators
- `creators` are often in a subdirectory with their own templates
- `examples` for using your generators, also helpful for testing
