package example

import (
	"hof.io/docs/first-example/schema"
)

// A concrete value of the Server schem
ServerDesign: schema.#Server & {
	GoModule: "hof.io/docs/first-example"

	Name:        "Example"
	Description: "An example server"

	Routes: [{
		Name:   "EchoQ"
		Path:   "/echo"
		Method: "GET"
		Query: ["msg"]
		Body: """
			c.String(http.StatusOK, msg)
			"""
	}, {
		Name:   "EchoP"
		Path:   "/echo"
		Method: "GET"
		Params: ["msg"]
		Body: """
			c.String(http.StatusOK, msg)
			"""
	}, {
		Name:   "Hello"
		Path:   "/hello"
		Method: "GET"
		Query: ["msg"]
		Body: """
			if msg == "" {
				msg = "hello world"
			}
			c.String(http.StatusOK, msg)
			"""
	}]

	Prometheus: true
}
