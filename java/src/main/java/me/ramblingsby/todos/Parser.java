package me.ramblingsby.todos;

import java.util.ArrayList;
import java.util.List;

public class Parser {
  public List<Item> parse(String string) {
    List<Item> items = new ArrayList<Item>();

    String[] lines = string.split("\n");

    for (String line : lines) {
      String text;
      String[] parts;

      try {
        switch (line.charAt(0)) {
          case '#':
            text = line.substring(1);
            items.add(new Comment(text));
          break;
          case '*':
            text = line.substring(1);
            parts = text.split("-!-");
            if (parts.length == 3) {
              items.add(new Task(parts[0].trim(), parts[1].trim(), parts[2].trim()));
            } else if (parts.length == 2) {
              items.add(new Task(parts[0].trim(), parts[1].trim(), ""));
            } else if (parts.length == 1) {
              items.add(new Task(parts[0].trim(), "", ""));
            }
          break;
          case '-':
            text = line.substring(1);
            parts = text.split("-!-");
            items.add(new Task(parts[0].trim(), parts[1].trim(), parts[2].trim(), parts[3].trim()));
          break;
          default:
            items.add(new Spacer());
        }
      } catch (IndexOutOfBoundsException e) {
        items.add(new Spacer());
      }
    }

    return items;
  }
}
