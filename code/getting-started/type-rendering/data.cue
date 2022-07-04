User: {
	Fields: {
		id:       Type: "int"
		admin:    Type: "bool"
		username: Type: "string"
		email:    Type: "string"
	}

	Relation: Post: "HasMany"
}

Post: {
	Fields: {
		title:  Type: "string"
		body:   Type: "string"
		public: Type: "bool"
	}

	Relation: User: "BelongsTo"
}
