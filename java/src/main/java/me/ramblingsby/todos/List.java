package me.ramblingsby.todos;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class List {

  private java.util.List<Item> items;
  private java.util.List<Task> openTasks;
  private java.util.List<Task> completedTasks;

  public List(java.util.List<Item> items) {
    this.items = items;
    openTasks = new ArrayList<Task>();
    completedTasks = new ArrayList<Task>();

    for (Item item : items) {
      if (item.getClass() == Task.class) {
        Task task = (Task)item;
        if (task.completed()) {
          completedTasks.add(task);
        } else {
          openTasks.add(task);
        }
      }
    }
  }

  public java.util.List<Task> tasks() {
    java.util.List<Task> tasks = new ArrayList<Task>(openTasks);
    tasks.addAll(completedTasks);
    return tasks;
  }

  public java.util.List<Task> openTasks() {
    return new ArrayList<Task>(openTasks);
  }

  public java.util.List<Task> completedTasks() {
    return new ArrayList<Task>(completedTasks);
  }

  public java.util.List<Item> items() {
    return new ArrayList<Item>(items);
  }

  public void add(Task task) {
    if (task.completed()) {
      completedTasks.add(task);
    } else {
      openTasks.add(task);
    }
    items.add(task);
  }

  public Task find(String patternString) {
    Pattern pattern = Pattern.compile(patternString);
    for (Task task : tasks()) {
      Matcher matcher = pattern.matcher(task.getIdentifier());
      if (matcher.find()) {
        return task;
      }
    }

    return null;
  }

  public Object delete(String identifier) {
    Task task = find(identifier);
    if (task == null) {
      return "The task \"" + identifier + "\" does not exist";
    }

    if (task.completed()) {
      completedTasks.remove(task);
    } else {
      openTasks.remove(task);
    }

    return items.remove(task);
  }

  public Object update(String identifier, String newIdentifier, String estimatedTime, String priority) {
    Task task = find(identifier);
    if (task == null) {
      return "The task \"" + identifier + "\" does not exist";
    }

    return task.update(newIdentifier, estimatedTime, priority);
  }
}
