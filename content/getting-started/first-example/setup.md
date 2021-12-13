---
title: "Setup"
weight: 5
---

{{<lead>}}
Generators have a common files and a directory structure.
{{</lead>}}

{{<codeInner title="Typical directory structure">}}
# CUE files for the schema and hof generator
schema/
gen/

# files used by the hof generator
templates/
partials/
static/

# sample usage of our generator
examples/
{{</codeInner>}}

You will often have other files depending on the languages or technologies
your generator is creating in. A common example is dependency management files.
Almost every __hof  generator__ is a CUE module, so we will need those files.

{{<codeInner title="Create a CUE module">}}
mkdir example && cd example
hof mod init cue hof.io/example
{{</codeInner>}}

{{<codeInner title="Create the common directories">}}
mkdir schema gen templates partials static examples
{{</codeInner>}}
