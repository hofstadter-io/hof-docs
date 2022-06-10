---
title: "Adding a Data Model"
brief: "and generating types"

weight: 20
---

{{<lead>}}
Data modeling is core to the development process.
As our understanding of the problem changes,
so must our implementation.
{{</lead>}}

`hof` has a data modeling system where you

- define you data models in CUE
- generate types, database tables, and API resources
- checkpoint the data model and maintain a history
- have the entire history available for generating migrations and tranformations

This section expands on our `simple-server` to use `hof/dm.#Datamodel`.
We will generate Go types and a simple library around a Go map for storage.
CRUD routes are also generated from the same datamodel as a `Resource` in API terminology.
You will see how to customize both the code and the data model.

The full code for this section can be found on GitHub
[code/first-example/adding-a-datamodel](https://github.com/hofstadter-io/hof-docs/tree/main/code/first-example/adding-a-datamodel)

_Database storage and automatic CRUD handler generation
will be covered in more advanced sections._

{{<childpages childBriefs="true">}}

_dev note, swap todos for CUE values?_
- add extra section here for interesting CUE routes we could use?
