---
title: "Multi-language Output"
brief: "by adding a web frontend"

weight: 30
---


Up until now, we have been generating Go code.
`hof` makes it easy to generate multiple languages
at the same time from the same designs and data models.

Throughout this section, we will generate a simple web client.
In addition to seeing multi-language code generation,
we will also see how to use static files and how
we can modularize even within a single module.


(normally, we might separate the client into a separate module.
This would make it easier to swap Vue for React, in example)
