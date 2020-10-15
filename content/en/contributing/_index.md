---
title: "Contributing"
linkTitle: "Contributing"
weight: 95
description: >
  Contribute to the hof and the docs
---

You can contribute this documentation site, the __hof__ tool, the myriad of `hofmods`,
or by creating your own modules, designs, and generators to share with others.

## Documentation Site

This is a [Hugo](https://gohugo.io) website based on the Docsy theme.
You can click the links found on the pages or
clone [the docs repo](https://github.com/hofstadter-io/hof-docs) and follow the readme instructions.

## The hof tool

If you are only changing the Gocode (and not the designs / *.cue files),
then you can follow the [Building from source](/getting-started/installation/#build-from-source) instructions.

If you intend to work on the schema, design, or co-dependent `hofmods`,
first follow the same instructions.

You will have to check the `cue.mods` file for any local replaces
(or to add any you want to work on yourself) by cloning
the repos into the correct location.

Once all of the `hofmods` are in place, you can vendor them by running:

```sh
hof mod vendor cue
```

and then update code from designs with:

```sh
hof gen [-g <generator>]
```

see the `hof.cue` file for available generators.

