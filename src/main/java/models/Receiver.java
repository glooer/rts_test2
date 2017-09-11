package models;

public class Receiver extends Base {
  protected String email;

  public Receiver(int id, String name, String email) {
    this.id = id;
    this.name = name;
    this.email = email;
  }

  public String getName() {
    return this.name;
  }

  public String getEmail() {
    return this.email;
  }
}
