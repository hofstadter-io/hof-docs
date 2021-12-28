// Definition for a generator
#HofGenerator: {
	// Base directory for the output
	Outdir: string | *"./"

	// "Global" input, merged with out replacing onto the files
	In: {...} | *{...}

	// you may also supply additional user config
	// often you will construct "In" from
	// more meaningful fields presented to the user

	// The list fo files for hof to generate
	// Out: [...#HofGeneratorFile] | *[...]
	Out: [...#HofGeneratorFile] | *[]

	// Template (top-level) TemplateConfig (globs+config)
	Templates: [...#Templates] | *[#Templates & { Globs: ["./templates/**/*"], TrimPrefix: "./templates/" }]

	// Partial (nested) TemplateConfig (globs+config)
	Partials: [...#Templates] | *[#Templates & { Globs: ["./partials/**/*"], TrimPrefix: "./partials/" }]

	// Statics are copied directly into the output, bypassing the rendering
	Statics: [...#Statics] | *[#Statics & { Globs: ["./static/**/*"], TrimPrefix: "./static/" }]

	// ... other fields for generator writers
}

// A file which should be generated by hof
#HofGeneratorFile: {
	// The local input data, defaults to the generator In fields
	In: {...}

	// The full path under the output location
	// empty implies don't generate, even though it may endup in the list
	Filepath: string | *""

	// One of the following should be set
	// The template contents
	TemplateContent: string | *""
	// Path for the loaded templates
	TemplatePath: string | *""

	// ... advanced template configuration
}
