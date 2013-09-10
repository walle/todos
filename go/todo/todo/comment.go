package todo

import (
	"strings"
)

// Item that represents a comment
type Comment struct {
	text string
}

// Returns the comment representation
func (comment Comment) String() string {
	return "# " + strings.TrimSpace(comment.text) + "\n"
}
