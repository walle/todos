package me.ramblingsby.todos;

import junit.framework.TestCase;

public class SpacerTest extends TestCase {

  private Spacer subject;

  public SpacerTest(String testName) {
    super(testName);
    subject = new Spacer();
  }

  public void testOutputsValidToString() {
    assertEquals("\n", subject.toString());
  }
}
