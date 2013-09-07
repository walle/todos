package todo

import (
    "testing"
    )

func Test_SpacerOutputsValidToString(t *testing.T) {
  expected := "\n"
  subject := Spacer{expected}
  if subject.toString() != expected {
    t.Error("Expected {" + expected + "} was {" + subject.toString() + "}")
  }
}