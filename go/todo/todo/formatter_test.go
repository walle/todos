package todo

import (
	"testing"
	"time"
)

func Test_FormatterOutputsValidToString(t *testing.T) {
	timeValue, _ := time.Parse(DATE_FORMAT, "2013-09-03 15:09:22 +0200")
	items := []Item{
		Comment{"Todos"},
		Spacer{"\n"},
		Task{identifier: "Item 1", estimated_time: "2 hours", priority: "Low"},
		Task{identifier: "Item 2"},
		Spacer{"\n"},
		Task{identifier: "Item 3", completed_at: timeValue},
	}

	expected := "# Todos\n\n* Item 1 -!- 2 hours -!- Low\n* Item 2 -!-  -!- \n\n- Item 3 -!-  -!-  -!- 2013-09-03 15:09:22 +0200\n"

	subject := Formatter{items}

	if subject.String() != expected {
		t.Error("Expected {" + expected + "} was {" + subject.String() + "}")
	}
}
