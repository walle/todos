package todo

import (
	"testing"
)

func Test_SpacerOutputsValidString(t *testing.T) {
	expected := "\n"
	subject := NewSpacer()

	if subject.String() != expected {
		t.Error("Expected {" + expected + "} was {" + subject.String() + "}")
	}
}
