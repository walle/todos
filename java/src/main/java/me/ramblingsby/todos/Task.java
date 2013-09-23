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
}
