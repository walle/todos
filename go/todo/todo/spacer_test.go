package todo

import (
    "testing"
    )

func Test_OutputsValidToString(t *testing.T) {
  expected := "\n"
  spacer := Spacer{expected}
  if spacer.toString() != expected {
    t.Error("Spacer output not valid: Expected {" + "\n" + "} was {" + spacer.character + "}")
  }
}