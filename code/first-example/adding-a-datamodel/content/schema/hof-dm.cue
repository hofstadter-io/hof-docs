package dm

#Datamodel: {
	@datamodel()
	Name: string

	// Models in the data model, ordered
	Models: #Models

	...
}

#Models: [name=string]: #Model & {Name: name, ...}
#Model: {
	@dm_model()
	Name: string

	Fields: #Fields

	...
}

#Fields: [name=string]: #Field & {Name: name, ...}
#Field: {
	@dm_field()
	Name: string

	Type: string

	...
}
