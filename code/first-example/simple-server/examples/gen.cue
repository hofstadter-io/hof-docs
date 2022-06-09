package example

import (
	"hof.io/docs/first-example/gen"
)

Server: gen.#HofGenerator & {
	@gen(server)

	Outdir:   "./output"
	GoModule: "hof.io/docs/server-example"

	// We write the design in a separate file 
	Server: ServerDesign

	// Needed because we are using the generator from within it's directory
	// Users who import your generator as a module will not need to set this
	// It's a temporary requirement until CUE supports embedded files
	PackageName: ""
}
