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
while also showing concrete examples of `hof render -T` variaions.
{{</lead>}}

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

It would be a burden to put this all on CUE to figure out and maintain.
By using text interpolation, we can generate types without modifying CUE.

### A Type DSL

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


---



More advanced walkthrough and discussion in...

1. CUE, Schema, and some types
1. Generating Go types
1. SQL & TS (multiple languages)
1. REST & DB lib stubs (not just types)

(show how to convert to a generator module)

Briefly mention and link to

1. Generating types from more vanilla CUE (field: string, rather than DSL)
1. Generate for a framework

