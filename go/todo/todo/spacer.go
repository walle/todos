package todo

type Spacer struct {
  character string
}

func (s *Spacer) toString() string {
  return s.character
}