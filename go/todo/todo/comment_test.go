package todo

import (
    "testing"
    )

func Test_CommentOutputsValidToString(t *testing.T) {
  expected := "# Test comment"
  subject := Comment{"Test comment"}
  if subject.toString() != expected {
    t.Error("Expected {" + expected + "} was {" + subject.toString() + "}")
  }
}

func Test_CommentTextIsTrimmed(t *testing.T) {
  expected := "# Test comment"
  subject := Comment{"  Test comment  "}
  if subject.toString() != expected {
    t.Error("Expected {" + expected + "} was {" + subject.toString() + "}")
  }
}