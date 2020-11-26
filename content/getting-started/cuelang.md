---
title: "Cuelang"

weight: 9
---

__hof__ leverages [CUE (configure, unify, execute)](https://culenag.org) throughout,
built into the core, extended to contexts, and as the core user or developer experience.
This decision was made for two initial reasons.

1. we are essentially writing configuration for software and source code when we write our designs and data models.
2. CUE is the best system for configuration tasks after our survey and attempt at writing our own.

CUE is the best for many reasons (in our opinions):

- philosophically sound
- declarative through unification
- purpose built language, system, and tools
- shared heritage with Golang, Kubernetes, GCL/Borgcfg

You can learn more about CUE from these links:

- https://cuelang.org
- [Learn about CUE](https://cuelang.org/docs/about/)
- [Core issues addressed by CUE](https://cuelang.org/docs/usecases/configuration/)
- [Read about the Logic of CUE](https://cuelang.org/docs/concepts/logic/)
- [Go through the tutorials](https://cuelang.org/docs/tutorials/)
- [CUE GitHub Discussions](https://github.com/cuelang/cue/discussions)
- [The CUE Language Specification](https://cuelang.org/docs/references/spec/)


## __hof__ uses CUE v0.3.0

You will find additional discussions in this documentation
which talk about CUE as we introduce new syntax and concepts.

_note, Cue v0.3.0 is still in alpha stage but becoming increasingly stable.
See https://github.com/cuelang/cue for the current status._

