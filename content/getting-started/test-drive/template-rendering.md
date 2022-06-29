---
title: "Template Rendering"
description: "Render any file from CUE or data with text templating"
brief: "with CUE + text/template"

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

