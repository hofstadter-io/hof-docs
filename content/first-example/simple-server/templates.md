---
title: "Templates"
brief: "the implementation"
weight: 20
---

{{<lead>}}
Templates are the implementation for your generator.
These parameterized files which are filled in
with data from the schema.
{{</lead>}}


- uses Go `text/template` or `Raymond` (mustache)
- can be a string in CUE or a file on disk
- partial templates for reusing common sections

TODO: document and link the template helpers available
(builtin + https://github.com/hofstadter-io/hof/blob/_dev/lib/templates/helpers.go#L36)

### Once Templates

<br>

{{<codePane lang="text" title="templates/go.mod" file="code/first-example/simple-server/templates/go.mod">}}
{{<codePane lang="go" title="templates/server.go" file="code/first-example/simple-server/templates/server.go">}}
{{<codePane lang="go" title="templates/router.go" file="code/first-example/simple-server/templates/router.go">}}
{{<codePane lang="go" title="templates/middleware.go" file="code/first-example/simple-server/templates/middleware.go">}}


We separate the handler into a template which uses the partial.
This is for demonstration purpose here and will be more useful
in the "full-example" section where the implementation is more complete.

{{<codePane lang="go" title="templates/route.go" file="code/first-example/simple-server/templates/route.go">}}
{{<codePane lang="go" title="partials/handler.go" file="code/first-example/simple-server/partials/handler.go">}}

### Rendered Files

Here we can see the result of code generation for a sample of the files

{{<codePane lang="go" title="output/middleware.go" file="code/first-example/simple-server/example/output/middleware.go">}}
{{<codePane lang="go" title="output/router.go" file="code/first-example/simple-server/example/output/router.go">}}
{{<codePane lang="go" title="output/routes/Hello.go" file="code/first-example/simple-server/example/output/routes/Hello.go">}}

