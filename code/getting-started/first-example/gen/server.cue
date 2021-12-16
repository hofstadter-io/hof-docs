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

	PartialsDir: "./partials/"
	TemplatesDir: "./templates/"

	// Internal fields for mapping Input to templates
	// ----------------------------------------------

	// Files that are generated once per server
	_OnceFiles: [...gen.#HofGeneratorFile] & [
			{
			TemplateName: "go.mod"
			Filepath:     "\(Outdir)/go.mod"
		},
			{
			TemplateName: "server.go"
			Filepath:     "\(Outdir)/server.go"
		},
		{
			TemplateName: "router.go"
			Filepath:     "\(Outdir)/router.go"
		},
		{
			TemplateName: "middleware.go"
			Filepath:     "\(Outdir)/middleware.go"
		},
	]

	// Routes, we create a file per route in the Server
	_RouteFiles: [...gen.#HofGeneratorFile] & [
			for _, R in Server.Routes {
			In: {
				ROUTE: {
					R
					PackageName: "routes"
				}
			}
			TemplateName: "route.go"
			Filepath:     "\(Outdir)/routes/\(In.ROUTE.Name).go"
		},
	]

	// We'll see how to handle nested or sub-routes in the "full-example" section

	...
}
