---
title: "Commands"
description: "Main commands when using hof for code generation"
brief: "of the hof CLI"

weight: 10
---

`hof` has several commands typically run during daily development.
The `first-example` will introduce you to these commands
and each has a dedicated section for the topic as well.

### hof

Top level commands and help message

{{<codePane file="code/cmd-help/hof" title="$ hof help" lang="text">}}


### hof / datamodel

Used for data model management (dm for short)

{{<codePane file="code/cmd-help/dm" title="$ hof help datamodel" lang="text">}}

See the [Data Modeling section](/data-modeling) for details.


### hof / flow

Build workflows and script with CUE and a DAG engine

{{<codePane file="code/cmd-help/flow" title="$ hof help flow" lang="text">}}

### hof / gen

Code generation

{{<codePane file="code/cmd-help/gen" title="$ hof help gen" lang="text">}}

### hof / mod

Used for managing Hof and CUE modules.

```sh
# start a module
hof mod init cue hof.io/docs/example

# update the dependencies
hof mod vendor cue
```


{{<codePane file="code/cmd-help/mod" title="$ hof help mod" lang="text">}}

See [GitHub Issues](https://github.com/hofstadter-io/hof/issues?q=is%3Aissue+is%3Aopen+label%3A%22area+%2F+mod%22)
for upcoming features.

