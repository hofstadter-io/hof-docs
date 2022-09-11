---
title: "CUE"
description: "Getting started with Cuelang as the input to hof"
brief: "as the language for user and dev"

weight: 5
---

{{<lead>}}
`hof` uses CUE (configure, unify, execute) for specifying inputs, schemas, and generators.
CUE is a proper language for configuration and is core to	`hof`'s developer experience.
{{</lead>}}

This decision was made for two initial reasons.

1. __hof is declarative code generation.__
   A generator is configuration for how to combine CUE and templates during code generation.
2. __CUE is purpose built for large scale configuration.__
   It has good theory and tooling for working with configuration spanning many files.

CUE is ideal for many reasons:

- looks like existing configuration while offering a full, logical language.
- philosophically sound and based on a strong heritage.
- declarative and logical, it proves that what you wrote is consistent and valid.
- purpose built language, system, and tools for large scale configuration.
- you get modules, packages, and dependenices for data, schemas, and configuration


Bitfield Consulting has a quick
[introduction to CUE from a JSON perspective](https://bitfieldconsulting.com/golang/cuelang-exciting).
This article is worth skimming through if you are unfamiliar with CUE.
You will see the basics of CUE that are used when working with `hof`.

For indepth CUE learning resources, use these sites:

- [CUE documentation](https://cuelang.org) (CUE Team)
- [Cuetorials](https://cuetorials.com) (Hofstadter)

