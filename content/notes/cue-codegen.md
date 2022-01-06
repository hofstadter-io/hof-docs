---
title: "CUE Code Generation"

weight: 100
---

{{<lead>}}
Translating CUE to <lang> type (class or struct) is a challenging problem generally.
{{</lead>}}

It really can't capture all of the nuances in the vanilla form. We need to do something more complex.

### The Hof Method

Some helpful links. (Note, these are based on the v0.6.1-beta1 release that happened earlier today)

- Discussion on Slack about the data modeling prototype in the #general channel around here: https://hofstadter-io.slack.com/archives/C013WKK9W1F/p1640891812004200
- "Adding a Datamodel" section: https://docs.hofstadter.io/first-example/adding-a-datamodel/
- https://docs.hofstadter.io/first-example/adding-a-datamodel/relations/#commentary
- Data model prototype schema: https://github.com/hofstadter-io/hof/tree/prototype-dm/schema/dm
- https://github.com/hofstadter-io/hofmod-server is based on the previous prototype of data modeling. It will be rewritten and broken into several modules
- A local code for `hofmod-sql` and `hofmod-gotype` are in the works. `hofmod-server` will then build on these.


Once `first-example` is done, several production versions of the concepts therein will be made into hofmods

### With CUE

There are also ways to generate types without hof

- one could do essentially the same thing hof is doing in pure CUE, though less sophisticated
- If you are willing to write Go, you can walk the AST and/or cue.Value to do some things. Attributes would make this more interesting.
- hof leaves more to the data model schema + generator, so it can be more flexible without modifying the tool. This should also be composable. I plan to have an example of that in the first-example/using-a-database or maybe another section


There are also discussion and issues on CUE GitHub.

- https://github.com/cue-lang/cue/discussions/1027
- https://github.com/cue-lang/cue/discussions/1038
- https://github.com/cue-lang/cue/discussions/482
- https://github.com/cue-lang/cue/issues/6


TODO, respond to

- https://github.com/cue-lang/cue/discussions/1167


