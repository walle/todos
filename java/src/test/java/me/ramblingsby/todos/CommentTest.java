package me.ramblingsby.todos;

import junit.framework.TestCase;

public class CommentTest extends TestCase {

  private String text;
  private Comment subject;

  public CommentTest(String testName) {
    super(testName);
    text = "This is a comment";
    subject = new Comment(text);
  }

  public void testOutputsValidToString() {
    assertEquals("# " + text, subject.toString());
  }

  public void testTrimsCommentText() throws Exception {
    String textWithSpaces = "  This is a comment  ";
    subject = new Comment(textWithSpaces);
    assertEquals("# " + text, subject.toString());
  }
}
