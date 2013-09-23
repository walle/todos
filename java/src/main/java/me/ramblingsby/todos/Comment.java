package me.ramblingsby.todos;

public class Comment implements Item  {

  private String text;

  public Comment(String text) {
    this.text = text.trim();
  }

  @Override
  public String toString() {
    return "# " + text + "\n";
  }
}
