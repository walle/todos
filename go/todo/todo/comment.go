package todo

import (
  "strings"
)

type Comment struct {
  text string
}

func (comment *Comment) toString() string {
  return "# " + strings.TrimSpace(comment.text)
}