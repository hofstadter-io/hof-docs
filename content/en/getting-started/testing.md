---
title: "Testing"
weight: 18
---

__hof__ has a testing system powered by CUE.
This enables far more reuse of
snippets, test cases, and commands.
Tests can also be selected by attribute
for targeted execution.
You also get all the power and flexibility of CUE
when defining tests and cases.

The code implementing test functionality can be found here:
https://github.com/hofstadter-io/hof/tree/_dev/lib/test

### Top-level organization

This is __hof__'s current test file.
You can first see the setup for Golang based testers.
Following that are a series of `@test(...)` suites and tests.
`@test(suite,...)` is a suite. Testers have their base type
(bash,api,...) as the first arg in the attribute.

```text
package hof

import "strings"

//
////// Defined (partially) test configuration
//

#GoBaseTest: {
	skip: bool | *false

	sysenv: bool | *false
	env?: [string]: string

	dir: string
	...
}

#GoBashTest: #GoBaseTest & {
	dir: string
	script: string | *"""
	rm -rf .workdir
	go test -cover ./
	"""
	...
}

#GoBashCover: #GoBaseTest & {
	dir: string
	back: strings.Repeat("../", strings.Count(dir, "/") + 1)
	script: string | *"""
	rm -rf .workdir
	go test -cover ./ -coverprofile cover.out -json > tests.json
	"""
	...
}

//
////// Actual test configuration
//

// Test generated code
gen: _ @test(suite,gen)
gen: {
	// TODO before / after
	cmds: #GoBashTest @test(bash,test,cmd)
	cmds: {
		dir: "cmd/hof/cmd"
	}
	cmdsC: #GoBashCover @test(bash,cover,cmd)
	cmdsC: {
		dir: "cmd/hof/cmd"
	}
}

// Test Hof Linear Script (hls)
hls: _ @test(suite,hls)
hls: {
	runtime: #GoBashTest @test(bash,test,runtime)
	runtime: {
		dir: "script/runtime"
	}
	runtimeC: #GoBashCover @test(bash,cover,runtime)
	runtimeC: {
		dir: "script/runtime"
	}

	shell: #GoBashTest @test(bash,test,shell)
	shell: {
		dir: "script/shell"
	}
	shellC: #GoBashCover @test(bash,cover,shell)
	shellC: {
		dir: "script/shell"
	}

	script: #GoBashTest @test(bash,test,script)
	script: {
		dir: "script"
	}
	scriptC: #GoBashCover @test(bash,cover,script)
	scriptC: {
		dir: "script"
	}
}

lib: _ @test(suite,lib)
lib: {

	mod: #GoBashTest @test(bash,test,mod)
	mod: {
		dir: "lib/mod"
	}
	modC: #GoBashCover @test(bash,cover,mod)
	modC: {
		dir: "lib/mod"
	}

	st: #GoBashTest @test(bash,test,st)
	st: {
		dir: "lib/structural"
	}
	stC: #GoBashCover @test(bash,cover,st)
	stC: {
		dir: "lib/structural"
	}

}
```

### Running tests

Tests are run with the __hof__ CLI.

```sh
hof test [-s <suite>] [-t <test>] <test.cue>
```

Each flag can be specified multiple times.
The flag values suppport regex, so "st" will match 'st' and 'test', so use '^st$' for just st

- Multiple `-s` suite flags "or" together
- Multiple `-t` tester flags "and" together


```sh
# Run all tests
hof test

# Run all lib tests
hof test -s lib

# Run all cover tests
hof test -t cover

# Run lib/st tests
hof test -s lib -t test -t "^st$"
```

### External test systems

Most languages come with robust testing systems or libraries.
__hof__ does not try to replace these, rather make them easier
to invoke, especiallt in a polyglot or monorepo setup.

```text
#GoBaseTest: {
	skip: bool | *false

	sysenv: bool | *false
	env?: [string]: string

	dir: string
	...
}

#GoBashTest: #GoBaseTest & {
	dir: string
	script: string | *"""
	rm -rf .workdir
	go test -cover ./
	"""
	...
}

#GoBashCover: #GoBaseTest & {
	dir: string
	back: strings.Repeat("../", strings.Count(dir, "/") + 1)
	script: string | *"""
	rm -rf .workdir
	go test -cover ./ -coverprofile cover.out -json > tests.json
	"""
	...
}
```

This is the eaxmple usage:

```text
lib: _ @test(suite,lib)
lib: {

	mod: #GoBashTest @test(bash,test,mod)
	mod: {
		dir: "lib/mod"
	}
	modC: #GoBashCover @test(bash,cover,mod)
	modC: {
		dir: "lib/mod"
	}

	st: #GoBashTest @test(bash,test,st)
	st: {
		dir: "lib/structural"
	}
	stC: #GoBashCover @test(bash,cover,st)
	stC: {
		dir: "lib/structural"
	}

}
```


### Internal test systems


