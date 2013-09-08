package todo

type Spacer struct {
  character string
}

func (spacer *Spacer) String() string {
  return spacer.character
}