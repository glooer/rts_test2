package helper;

public class Other {
  public static String escapeString(String str) {
    return "'" +
      str
      .replace("\\", "\\\\")
      .replace("\0", "\\0")
      .replace("'", "\\'")
      .replace("\"", "\\\"")
      .replace("\b", "\\b")
      .replace("\n", "\\n")
      .replace("\r", "\\r")
      .replace("\t", "\\t")
      + "'";
  }

  public static String replaceNull(String str) {
    return str == null ? "" : str;
  }
}
