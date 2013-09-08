package todo

import (
  "strings"
)

type Comment struct {
  text string
}

func (comment *Comment) String() string {
  return "# " + strings.TrimSpace(comment.text)
}