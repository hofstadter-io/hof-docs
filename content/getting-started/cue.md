---
title: "CUE"
description: "Getting started with Cuelang as the input to hof"
brief: "as the language for user and dev"

weight: 5
---

{{<lead>}}
`hof` uses CUE (configure, unify, execute) for specifying inputs, schemas, and generators.
CUE is a purpose built language for configuration and is core to	`hof`'s developer experience.
{{</lead>}}

This decision was made for two initial reasons.

1. __hof is declarative code generation.__
   A code generator is configuration for how to combine CUE, data, and templates during processing.
	 We can create reusable, modular, and composable generators, letting users provide application specifics.
	 From the source-of-truth CUE inputs, we can generate code across languages, technologies, and environments.

2. __CUE is purpose built for large scale configuration.__
   It has good theory and tooling for working with configuration spanning many files, packages, and modules.
	 Generators can import and use other generators, and adjust based on the user inputs.
	 Models and schemas can be shared across teams for consistent, versioned inputs to code generation.
	 CUE helps us write this efficiently and with confidence, validating whay we wrote is correct.

CUE is ideal for many reasons:

- looks like configuration while offering a full, logical language.
- philosophically sound and based on a strong heritage.
- declarative and logical, it proves that what you wrote is consistent and valid.
- purpose built language, system, and tools for large scale configuration.
- modules, packages, and dependency management for data, schemas, and configuration.


Bitfield Consulting has a quick
[introduction to CUE from a JSON perspective](https://bitfieldconsulting.com/golang/cuelang-exciting).
This article is worth skimming through if you are unfamiliar with CUE.
You will see the essential CUE for working with `hof`.

Keep these CUE learning resources at hand:

- [CUE documentation](https://cuelang.org) (CUE Team)
- [Cuetorials](https://cuetorials.com) (Hofstadter)

