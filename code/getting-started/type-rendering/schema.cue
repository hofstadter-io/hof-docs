// Schema for a Type
#Type: {
	// forms the basis for names in target languages
	Name: string

	// This is a CUE pattern for a struct
	// it makes using it later a little easier
	Fields: [field=string]: #Field & { Name: field }

	// How does this type relate to other types
	Relation: [other=string]: "BelongsTo" | "HasOne" | "HasMany" | "ManyToMany"
}

// Schema for a Field
#Field: {
	// forms the basis for names in target languages
	Name: string
	// Normally we would do a better job
	// of validating the Type contents
	Type: string
}

// This is a CUE pattern for a struct
// it makes using it later a little easier, same as fields
[type=string]: #Type & { Name: type }
