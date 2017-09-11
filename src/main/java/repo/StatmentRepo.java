package repo;
import java.util.ArrayList;
import java.util.HashMap;
import helper.Db;
import models.Statment;

public class StatmentRepo {

  public static ArrayList<Statment> search(String search) {

    String query = "SELECT * FROM statment WHERE search like '%" + helper.Other.replaceNull(search) + "%' ORDER BY id DESC";


    Db db = new Db();
    ArrayList<Statment> statments = db.query(query, result -> {

      ArrayList<Statment> statments_acc = new ArrayList();
      Statment statment;

      while ( result.next() ) {
        statment = new Statment();

        statment.setFirstName(result.getString("first_name"));
        statment.setLastName(result.getString("last_name"));
        statment.setMiddleName(result.getString("middle_name"));
        statment.setReceiverId(result.getInt("receiver_id"));
        statment.setUserId(result.getInt("user_id"));
        statment.setTitle(result.getString("title"));
        statment.setMessage(result.getString("message"));
        statment.setSearch(result.getString("search"));
        statment.setId(result.getInt("id"));

        statments_acc.add(statment);
      }
      return statments_acc;
    });
    db.close();

    return statments;
  }

  public static void add(Statment statment) {
    Db db = new Db();

    ArrayList<String> values = new ArrayList();
    values.add(String.valueOf(statment.getUserId()));
    values.add(String.valueOf(statment.getReceiverId()));
    values.add(statment.getLastName());
    values.add(statment.getFirstName());
    values.add(statment.getMiddleName());
    values.add(statment.getTitle());
    values.add(statment.getMessage());
    values.add(statment.getSearch());

    String val_query = "";
    for (String value : values) {
      val_query += helper.Other.escapeString(value) + ", ";
    }

    val_query = val_query.substring(0, val_query.length() - 2);

    String query = "INSERT INTO statment (user_id, receiver_id, last_name, first_name, middle_name, title, message, search) VALUES (" + val_query + ")";

    System.out.println(query);

    db.execUpdate(query);

    db.close();
  }


}
