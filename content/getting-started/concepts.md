---
title: "Concepts"

weight: 6
---

__hof__ was designed from first principles to
enable compounding accelerations when
developing software and applications.
This section introduces these core concepts.
Subsequent sections dive deeper and provide examples.


### Single Source of Truth

Most of what we write as developers is largely redundent.
From frontend forms, to api handlers, to database tables,
there are many things that are very similar even with the
fantastic libraries out there today.

Imagine when you need to add a field to a user's profile.
You need to alter the data model and code base in many places.
The database, server code, and frontend forms are just three posible areas
likely involving multiple files, tests, and devops for each.

With __hof__ we write down the conceptual data model once
using Cuelang, purpose built for configuration.
We call this the _"design"_ and it is combined with
parameterized modules, which have schemas, extensions, and code generators.
You can leverage existing modules, create your own, or even combine and extend both.

We say "Single Source of Truth" because we only want to express ourselves once, in one place.
From here we can create all the things and write our own code intermixed with the generated code.
We can be iterative as well, __hof__ understands the changes and updates it's part
to not only update schemes, but also write code which manages rolling updates gracefully
across the application technology stack.


### Designs and Data Models

The data model is core to any application.
In __hof__ we write data models using CUE
and enrich them with extra context and options.
These are what we call the "design" for your application.
It's very similar to types or classes
with annotations as in other languages,
written as configuration in CUE,
which has many nice properties purpose built for this task.

Your designs conform to the schemas of the modules you use.
Schemas define the context, options, and configuration for a module.
As you incorporate more modules, you will add to your designs.
This is where the enrichment on the data model largely comes from.

Some common enrichments on the data model:

- relationship between data models
- restricted and / or combined data views
- who can access or modify the data
- what technologies to use and their details when needed

Designs are merged with modules and code generators when you run the __hof__ CLI tool.
The modules and code generators will use your designs to generate applications and their pieces.


### Code (re)Generation

__hof__ was born from the dream that we ought
to be able to write our idea down once
and have a tool to generate a complete
application from that.
Not only the application, but much of the
process and life cycle components of
real production software.

So in __hof__, the companion to designs are _code generators_.
These read in your designs, have logic to condition output,
and uses text interpolation to generate files for just about anything.
While most users may only write designs, code generators are where
the schema and template files define what is possible.
Typically these are grouped in a module.


### Polyglot Modules

Modules in __hof__ are a flexible version of the
Minium Version Selcetion (MVS)
dependency managment algorithm popularized by Golang.
They are polyglot because they can contain any of:

- technology choices
- code generators
- sub-modules and dependencies

A common workflow for using a module is:

1. add a module as a dependency
2. import that module's schema and generator
3. setup the generator and update design for the schema
4. run __hof__ to generate code and use the module


### Customization

__hof__'s core is designed to enable
customization and enhancement in all concepts.
The most important is we understand that
complete applications cannot be generated
and that they themselves will need
custom code and integrations.
With __hof__ you can write your code
within the generated code.
Care is taken to keep everything intact
through design updates, regeneration of code,
and your own coding no matter the order.

You can also customize and extend any of the
designs, code generators, and modules you use and create.
This was another core tenament of __hof__'s design,
how to have another order or two of code reuse.
With the shared designs and code generators
we are already improving code reuse drastically.
When you customize or extend other modules,
you can keep the base you build on up-to-date.
With granular customization and the dependency system
you can fine tune modules and ensure correctness.


