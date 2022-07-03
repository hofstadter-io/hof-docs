---
title: "Type Rendering"
description: "Render types in multiple languages from CUE with hof"
brief: "with CUE + text/template"

weight: 11
---

{{<lead>}}
One of the common questions for CUE is
how to generate the matching types in a given language.
We will introduce the ideas and complexities with type generation
while also showing concrete examples of `hof render -T` variations.
{{</lead>}}

{{<alert style="success">}}
The `hof render` command is available in the next beta.

```
go install github.com/hofstadter-io/hof/cmd/hof@v0.6.3-beta.1
```

[Download binaries on GitHub](https://github.com/hofstadter-io/hof/releases/tag/v0.6.3-beta.1)
{{</alert>}}

### Generating Types

CUE is a great language for defining types and their validations,
but how do we turn them into the structs, classes, and other
language specific representations?

Right now, and generally, the answer is `text/template`.
Right new because CUE does not have this capability.
Generally because CUE cannot capture
the variety and nuances between languages.
What are these complications?

- OOP vs structural typing, how do you express inheriance or embedding?
- CUE's types often look like a Venn Diagram with a languages types
- Native validation will be faster, will also need to be generated.
- Casing preferences per language
- Public, private, and protected visibilty
- Default values, when and where they are setup

It would be a burden to put this all on CUE developers to figure out and maintain.
By using text interpolation, we can generate types without modifying CUE.
_Note, CUE does intend to support some language targets, but there
is no timeline for when this will happen yet or what it will look like._

### Type DSLs

We believe that using a DSL, rather than native CUE expressions,
is the better option. There are many things which we cannot
express directly in CUE types and constraints, and using
attributes requires the tool to understand these.
So in order to provide maximal flexibility to experiment
without needing to modify `cue` or `hof`, we use DSLs.
Fortunatedly, CUE makes it easy to create and validate DSLs,
it's just a perspective of CUE values afterall.

Another hard question is "is there a single type schema or DSL to rule them all?"
Probably not, though one might be able to capture the majority of cases.
As defined, the type DSLs and schemas can be extended or specialized, like any CUE value.
This will give the community a way to combine and specialize them as needed.


### A Type Schema

With `hof`, we are building some resuable data model schemas.
This subsection will show you a simplified version for demonstration.

- schema
- example types used


### Go Structs

- single file template
- repeated templates

### SQL & TypeScript

- multiple templates
- non-cue type ID (uuid, etc...)

### Protobuf

Show issue with indexing, consistent ordering

(turn Ordered* into a default calculation, so user can always write their own)

### More than types

1. REST & DB lib stubs (not just types)

- partials, introduce here, or earlier and expand here

### Generator Module

Show how to convert to a generator module

---



More advanced walkthrough and discussion in...



Briefly mention and link to

1. Generating types from more vanilla CUE (field: string, rather than DSL)
1. Generate for a framework

