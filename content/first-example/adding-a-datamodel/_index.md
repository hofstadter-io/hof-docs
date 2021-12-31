---
title: "Adding a Datamodel"
brief: "and generating types"

draft: true
weight: 20

---

Data modeling is core to the development process.
As our understanding of the problem changes,
so must our implementation.

`hof` has a data modeling system where you

- define you data models in CUE
- generate types, database tables, and API resources
- checkpoint the data model and maintain a history
- have the entire history available for generating migrations and tranformations

In this section, we will expand our `first-example`
to use `hof/dm.#Datamodel` and generate it
as a `Resource` in API terminology.
You will create templates and partials for
CRUD routes for managing a `Resource`.
Normal data storage will be covered later,

{{< childpages >}}
