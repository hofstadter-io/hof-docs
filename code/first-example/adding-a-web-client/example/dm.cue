package example

import (
	"hof.io/docs/first-example/schema"
)

ServerDatamodel: schema.#Datamodel & {
	Name: "ExampleDatamodel"

	Models: {
		User: {
			Index: "Username"
			Fields: {
				Username: { Type: "string" }
				Email:    { Type: "string" }
			}
			Relations: {
				Todos: {
					Reln: "HasMany"
					Type: "Todo"
				}
			}
		}

		Todo: {
			Index: "Title"
			Fields: {
				Title:   { Type: "string" }
				Content: { Type: "string" }
			}
			Relations: {
				Author: {
					Reln: "BelongsTo"
					Type: "User"
				}
			}
		}
	}
}
