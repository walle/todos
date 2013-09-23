package me.ramblingsby.todos;

import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.List;

public class FormatterTest extends TestCase {

  private List<Item> items;
  private Formatter subject;

  public FormatterTest(String testName) {
    super(testName);
    subject = new Formatter();
    items = new ArrayList<Item>();
    items.add(new Comment("Todos"));
    items.add(new Spacer());
    items.add(new Task("Item 1", "2 hours", "Low"));
    items.add(new Task("Item 2"));
    items.add(new Spacer());
    items.add(new Task("Item 3", "", "", "2013-09-03 15:09:22 +0200"));
  }

  public void testCanFormatProperly() throws Exception {
    String expected = "# Todos\n\n* Item 1 -!- 2 hours -!- Low\n* Item 2 -!-  -!- \n\n- Item 3 -!-  -!-  -!- 2013-09-03 15:09:22 +0200\n";
    assertEquals(expected, subject.format(items));
  }
}
