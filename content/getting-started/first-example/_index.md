---
title: "A First Example"
linkTitle: "A First Example"
weight: 10
description: >
  A simple code generator in a single file.
---

In our first example we will build a __hof__ generator for a simple Golang REST server.
This subsection will take you through the steps
to both create and use code generators.

There are two sides to generators:

- `implementors` who write schemas and templates as reusable Cue modules
- `users` who write designs, customize output, and develop applications

In the first half of this section, we will take on the role of the generator creator.
We will use the generator in the second half.


##### Implementor

- __define__ a generator
- write a __schema__ for your generator
- write __templates__ to implement the schema

##### user
- write a __design__ to use the generator
- use the __output__ and add custom code
- __iterate__ on applications
  
You can find __[the source for this example on GitHub](https://github.com/hofstadter-io/hof-docs/tree/main/code/getting-started/first-example/)__.

The directory layout is as follows

```sh
# source location in the website repo
code/getting-started/first-example/

  # The generator module
  server/
    gen/         # generator definition
    schema/      # schema for a REST server
    templates/   # templates for files
    partials/    # common partial templates

  # The generator usage
  app/
    # inputs to hof
    hof.cue      # entrypoint for hof generation
    design/      # the server design
    # output and custom
    server/      # the server code
    config/      # config for our server
    sercret/     # secrets for our server
    seeds/       # database seed data

  # Snippets used in the progress of this section
  tmp/
```

<br>
<hr>
<br>

#### Subsections

{{< childpages >}}
