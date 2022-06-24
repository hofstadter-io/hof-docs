---
title: "hof / render"
linkTitle: "hof / render"
weight: 25
---

{{<lead>}}
`hof render` joins CUE with Go's text/template system and diff3.
Create on-liners to generate any file from any data,
edit and regenerate those files while keeping changes.
{{</lead>}}

<br>

{{<alert style="success">}}
This command is only available on tip and requires building from source.

```
go install github.com/hofstadter-io/hof/cmd/hof@_dev
```
{{</alert>}}

<br>

#### Learn about writing templates, with extra functions and helpers

https://docs.hofstadter.io/code-generation/template-writing/

<br>

#### Check the tests for complete examples

https://github.com/hofstadter-io/hof/tree/_dev/test/render

<br>

#### Want to use and compose code gen modules and dependencies?

hof gen is a scaled out version of this command

`hof gen app.cue -g frontend -g backend -g migrations`

<br>

#### Command Help

<br>

{{<codePane file="code/cmd-help/render" title="$ hof help render" lang="text">}}

{{< childpages >}}

