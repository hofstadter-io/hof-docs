---
title: "Using"
brief: "a generator to create"
weight: 25
---

{{<lead>}}
Users _design_ by filling in the schema for a __Hof Generator__.
{{</lead>}}

### ServerDesign, with the schema

{{<codePane title="example/server.cue" file="code/first-example/simple-server/examples/server.html">}}

### Server, @gen(server)

{{<codePane title="example/gen.cue" file="code/first-example/simple-server/examples/gen.html">}}

### Generate the Code

From the root of our module, run

{{<codeInner lang="sh">}}
hof gen ./example
{{</codeInner>}}

You should now have an `./output` directory with the generated code.

### Running the Server

With our code in place, we can build and run the server

{{<codeInner lang="sh">}}
cd ./ouput
go build -o server
./server
{{</codeInner>}}

Call the endpoints with curl

{{<codeInner lang="sh">}}
curl localhost:8080/hello
curl localhost:8080/echo/moo
curl localhost:8080/internal/metrics
{{</codeInner>}}
