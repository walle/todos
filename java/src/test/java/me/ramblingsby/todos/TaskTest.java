package me.ramblingsby.todos;

import junit.framework.TestCase;

import java.text.ParseException;

public class TaskTest extends TestCase {

  private String identifier, estimatedTime, priority;
  private Task subject;

  public TaskTest(String testName) {
    super(testName);
    identifier = "Item 1";
    estimatedTime = "5 hours";
    priority = "Urgent";
    subject = new Task(identifier, estimatedTime, priority);
  }

  public void testOutputsValidToString() throws ParseException {
    String time = "2013-09-03 15:09:22 +0200";

    Time.setValueForCurrentTime(time);

    String expectedOpen = "* " + identifier + " -!- " + estimatedTime + " -!- " + priority + "\n";
    String expectedCompleted = "- " + identifier + " -!- " + estimatedTime + " -!- " + priority + " -!- " + time + "\n";

    assertEquals(expectedOpen, subject.toString());
    subject.complete();
    assertEquals(expectedCompleted, subject.toString());

    Time.resetValueForCurrentTime();
  }
}
