package todo

import (
	"testing"
)

func Test_CanParseOpenTask(t *testing.T) {
	identifier := "Item 1"
	estimated_time := "5 hours"
	priority := "High"
	valid_task := Task{identifier: identifier, estimated_time: estimated_time, priority: priority}

	subject := Parser{}

	items := subject.Parse("* " + identifier + " -!- " + estimated_time + " -!- " + priority)
	task := items[0]

	if task != valid_task {
		t.Error("Expected {" + valid_task.String() + "} was {" + task.String() + "}")
	}
}

func Test_CanParseOpenTaskWithOnlyidentifier(t *testing.T) {
	identifier := "Item 1"
	valid_task := Task{identifier: identifier}

	subject := Parser{}

	items := subject.Parse("* " + identifier + " -!- -!-")
	task := items[0]

	if task != valid_task {
		t.Error("Expected {" + valid_task.String() + "} was {" + task.String() + "}")
	}
}

func Test_CanParseComment(t *testing.T) {
	valid_comment := NewComment("this is a comment")

	subject := Parser{}

	items := subject.Parse("# this is a comment")
	comment := items[0]

	if comment.String() != valid_comment.String() {
		t.Error("Expected {" + valid_comment.String() + "} was {" + comment.String() + "}")
	}
}

func Test_CanParseRandomText(t *testing.T) {
	subject := Parser{}

	items := subject.Parse("\n # Comment \n\n this is just text")

	if len(items) != 4 {
		t.Error("Expected {4} was {" + string(len(items)) + "}")
	}
}

func Test_CanParseCompletedTask(t *testing.T) {
	identifier := "Item 1"
	estimated_time := "5 hours"
	priority := "High"
	timeString := "2013-09-03 15:09:22 +0200"
	valid_task := Task{identifier: identifier, estimated_time: estimated_time, priority: priority}

	subject := Parser{}

	items := subject.Parse("- " + identifier + " -!- " + estimated_time + " -!- " + priority + " -!- " + timeString)
	task := items[0]

	if task != valid_task {
		t.Error("Expected {" + valid_task.String() + "} was {" + task.String() + "}")
	}
}

func Test_CanParseMultipleTasks(t *testing.T) {
	timeString := "2013-09-03 15:09:22 +0200"
	subject := Parser{}

	items := subject.Parse("\n # Comment \n\n * Item 1 -!- -!- \n - Item 2 -!- 3 minutes -!- Low -!- " + timeString)

	if len(items) != 5 {
		t.Error("Expected {5} was {" + string(len(items)) + "}")
	}
}
