---
title: "HofGeneratorFile"
weight: 10
---

{{<lead>}}
`HofGeneratorFile` is the schema for a generated file.
The generator `Out` field is a list of these
and what `hof` iterates over and processes.
{{</lead>}}

<br>

[Source on GitHub](https://github.com/hofstadter-io/hof/blob/_dev/schema/gen/file.cue)

{{< codePane title="file.cue" file="code/hof-schemas/file.html" >}}


### Creator Fields

`#HofGeneratorFile` is only for generator creators.


##### In

The input data used when rendering the template.

##### Filepath

The full filepath within the outdir to generate.

##### Template, TemplateName

You must specify one or the other.
`Template` is content whereas `TemplateName`
references one of the predefined templates.

##### TemplateConfig

The configuration for this template.
Defaults to the configuration defined in the generator.
Typically only needed when you need alternative delimitors.
