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

See [the datamodel docs](/data-modeling) to learn more

{{<codePane file="code/cmd-help/dm" title="$ hof help datamodel" lang="text">}}

See the [Data Modeling section](/data-modeling) for details.


### hof / flow

Build workflows and scripts with CUE and a DAG engine

See [the flow docs](/data-flow) to learn more

{{<codePane file="code/cmd-help/flow" title="$ hof help flow" lang="text">}}

### hof / gen

A polyglot code generation framework for module authors and users

{{<codePane file="code/cmd-help/gen" title="$ hof help gen" lang="text">}}

See [the code gen docs](/code-generation) to learn more

### hof / mod

Manage a MVS (Golang) style modules and dependencies.
Create custom module systems with a single config file.

Also, more typically, used as a stop gap for CUE modules until `cue mod` is implemented.

{{<codeInner title="typical usage">}}
# initialize a new module
hof mod init cue hof.io/docs/example

# download dependencies
hof mod vendor cue
{{</codeInner>}}

{{<codePane file="code/cmd-help/mod" title="$ hof help mod" lang="text">}}

