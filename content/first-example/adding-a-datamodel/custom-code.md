---
title: "Custom Code"
brief: "for Implementing Resource Handlers"
weight: 40
---

{{<lead>}}
One of `hof`'s core design choices was to
make it possible to work directly in the output.
{{</lead>}}

We need to implement our Resource handlers.
Here are set and get for users,
we leave the rest to you.


{{<codeInner title="in output/resources/User.go" lang="go">}}
func UserCreateHandler(c echo.Context) (err error) {

	// process any path and query params

	// default body
	// c.String(http.StatusNotImplemented, "Not Implemented")
	// (you can comment out generated code)

	var u types.User
	if err := c.Bind(&u); err != nil {
		return echo.NewHTTPError(http.StatusBadRequest, err.Error())
	}

	if err := types.CreateUser(&u); err != nil {
		return echo.NewHTTPError(http.StatusBadRequest, err.Error())
	}

	return c.String(http.StatusOK, "OK")
}

func UserReadHandler(c echo.Context) (err error) {

	// (or you can delete generated code)
	
	username := c.Param("username")

	u, err := types.ReadUser(username)
	if err != nil {
		return echo.NewHTTPError(http.StatusBadRequest, err.Error())
	}

	return c.JSON(http.StatusOK, u)
}
{{</codeInner>}}


### Using the Resources

Let's create and read a user with curl.

{{<codeInner lang="sh">}}
curl -X POST \
  -H 'Content-Type: application/json' \
	-d '{ "Username": "Bob", "Email": "bob@hof.io" }' \
	localhost:8080/user
	
curl localhost:8080/user/Bob
{{</codeInner>}}


### Iterative development

`hof` enables you to both update your designs and edit the output,
while still being able to regenerate the code base.

In the next section we will add relations to our types and data model.
This will require changes to both and after we will rebuild and test the server.


