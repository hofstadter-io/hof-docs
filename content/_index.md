---
title: Hofstadter Documentation
description: "Hofstadter Documentation"
---

{{<lead>}}
Welcome to the __hof__ documentation site.
{{</lead>}}


## __hof__ is a code generator platform

<br>

{{<lead>}}
The __hof__ cli merges modular generators
and the designs which use them
to produce technology agnostic output.
The goal is to enable code generation
at scale that fits into your current
development practices.
{{</lead>}}

{{<lead>}}
__Fits in__ means you can use any set of technologies,
work directly in and modify the generated code,
update designs and regenerate the output,
all without disrupting or losing your own code.
You should also be able to integrate into
existing applications without major changes.
{{</lead>}}

{{<lead>}}
__At scale__ starts with generating large portions of your application
across the many technologies and tiers of your stack.
It also means that you should be able to share, update, and treat
both designs and generators like any other dependency.
{{</lead>}}



<br>

## What can you do with __hof__?

<br>

##### Generate anything

Applications all start as files and `hof` generates directories of files.
You can generate the source files, configuration, deployment, and CI files needed.
If it's made of files, you can generate it with `hof`.

##### Use your own tools

Developers have their own preferences for tools
from IDEs, languages, and platforms.

__hof__ is a cli tool that can work with any and all of these
and will never force you to use a clunky UI to build applications.

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

With __hof__ you write custom code directly in the generated output,
where it naturally belongs. Your final code should look the same.
When you change your data model or designs, __hof__ uses diff3
to ensure your code is left in place and 

##### Share and control modules with dependency management

Sharing models and code generation is core to __hof__
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
They are separate from the tool so there is no need to change __hof__
to enable new technologies or patterns.

<br>


## We call this High Code development.

{{<lead>}}
Higher levels of abstraction, iteration, collaboration, productivity, and velocity
for application developers.
{{</lead>}}


