package todo

import (
    "testing"
    )

func Test_SpacerOutputsValidToString(t *testing.T) {
  expected := "\n"
  spacer := Spacer{expected}
  if spacer.toString() != expected {
    t.Error("Spacer output not valid: Expected {" + expected + "} was {" + spacer.toString() + "}")
  }
}