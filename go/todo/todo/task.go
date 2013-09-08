package todo

import (
	"time"
)

// Item that represents a task
type Task struct {
	identifier     string
	estimated_time string
	priority       string
	completed      bool
	completed_at   time.Time
}

// Sets completed_at to current time
func (task *Task) complete() time.Time {
	task.completed = true
	task.completed_at = Now()
	return task.completed_at
}

// Returns the task representation
func (task *Task) String() string {
	if task.completed {
		return "- " + task.identifier + " -!- " + task.estimated_time + " -!- " + task.priority + " -!- " + task.completed_at.Format(DATE_FORMAT) + "\n"
	}

	return "* " + task.identifier + " -!- " + task.estimated_time + " -!- " + task.priority + "\n"
}
