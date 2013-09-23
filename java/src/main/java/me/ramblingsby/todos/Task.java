package me.ramblingsby.todos;

public class Task {

  private String identifier, estimatedTime, priority, completedAt;

  public Task(String identifier, String estimatedTime, String priority) {
    this.identifier = identifier;
    this.estimatedTime = estimatedTime;
    this.priority = priority;
    this.completedAt = null;
  }

  public Task(String identifier, String estimatedTime, String priority, String completedAt) {
    this.identifier = identifier;
    this.estimatedTime = estimatedTime;
    this.priority = priority;
    this.completedAt = completedAt;
  }

  public void complete() {
    this.completedAt = Time.getCurrentTime();
  }

  public boolean completed() {
    return completedAt != null;
  }

  @Override
  public String toString() {
    if (completed()) {
      return "- " + identifier + " -!- " + estimatedTime + " -!- " + priority + " -!- " + completedAt + "\n";
    } else {
      return "* " + identifier + " -!- " + estimatedTime + " -!- " + priority + "\n";
    }
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    Task task = (Task) o;

    if (completedAt != null ? !completedAt.equals(task.completedAt) : task.completedAt != null) return false;
    if (estimatedTime != null ? !estimatedTime.equals(task.estimatedTime) : task.estimatedTime != null) return false;
    if (identifier != null ? !identifier.equals(task.identifier) : task.identifier != null) return false;
    if (priority != null ? !priority.equals(task.priority) : task.priority != null) return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = identifier != null ? identifier.hashCode() : 0;
    result = 31 * result + (estimatedTime != null ? estimatedTime.hashCode() : 0);
    result = 31 * result + (priority != null ? priority.hashCode() : 0);
    result = 31 * result + (completedAt != null ? completedAt.hashCode() : 0);
    return result;
  }
}
