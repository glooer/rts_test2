package models;

import java.util.Arrays;

public class Statment {
  protected int id;
  protected int receiver_id;
  protected int user_id = 2;
  protected String first_name;
  protected String last_name;
  protected String middle_name;
  protected String title;
  protected String message;
  protected String search;


  public Statment() {

  }

  public void setId(int id) {
    this.id = id;
  }

  public void setFirstName(String first_name) {
    this.first_name = first_name;
  }

  public void setLastName(String last_name) {
    this.last_name = last_name;
  }

  public void setMiddleName(String middle_name) {
    this.middle_name = middle_name;
  }

  public void setReceiverId(int receiver_id) {
    this.receiver_id = receiver_id;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public void setUserId(int user_id) {
    this.user_id = user_id;
  }

  public String getFirstName() {
    return this.first_name;
  }

  public String getLastName() {
    return this.last_name;
  }

  public String getMiddleName() {
    return this.middle_name;
  }

  public int getReceiverId() {
    return this.receiver_id;
  }

  public String getTitle() {
    return this.title;
  }

  public String getMessage() {
    return this.message;
  }

  public int getUserId() {
    return this.user_id;
  }

  public void setSearch(String search) {
    this.search = search;
  }

  public String getSearch() {
    return this.search;
  }

  public String getFullName() {
    String[] fio = { this.first_name, this.middle_name, this.last_name };
    fio = Arrays.stream(fio).filter(s -> s != null && !s.isEmpty()).toArray(String[]::new);

    return String.join(" ", fio);
  }



}
