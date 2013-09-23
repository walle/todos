package me.ramblingsby.todos;

import java.util.List;

public class Formatter {
  public String format(List<Item> items) {
    String ret = "";

    for (Item item : items) {
      ret += item.toString();
    }

    return ret;
  }
}
