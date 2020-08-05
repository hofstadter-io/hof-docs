---
title: "Connecting to Studios"
date: 2019-03-10
draft: false
type: "page"

weight: 4
---

The `hof` CLI requires a configuration file to
connect with the __Hofstadter Studios__ servers.
You can use the __hof__ tool to manage configurations
or edit the file directly.

```sh
hof config set-context "<context-name>" "<username>" "<apikey>" "https://studios.hofstadter.io"
```

- `context-name` can be anything
- `username` is your username
- `apikey` can be found in your [profile](https://studios.hofstadter.io/profile)


You can verify your configuration with:

```sh
hof config test
```

