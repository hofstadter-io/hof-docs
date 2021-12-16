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

{{<codePane lang="text" title="templates/go.mod" file="code/getting-started/first-example/templates/go.mod">}}
{{<codePane lang="go" title="templates/server.go" file="code/getting-started/first-example/templates/server.go">}}
{{<codePane lang="go" title="templates/router.go" file="code/getting-started/first-example/templates/router.go">}}
{{<codePane lang="go" title="templates/middleware.go" file="code/getting-started/first-example/templates/middleware.go">}}

### Repeated Templates

We separate the handler into a template which uses the partial.
This is for demonstration purpose here and will be more useful
in the "full-example" section where the implementation is more complete.

{{<codePane lang="go" title="templates/route.go" file="code/getting-started/first-example/templates/route.go">}}
{{<codePane lang="go" title="partials/handler.go" file="code/getting-started/first-example/partials/handler.go">}}

