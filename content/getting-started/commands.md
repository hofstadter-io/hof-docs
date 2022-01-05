---
title: "Commands"
description: "Main commands when using hof for code generation"
brief: "of the hof CLI"

weight: 10
---

`hof` has several commands typically run during daily development.
The `first-example` will introduce you to these commands
and each has a dedicated section for the topic as well.


### hof mod

Used for managing Hof and CUE modules.

```sh
# start a module
hof mod init cue hof.io/docs/example

# update the dependencies
hof mod vendor cue
```

See [GitHub Issues](https://github.com/hofstadter-io/hof/issues?q=is%3Aissue+is%3Aopen+label%3A%22area+%2F+mod%22)
for upcoming features.

### hof gen

Used to generate code

```sh
hof gen [CUE entrypoints]
```

### hof dm

Used for data model management

```sh
hof dm list
hof dm info
hof dm diff
hof dm checkpoint
hof dm history

hof dm -h
```

See the [Data Modeling section](/data-modeling) for details.
