package todo

type Spacer struct {
  character string
}

func (spacer *Spacer) toString() string {
  return spacer.character
}