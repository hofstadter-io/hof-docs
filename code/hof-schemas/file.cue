package gen


// A file which should be generated by hof
#HofGeneratorFile: {
	// The local input data, any struct
	In?: { ... }

	// The full path under the output location
	// empty implies don't generate, even though it may end up in the out list
	Filepath?: string

	// Only one of these may be set
	// The template contents
	TemplateContent?: string
	// Path into the loaded templates
	TemplatePath?: string

	// TODO, we would like to make the above a disjunction
	// but it results in a significant slowdown 50-100% for hof self-gen
	// Most likely need to wait for structural sharing to land in cue

	// Include Common attributes
	//  '.' will bre replaced by generator defaults
	TemplateDelims?: #TemplateDelims

	// Note, intentionally closed to prevent user error when creating GenFiles
}
