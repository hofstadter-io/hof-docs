---
title: Hofstadter Documentation
description: "Hofstadter Documentation"
---

{{<lead>}}
The hof tool tries to remove redundent development activities by using high level designs, code generation, and diff3 while letting you write custom code directly in the output.
{{</lead>}}

- Users write Single Source of Truth (SSoT) design for data models and the application generators
- hof reads the SSoT, processes it through the code generators, and outputs directories and files
- Users can write custom code in the output, change their designs, and regenerate code in any order
- hof should be customizable and extensible by only editing text files and not hof source code.
- Use your own tools, technologies, and practices, hof does not make any choices for you
- hof is powered by Cue (https://cuelang.org & https://cuetorials.com)

{{< childpages page="getting-started/" >}}
{{< childpages page="code-generation/" >}}
{{< childpages page="using-generators/" >}}
{{< childpages page="creating-generators/" >}}
{{< childpages page="module-library/" >}}
{{< childpages page="help-and-support/" >}}

