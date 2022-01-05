package types

import (
	"fmt"
)

// Represents a {{ .TYPE.Name }}
type {{ .TYPE.Name }} struct {
	{{ range .TYPE.OrderedFields }}
	{{ .Name }} {{ .Type }}
	{{- end }}

	{{ range .TYPE.Relations }}
	// relations ... {{ .Reln }} {{ .Type }}
	{{ end }}
}

// A map type to store {{ .TYPE.Name }}
type {{ .TYPE.Name }}Map map[string]*{{ .TYPE.Name }}

// A var to work with
var {{ .TYPE.Name }}Store {{ .TYPE.Name }}Map

// Note, we are omitting locking and allowing concurrency issues

// initialize our storage
func init() {
	{{ .TYPE.Name }}Store = make({{ .TYPE.Name }}Map)
}

//
//// library funcs
//


func Create{{ .TYPE.Name }}(in *{{ .TYPE.Name }}) error {
	idx := in.{{ .TYPE.Index }}

	// check if already exists
	if _, ok := {{ .TYPE.Name }}Store[idx]; ok {
		return fmt.Errorf("Entry with %v already exists", idx)
	}

	// store the new value
	{{ .TYPE.Name }}Store[idx] = in

	return nil
}

func Read{{ .TYPE.Name }}(idx string) (*{{ .TYPE.Name }}, error) {

	// return if exists
	if val, ok := {{ .TYPE.Name }}Store[idx]; ok {
		return val, nil
	}

	// otherwise return error
	return nil, fmt.Errorf("Entry with %v does not exist", idx)
}

func Update{{ .TYPE.Name }}(in *{{ .TYPE.Name }}) error {
	idx := in.{{ .TYPE.Index }}

	// replace if exists, note we are not dealing with partial updates here
	if _, ok := {{ .TYPE.Name }}Store[idx]; ok {
		{{ .TYPE.Name }}Store[idx] = in
		return nil
	}

	// otherwise return error
	return fmt.Errorf("Entry with %v does not exist", idx)
}

func Delete{{ .TYPE.Name }}(idx string) error {

	// replace if exists, note we are not dealing with partial updates here
	if _, ok := {{ .TYPE.Name }}Store[idx]; ok {
		delete({{ .TYPE.Name }}Store, idx)
		return nil
	}

	// otherwise return error
	return fmt.Errorf("Entry with %v does not exist", idx)
}
