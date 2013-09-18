package todo

import (
	"testing"
)

func Test_CommentOutputsValidString(t *testing.T) {
	expected := "# Test comment\n"
	subject := NewComment("Test comment")

	if subject.String() != expected {
		t.Error("Expected {" + expected + "} was {" + subject.String() + "}")
	}
}

func Test_CommentTextIsTrimmed(t *testing.T) {
	expected := "# Test comment\n"
	subject := NewComment("  Test comment  ")

	if subject.String() != expected {
		t.Error("Expected {" + expected + "} was {" + subject.String() + "}")
	}
}
