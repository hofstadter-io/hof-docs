---
title: "Template"
weight: 15
---

{{<lead>}}
The template config schemas are the parameters
for the different available rendering engines.
{{</lead>}}

<br>

[Source on GitHub](https://github.com/hofstadter-io/hof/blob/_dev/schema/gen/template.cue)

{{< codePane title="template.cue" file="code/hof-schemas/template.html" >}}


### #DefaultTemplateConfig

This defines the defaults for other configurations.
The values here will replace any fields which are set to `.`

### #TemplateConfigReplacible

This defines the configuration for a template rendering.

##### TemplateSystem

You can choose between

- Go's `text/template` (https://pkg.go.dev/text/template)
- Raymond Mustache (https://github.com/aymerick/raymond)

They have different tradeoffs and you can
use both from a single generator.

##### Other fields

These fields are used for controlling the
template delimitors and a swap set
if you want to generate files which
themselves have template delimitors.

See [t.b.d]() for details on when and how to use these.
