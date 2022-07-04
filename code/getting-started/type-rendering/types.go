package types

{{ range . }}
type {{ .Name }} struct {
	{{ range .Fields }}
	{{ camelT .Name }} {{ .Type }}
	{{ end }}
}
{{ end }}
