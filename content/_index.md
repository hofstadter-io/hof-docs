---
title: Hofstadter Documentation
description: "Hofstadter Documentation"
---

{{<lead>}}
Welcome to the documentation site.
{{</lead>}}

# `hof` is a data model and code gen framework

<br>

The `hof` cli combines modular generators
and a language agnostic data model
to create code for any language or technology.
The goal is to enable code generation
that fits into your current development practices.
This means you can also customize the generated code
or use it for a small piece of an existing project.
`hof` knows what files it creates, if you
have modified them, and handles the details for you.

With `hof` you get living boilerplate or scaffolding.
Rather than a one-time bootstrapping at the beginning of development,
you can update your designs or data model and regenerate code.
This means when you add new types

- API endpoints will be created
- Database migrations will be calculated
- libraries and clients will be updated

`hof`'s code generation reaches deeper into the application code
to remove more of the repetative tasks and code patterns.
When using generator modules, you can combine them to
create sophisticated applications from a declarative design.


## We call this High Code development.

{{<lead>}}
Creating code with higher levels of design, reuse, and implementation
{{</lead>}}


## Why `hof`?

We wanted to

- stop writing repetative code found both within and across applications
- be language & technology agnostic
- have code gen that continued to help, rather than an upfront bootstrap
- reuse and combine code generation modules
- enable an ecosystem with generators authored and used by anyone


## What can you do with `hof`?

<br>

##### Use your own tools

`hof` is a tool you will add to your workflow.
We know developers have their own preferences for tools
from IDEs, languages, and platforms,
and `hof` can work with them 

`hof` is a cli tool that can work with any and all of these
and will never force you to use a clunky UI to build applications.

##### Generate anything

Applications all start as files and `hof` generates directories of files.
You can generate the source files, configuration, deployment, and CI files needed.
If it's made of files, you can generate it with `hof`.

##### Consolidate the data model

The same data model appears at each level of the tech stack.
You should only have to write it down once, as a _single-source of truth_.
More than just the shape, this should also include the rules.

##### Capture common code and application patterns

Whether it is writing api handlers, CRUD, client libraries, or data validation,
there are many patterns per data model.
There are also application wide patterns.
When starting server setup like logging and wiring up the router.

##### Manage model and application versions.

Data models evolve with an application and need management.
From updating the code and databased to deployment updates and supporting
older clients, you can have multiple versions being referenced.
You latest backend will need to handle many previous versions.

##### Work directly in the (re)generated code

With `hof` you write custom code directly in the generated output,
where it naturally belongs. Your final code should look the same.
When you change your data model or designs, `hof` uses diff3
to ensure your code is left in place and 

##### Share and control modules with dependency management

Sharing models and code generation is core to `hof`
and central to solving problems of interoperability between
different teams and services.
Both design and generators are managed with versions
and dependency management.

##### Apply fleet wide fixes and updates

Deploying shared security and bug fixes across many applications should be easier.
This should apply equally for improvements in our code patterns and practices.

##### Extensible generators and models

Both generators and models can be combined through dependencies and imports.
You can extend, override, or otherwise customize as you need.
They are separate from the tool so there is no need to change `hof` 
to enable new technologies or patterns.


