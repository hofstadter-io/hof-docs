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

	// Datamodel for types in our server
	Datamodel: schema.#Datamodel

	// Base output directory, defaults to current
	Outdir: string | *"./"

	// Language fields
	GoModule: string

	// Required fields for hof
	// ------------------------

	// In is passed to every template
	In: {
		SERVER:    Server
		DM:        Datamodel
		Module:    GoModule
		Resources: (schema.#DatamodelToResources & {"Datamodel": Datamodel}).Resources
	}

	Statics: [{
		Globs: ["static/**/*.*"]
		TrimPrefix: "static/"
	}]

	// Actual files generated by hof, combined into a single list
	Out: [...gen.#HofGeneratorFile] & All

	All: [
		for _, F in OnceFiles {F},
		for _, F in RouteFiles {F},
		for _, F in TypeFiles {F},
		for _, F in ResourceFiles {F},
	]

	// Note, we can omit Templates, Partials, and Statics
	// since the default values are sufficient for us

	// Internal fields for mapping Input to templates
	// ----------------------------------------------

	// Files that are generated once per server
	OnceFiles: [...gen.#File] & [
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
	RouteFiles: [...gen.#File] & [
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

	TypeFiles: [...gen.#File] & [
			for _, M in Datamodel.Models {
			In: {
				TYPE: {
					M
					OrderedFields: [ for _, F in M.Fields {F}]
				}
			}
			TemplatePath: "type.go"
			Filepath:     "\(Outdir)/types/\(In.TYPE.Name).go"
		},
	]

	ResourceFiles: [...gen.#File] & [
			for _, R in In.Resources {
			In: {
				RESOURCE: R
			}
			TemplatePath: "resource.go"
			Filepath:     "\(Outdir)/resources/\(In.RESOURCE.Name).go"
		},
	]

	// We'll see how to handle nested or sub-routes in the "full-example" section

	...
}
