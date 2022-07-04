---
title: "Template Writing"
weight: 10
---


## Template System

Hof uses Go's `text/template` package (https://pkg.go.dev/text/template).
All partials are registered with all templates for use with `{{ template "path/to/partial.ext" }}`.


## Debugging

The best way is to use comments and the yaml helper to inspect values.
You can reduce, and then build back up, any conditional or loop logic.
Often, a separate, development only, file will be used for this.

{{<codeInner lang="go">}}
/*
{{ yaml .MyValue }}
*/
{{</codeInner>}}

## Helpers

There are a number of additional helpers provided.
You can find them in [lib/templates/helpers.go](https://github.com/hofstadter-io/hof/blob/_dev/lib/templates/helpers.go).

Notes:

- Many of these are based on the Go stdlib functions with the same name.
- Args can be literal, a .Variable, or the result of another function. See Go's documentation
- It can be advantagous to do as many manipulations in CUE rather than in the template system.


### Encode to a data format:

- `yaml` (`{{ yaml .Data }}`)
- `json` (`{{ json .Data }}`)
- `toml` (`{{ toml .Data }}`)
- `xml` (`{{ xml .Data }}`)

### Printing and spacing helpers:

- `indent` (`{{ indent .String "    " }}`)
- `pretty` (`{{ pretty .Value }}`) uses https://github.com/kr/pretty
- `pprint` (alias for pretty)
- `lwidth` (left align with width)
- `rwidth` (right align with width)
- `printf` (`{{ printf "%s %d" .String .Number }}`)

### Casings conversion helpers:

- `lower` (`{{ lower .String }}`)
- `upper` (`{{ upper .String }}`)
- `title` (`{{ title .String }}`)
- `camel` (`{{ camel .String }}`)
- `camelT` (`{{ camelT .String }}`)
- `snake` (`{{ snake .String }}`)
- `snakeU` (`{{ snakeU .String }}`)
- `kebab` (`{{ kebab .String }}`)
- `kebabU` (`{{ kebabU .String }}`)

### String processing helpers:

- `concat` (`{{ concat "foo" "bar" }}`)
- `join` (`{{ join ", " "foo" "bar" }}`)
- `contains` (`{{ contains .String .Substr }}`)
- `split` (`{{ split .String .Separator }}`)
- `replace` (`{{ replace .String .Old .New .Count }}`)
- `hasprefix` (`{{ hasprefix .String .Prefix }}`)
- `hassuffix` (`{{ hassuffix .String .Suffix }}`)
- `trimprefix` (`{{ trimprefix .String .Prefix }}`)
- `trimsuffix` (`{{ trimsuffix .String .Suffix }}`)
- `trimto` (alias for trimto_first)
- `trimfrom` (alias for trimfrom_first)
- `trimto_first` (`{{ trimto_first .String .Substr .Keep }}`) Trim a string until the first Substring, possibly keeping the substring
- `trimfrom_first` (`{{ trimfrom_first .String .Substr .Keep  }}`)
- `trimto_last` (`{{ trimto_last .String .Substr .Keep }}`)
- `trimfrom_last` (`{{ trimfrom_last .String .Substr .Keep }}`)
- `substr` (`{{ substr .String .StartInt .EndInt }}`)
- `getprefix` (`{{ getprefix .String .Substr }}`) (opposite of `trimprefix`)
- `getsuffix` (`{{ getsuffix .String .Substr }}`)
- `getbetween` (`{{ getbetween .String .LhsSubstr .RhsSubstr }}`)

### String comparison

- `eq` (`{{ eq .Str1 .Str2 }}`)
- `ne` (`{{ ne .Str1 .Str2 }}`)

### Slice or list helpers:

- `length` (`{{ length .Slice }}`) - returns the length of a slice
- `identity` (`{{ identity .Value }}`) - returns the value
- `sublist` (`{{ sublist .Slice .Start .Count }}`) - returns a sublist or slice
- `rsublist` (`{{ rsublist .Slice .Start .Count }}`) - like sublist, but from the end
- `reverse` (`{{ reverse .Slice }}`) - reverses a slice
- `listelem` (`{{ listelem .Slice .Pos }}`) - returns the element at position

### Boolean comparisons:

- `or` (`{{ or .LHS .RHS  }}`) - compares booleans and returns true or nil
- `and` (`{{ and .LHS .RHS }}`) - compares booleans and returns true or nil

### Integer helpers:

- `int_eq` (`{{ int_eq .Int1 .Int2 }}`)
- `int_ne` (`{{ int_ne .Int1 .Int2 }}`)
- `int_gte` (`{{ int_gte .Int1 .Int2 }}`)
- `int_gt` (`{{ int_gt .Int1 .Int2 }}`)
- `int_lte` (`{{ int_lte .Int1 .Int2 }}`)
- `int_lt` (`{{ int_lt .Int1 .Int2 }}`)
- `add` (`{{ add .Int1 .Int2 }}`)
- `inc` (`{{ inc .Int }}`) - returns .Int + 1

### Other helpers:

- `ternary` (`{{ ternary .Value1 .Value2 }}`) - returns Value1 if a string and not empty, otherwise returns Value2 (todo, update this to more versatile)
- `gokind` (`{{ gokind .Value }}`) - returns the Go reflect.Kind as a string
- `builtin` (`{{ builtin }}`) - returns true if the string is a known Go builtin
- `file` (`{{ file "path/to/file.txt" }}`) - loads a file from disk
- `dref` (`{{ dref "path.to.value" .Value }}`) - returns the value at [hofstadter-io/dotpath](https://github.com/hofstadter-io/dotpath/blob/master/examples/test.go) from the given value

