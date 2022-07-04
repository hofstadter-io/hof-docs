---
title: "harmony"
weight: 50
---

{{<lead>}}
`hof render` joins CUE with Go's text/template system and diff3.
Create on-liners to generate any file from any data,
edit and regenerate those files while keeping changes.
{{</lead>}}

<br>

{{<beta style="success">}}

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

