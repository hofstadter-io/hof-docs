---
title: "CUE"
description: "Getting started with Cuelang as the input to hof"
brief: "as the language for user and dev"

weight: 5
---

{{<lead>}}
__hof__ leverages [CUE (configure, unify, execute)](https://cuelang.org)
throughout and is core to the developer experience.
{{</lead>}}

This decision was made for two initial reasons.

1. __hof is declarative code generation.__
   We are essentially writing configuration when we write our input for code generation.
2. __CUE is purpose built for large scale configuration.__
   It has good theory and tooling for working with configuration spanning many files.

CUE is ideal for many reasons:

- looks like existing configuration while offering a full, logical language.
- philosophically sound and based on a strong heritage.
- declarative and logical, it proves that what you wrote is consistent and valid.
- purpose built language, system, and tools for large scale configuration.

You can learn more about CUE from these links:

- [Cuetorials](https://cuetorials.com) (maintained by us)
- https://cuelang.org
	- [Learn about CUE](https://cuelang.org/docs/about/)
	- [Core issues addressed by CUE](https://cuelang.org/docs/usecases/configuration/)
	- [Read about the Logic of CUE](https://cuelang.org/docs/concepts/logic/)
	- [Go through the tutorials](https://cuelang.org/docs/tutorials/)
	- [CUE GitHub Discussions](https://github.com/cue-lang/cue/discussions)
	- [The CUE Language Specification](https://cuelang.org/docs/references/spec/)


## __hof__ uses CUE {{<cue-version>}}


1. Purpose built language for config, use as a DSL, lift much of the logic to CUE 
1. Module aware, we get packages and dependenices for free, can combine schemas and generators in interesting ways