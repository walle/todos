package todo

import (
    "testing"
    )

func Test_CommentOutputsValidToString(t *testing.T) {
  expected := "# Test comment"
  comment := Comment{"Test comment"}
  if comment.toString() != expected {
    t.Error("Spacer output not valid: Expected {" + expected + "} was {" + comment.toString() + "}")
  }
}