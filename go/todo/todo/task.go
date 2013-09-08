package todo

import (
  "time"
)

type Task struct {
  identifier string
  estimated_time string
  priority string
  completed bool
  completed_at time.Time
}

func (task *Task) complete() time.Time {
  task.completed = true
  task.completed_at = Now()
  return task.completed_at
}

func (task *Task) String() string {
  if task.completed {
    return "- " + task.identifier + " -!- " + task.estimated_time + " -!- " + task.priority + " -!- " + task.completed_at.Format(DATE_FORMAT) + "\n"
  }

  return "* " + task.identifier + " -!- " + task.estimated_time + " -!- " + task.priority + "\n"
}