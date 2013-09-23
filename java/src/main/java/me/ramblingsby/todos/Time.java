package me.ramblingsby.todos;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {

  private static final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss Z");
  private static Date valueForCurrentTime;

  public static void setValueForCurrentTime(String time) throws ParseException {
    Date date = dateFormat.parse(time);
    valueForCurrentTime = date;
  }

  public static void resetValueForCurrentTime() {
    valueForCurrentTime = null;
  }

  public static String getCurrentTime() {
    Date value = new Date();
    if (valueForCurrentTime != null) {
      value = valueForCurrentTime;
    }
    return dateFormat.format(value);
  }
}