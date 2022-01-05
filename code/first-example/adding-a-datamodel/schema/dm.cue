package schema

import (
	"github.com/hofstadter-io/hof/schema/dm"
)

#Datamodel: dm.#Datamodel & {
	Models: [string]: #Model
	OrderedModels: [ for M in Models {M} ]
}

#Model: dm.#Model & {
	Index: string  // field used for indexing
}
