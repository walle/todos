package todo

// Item that represents a blank line
type Spacer struct {
	character string
}

// Returns the spacer representation
func (spacer Spacer) String() string {
	return spacer.character
}

// Constructor function
func NewSpacer() *Spacer {
	return &Spacer{"\n"}
}
