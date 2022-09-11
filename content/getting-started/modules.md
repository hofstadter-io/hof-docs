---
title: "Modules"
brief: "for reusable CUE and code generation"

weight: 20
---

### Hof Modules

Every __hof generator__ is also a __CUE module__,
and in fact, many of hof's other features can
be used from the module system.

"`hof mod`" is the subcommand based on Go modules
for working with CUE modules and managing dependencies.
The logic and format is the same, with much code shared between the implementations.
Currently, while CUE is module aware and supports imports,
it does not yet have dependency management, but it will work the same as well.
This page has a brief overview. The commands will
be repeated when you need to run them on other pages.

`hof mod` subcommands:

- `hof mod init cue github.com/user/repo` initializes a new module
- `hof mod vendor cue` fetches dependencies into `cue.mod/pkg/...`

The name of a module must be the same the git repository.
`hof` talks directly to git repositiories and many of
`hof`'s commands will accept repositories as input too.

The files and directories that make up a module:

- `cue.mods` is where dependencies and versions are set, you write this file.
- `cue.sums` contains the checksums for all dependencies and is managed by `hof mod`
- `cue.mod/module.cue` denotes a CUE module and has a sinlge line
- `cue.mod/pkg/...` is where the code for dependencies is located after fetching

{{<codeInner title="cue.mods">}}
module github.com/user/repo

cue {{<cue-version>}}

require (
	github.com/hofstadter-io/hof {{<hof-version>}}
)
{{</codeInner>}}

{{<codeInner title="cue.mod/module.cue">}}
module: "github.com/user/repo"
{{</codeInner>}}
