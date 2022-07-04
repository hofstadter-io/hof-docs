package types

type {{ .Name }} struct {
	{{ range .Fields }}{{ template "field.go" . }}
	{{ end }}
}
