package gen

import (
	"github.com/hofstadter-io/hof/schema/gen"

	"hof.io/docs/first-example/schema"
)

// Generator definition
#HofGenerator: gen.#HofGenerator & {

	// User inputs to this generator
	// -----------------------------

	// The server design conforming to the server schema
	Server: schema.#Server

	// Base output directory, defaults to current
	Outdir: string | *"./"

	// Language fields
	GoModule: string

	// Required fields for hof
	// ------------------------

	// In is passed to every template
	In: {
		SERVER: Server
		Module: GoModule
	}

	// Actual files generated by hof, combined into a single list
	Out: [...gen.#HofGeneratorFile] & _All

	_All: [
		for _, F in _OnceFiles {F},
		for _, F in _RouteFiles {F},
	]

	// Note, we can omit Templates, Partials, and Statics
	// since the default values are sufficient for us

	// Internal fields for mapping Input to templates
	// ----------------------------------------------

	// Files that are generated once per server
	_OnceFiles: [...gen.#HofGeneratorFile] & [
			{
			TemplatePath: "go.mod"
			Filepath:     "\(Outdir)/go.mod"
		},
			{
			TemplatePath: "server.go"
			Filepath:     "\(Outdir)/server.go"
		},
		{
			TemplatePath: "router.go"
			Filepath:     "\(Outdir)/router.go"
		},
		{
			TemplatePath: "middleware.go"
			Filepath:     "\(Outdir)/middleware.go"
		},
	]

	// Routes, we create a file per route in the Server
	_RouteFiles: [...gen.#HofGeneratorFile] & [
			for _, R in Server.Routes {
			In: {
				ROUTE: {
					R
				}
			}
			TemplatePath: "route.go"
			Filepath:     "\(Outdir)/routes/\(In.ROUTE.Name).go"
		},
	]

	// We'll see how to handle nested or sub-routes in the "full-example" section

	...
}