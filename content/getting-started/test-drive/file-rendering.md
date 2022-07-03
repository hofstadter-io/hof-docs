---
title: "File Rendering"
description: "Render any file from data and templates"
brief: "with data and templates"

weight: 10
---

{{<lead>}}
Code generation is central to `hof`.
By rendering templates with data,
we can generate any file for any language or framework.
{{</lead>}}

`hof` has two commands for
template based code generation.

1. `hof render` handles simple or adhoc cases
2. `hof gen` is based on composable modules

We will only be covering `hof render` in this section.
The [first example](/first-example) takes you through
the process of creating and using a generator module with `hof gen`.
The concepts and processing are the same,
in fact `hof render` creates a generator behind the scenes.


### Data + Templates

`hof render`, in the simplest form, is just rendering templates with data.

{{<codePane3
	title1="hof render interlude.json -T interlude.template" file1="code/getting-started/test-drive/file-rendering/interlude.txt" lang1="txt"
	title2="interlude.json" file2="code/getting-started/test-drive/file-rendering/interlude.json" lang2="json"
	title3="interlude.template" file3="code/getting-started/test-drive/file-rendering/interlude.template" lang3="txt"
>}}

You can also pipe any data into `hof render` by using a "`-`" (hyphen).
This can be helpful when you want to render
an API response or process output.

{{<codeInner lang="sh" title="pipe data into hof">}}
curl api.com  | hof render -T template.txt -
cat data.json | hof render -T template.txt -
{{</codeInner>}}

### Using CUE

`hof render` arguments are CUE entrypoints, same as `cue export`.
We can use this to enforce a schema or transform the data.

{{<codePane2
	title1="schema.cue" file1="code/getting-started/test-drive/file-rendering/schema.html"
	title2="data.yaml" file2="code/getting-started/test-drive/file-rendering/data.yaml" lang2="yaml"
>}}

If we run `hof render data.yaml schema.cue -T stories.md`,
we will get an error message:

`0.points: incomplete value >0 & int`

Oops, we forgot to set the points on a story.


### T Flag Mappings

The `-T` flag for `hof render` has a flexible format:

`-T "<template-path>:<input-path>[@schema-path];<out-path>"`

This enables you to

1. Render multiple templates by using `-T` more than once
1. Select a value with `:<input-path>`
1. Select a schema with `@<schema-path>`
1. Write to file with `;<out-path>`
1. Control the output filename with `;{{ .name }}.txt`
1. Render a single template multiple times with `;[]{{ .filepath }}`

<br>

{{<codeInner title="-T variations" lang="txt">}}
hof render input.cue ...

  # Generate multiple templates at once
  -T templateA.txt -T templateB.txt

  # Select a sub-input value by CUEpath (. for root)
  -T 'templateA.txt:foo'
  -T 'templateB.txt:sub.val'

  # Choose a schema with @
  -T 'templateA.txt:foo@#foo'
  -T 'templateB.txt:sub.val@schemas.val'

  # Writing to file with ; (semicolon)
  -T 'templateA.txt;a.txt'
  -T 'templateB.txt:sub.val@schema;b.txt'

  # Templated output path 
  -T 'templateA.txt:;{{ .name | lower }}.txt'

  # Repeated templates are used when
  # 1. the output has a '[]' prefix
  # 2. the input is a list or array
  #   The template will be processed per entry
  #   This also requires using a templated outpath
  -T 'template.txt:items;[]out/{{ .filepath }}.txt'
{{</codeInner>}}

We will see these options used in the next section.
You can also find examples in the
[hof render tests](https://github.com/hofstadter-io/hof/tree/_dev/test/render).

