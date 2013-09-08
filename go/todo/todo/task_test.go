package todo

import (
    "testing"
    "time"
    )

func Test_TaskOutputsValidToString(t *testing.T) {
  identifier := "Item 1"
  estimated_time := "5 hours"
  priority := "High"
  timeString := "2013-09-03 15:09:22 +0200"

  timeValue, _ := time.Parse(DATE_FORMAT, timeString)
  NowForce(timeValue)

  expected_open := "* " + identifier + " -!- " + estimated_time + " -!- " + priority + "\n"
  expected_closed := "- " + identifier + " -!- " + estimated_time + " -!- " + priority + " -!- " + timeString + "\n"

  subject := Task{identifier: identifier, estimated_time: estimated_time, priority: priority}

  if subject.String() != expected_open {
    t.Error("Expected {" + expected_open + "} was {" + subject.String() + "}")
  }

  subject.complete()

  if subject.String() != expected_closed {
    t.Error("Expected {" + expected_closed + "} was {" + subject.String() + "}")
  }
}