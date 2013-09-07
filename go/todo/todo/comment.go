package todo

type Comment struct {
  text string
}

func (comment *Comment) toString() string {
  return "# " + comment.text
}