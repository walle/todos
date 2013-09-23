package me.ramblingsby.todos;

import junit.framework.TestCase;

import java.util.List;

public class ParserTest extends TestCase {
  private String identifier, estimatedTime, priority, completedAt;
  private Task task;
  private Parser subject;

  public ParserTest(String testName) {
    super(testName);
    identifier = "Item 1";
    estimatedTime = "5 hours";
    priority = "Urgent";
    completedAt = "2013-09-03 15:09:22 +0200";
    task = new Task(identifier, estimatedTime, priority);
    subject = new Parser();
  }

  public void testCanParseOpenTask() throws Exception {
    Task parsedTask = (Task) subject.parse("* " + identifier + " -!- " + estimatedTime + " -!- " + priority).get(0);
    assertEquals(task, parsedTask);
  }

  public void testCanParseOpenTaskWithOnlyIdentifier() throws Exception {
    Task parsedTask = (Task) subject.parse("* " + identifier + " -!-  -!- ").get(0);
    assertEquals(identifier, parsedTask.getIdentifier());
    parsedTask = (Task) subject.parse("* " + identifier).get(0);
    assertEquals(identifier, parsedTask.getIdentifier());
  }

  public void testCanParseAComment() throws Exception {
    Comment comment = (Comment) subject.parse("# this is a comment").get(0);
    assertEquals("# this is a comment\n", comment.toString());
  }

  public void testCanParseRandomText() throws Exception {
    assertEquals(4, subject.parse("\n # Comment \n\n this is just text").size());
  }

  public void testCanParseCompletedTask() throws Exception {
    Task parsedTask = (Task) subject.parse("- " + identifier + " -!- " + estimatedTime + " -!- " + priority + " -!- " + completedAt).get(0);
    assertEquals(identifier, parsedTask.getIdentifier());
    assertEquals(estimatedTime, parsedTask.getEstimatedTime());
    assertEquals(priority, parsedTask.getPriority());
    assertEquals(true, parsedTask.completed());
    assertEquals(completedAt, parsedTask.getCompletedAt());
  }

  public void testCanParseMultipleTasks() throws Exception {
    List<Item> items = subject.parse("\n # Comment \n\n * Item 1 -!- -!- \n - Item 2 -!- 3 minutes -!- Low -!- " + completedAt);
    assertEquals(5, items.size());
  }
}