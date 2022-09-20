---
title: "Creators"
brief: "for blueprints or bootstraping from in any git repo"

weight: 30
---


{{<lead>}}
Hof Creators are code generators modules
meant for one-time bootstrapping from a few inputs.
Use them to give your users one-liners for getting started
or to provide reusable application blueprints.
{{</lead>}}

{{<beta style="warning">}}
This command is beta and will be in the next release.
[Download a pre-release](https://github.com/hofstadter-io/hof/releases)
or ask about it in Slack.
{{</beta>}}


## Running `hof create`

`hof create` is run by users who provide the url to a git repository.

{{<codeInner title="> terminal">}}
$ hof create github.com/hofstadter-io/hofmod-cli@v0.7.12-beta.5
{{</codeInner>}}

The user is presented with an interactive prompt you design.
Their answers provide the input to your generator,
which should output the files they need to get started using your project. 
The process is flexible enough for any git repository to provide the creator experience,
so what you generate does not have to be `hof` related.

{{< youtube TfaEV37C6IE >}}


## Adding a Creator to your repository

To add a creator to a git repository, we have to set up
a CUE module and hof generator, and then push a tag.

1. initialize a CUE repository in your project (`hof mod init cue <repo-url>`)
1. add a `creator.cue` at the root of your repository to hold the generator
1. fill in the generator, templates, and prompt
1. test the creator locally
1. tag and push

## Example Creator

The following is the creator from the `hofmod-cli` generator.

{{<codePane file="code/hof-create/hofmod-cli/creator.html" title="hofmod-cli/creator.cue">}}

## Learn More

Underneath, a `creator` is a hof generator with a `Create` field,
run as a one-time code generation.

- The main new part is the `prompt` where you can ask the user for inputs
- These then form the input to the file bootstrapping process (one-time hof code gen)
- A `hof generator` will use `hof create` to create the initial CUE files for using their generator
- You can add `hof create` to any repository to generate any files

Users then use `hof create <repo>@<tag>` bootstrap new applications, modules, or configuration
like files needed for CI/CD, deployment, security, or other system.
Since creators are just generators, you can create files for
new applications or add pieces to an existing application.

To learn more about writing creators, prompts, and how to give your users
one-line bootstrapping or application blueprints, see the
[hof create section](/hof-create/)


