package todo

// Item is the interface all valid items in the todo file should implement
type Item interface {
	String() string
}
