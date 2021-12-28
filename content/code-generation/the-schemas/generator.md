---
title: "HofGenerator"
weight: 5
---

{{<lead>}}
The `HofGenerator` is the schema for generators.
As a creator, this is the definition you will use
to define how an input is combined with templates
to produce the output files.
As a user, you will supply the input values
to a specific geneartor to create code.
{{</lead>}}

<br>

[Source on GitHub](https://github.com/hofstadter-io/hof/blob/_dev/schema/gen/generator.cue)

{{< codePane title="generator.cue" file="code/hof-schemas/generator.html" >}}


### Generator User Fields

These are fields that a user of a generator will typically fill in.
The following fields are the default suggested user inputs
You can decided to ignore these fields and
make any set of exposed input fields for your generators.

##### In

This is the primary input for users and will be used when rendering the templates.
_(need to check if this is provided as a root context on repeated templates,
or if that is set by creators, or is it the default applied when no input is
set on a per template basis)_

As a creator, you will likely want to provide a schema and set `In: #MySchema`.
This will make it easier for users to know if they have correctly specified
the required input.


##### Outdir

This is the base dir where the generator output will be written.

##### Other

`#HofGenerator` was left open so you can
specify any other inputs for your users.
This can be useful when you want more contextual inputs presented to the user
or you want to transform the user input before passing into the template system.

### Generator Creator Fields

##### Out

This is the primary field processed by `hof`.
Your generator should fill in this field based on the user input.
Each element will have both input and a template specified.
This is where the conditional logic for what to generate comes in.
More details can be found in the next section.


##### Templates, Partials, Statics

These are lists of templates, partials, and statics to load from disk,
relative to your generator module base directory.

##### Embedded{Templates,Partials,Statics}

These are inline or "in-cue" templates, partials, and static fils.


##### Generators

This is where you set sub-generators
that your generator builds on.
We have used this for

- Using one generator in another, for example to provide a more advanced CLI for our REST server binary.
- Building higher level generators, for example an APP which has Client, Server, and Database subgenerators with a single input.


##### PackageName

This is the CUE module name of your generator.
It is used for indexing into the `cue.mod` folder
to find your templates and partials from disk.

_(this will go away once CUE supports the @embed() for this purpose, and likely structural sharing will be needed as well)_


