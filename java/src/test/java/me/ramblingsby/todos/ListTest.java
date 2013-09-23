package me.ramblingsby.todos;

import junit.framework.TestCase;

import java.util.ArrayList;

public class ListTest extends TestCase {

  private java.util.List<Item> items;
  private List subject;

  public ListTest(String testName) {
    super(testName);
    items = new ArrayList<Item>();
    items.add(new Task("Item 1"));
    items.add(new Task("Item 2"));
    items.add(new Task("Item 3", "", "", "2013-09-03 15:09:22 +0200"));
    subject = new List(items);
  }

  public void testHasCorrectNumberOfTasks() throws Exception {
    assertEquals(3, subject.tasks().size());
  }

  public void testHasCorrectNumberOfOpenTasks() throws Exception {
    assertEquals(2, subject.openTasks().size());
  }

  public void testHasCorrectNumberOfCompletedTasks() throws Exception {
    assertEquals(1, subject.completedTasks().size());
  }

  public void testCanAddTask() throws Exception {
    subject.add(new Task("New item"));
    subject.add(new Task("New completed item", "", "", "2013-09-03 15:09:22 +0200"));
    assertEquals(5, subject.items().size());
    assertEquals(5, subject.tasks().size());
    assertEquals(3, subject.openTasks().size());
    assertEquals(2, subject.completedTasks().size());
  }

  public void testCanFindTaskByIdentifier() throws Exception {
    assertEquals(items.get(1), subject.find("Item 2"));
  }

  public void testCanFindTaskByIdentifierRegex() throws Exception {
    assertEquals(items.get(2), subject.find("3$"));
  }

  public void testFindReturnsNullIfNoHit() throws Exception {
    assertEquals(null, subject.find("non existing identifier"));
  }

  public void testCanDeleteTask() throws Exception {
    subject.delete("Item 1");
    subject.delete("Item 3");
    assertEquals(1, subject.items().size());
    assertEquals(1, subject.tasks().size());
    assertEquals(1, subject.openTasks().size());
    assertEquals(0, subject.completedTasks().size());
  }

  public void testDeleteReturnsErrorMessageIfNotFound() throws Exception {
    // TODO: Should be exception?
    assertEquals("The task \"non existing identifier\" does not exist", subject.delete("non existing identifier"));
  }

  public void testCanUpdateTask() throws Exception {
    subject.update("Item 1", "Updated id", "", "High");
    assertEquals("Updated id", subject.find("Updated id").getIdentifier());
    assertEquals("", subject.find("Updated id").getEstimatedTime());
    assertEquals("High", subject.find("Updated id").getPriority());
  }

  public void testUpdateReturnsErrorMessageIfNotFound() throws Exception {
    // TODO: Should be exception?
    assertEquals("The task \"non existing identifier\" does not exist", subject.update("non existing identifier", "", "", ""));
  }
}
