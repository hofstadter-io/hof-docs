package types

type Post struct {
	Body string

	Public bool

	Title string
}

type User struct {
	Admin bool

	Email string

	Id int

	Username string
}
