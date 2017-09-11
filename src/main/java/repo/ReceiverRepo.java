package repo;
import java.util.ArrayList;
import java.util.HashMap;
import helper.Db;
import models.Receiver;

public class ReceiverRepo {
  public static ArrayList<Receiver> getList() {
    Db db = new Db();
    ArrayList<Receiver> receivers = db.query("SELECT * FROM receivers", result -> {

      ArrayList<Receiver> receivers_acc = new ArrayList();
      Receiver receiver;

      while (result.next()) {
        receiver = new Receiver(result.getInt("id"), result.getString("name"), result.getString("email"));
        receivers_acc.add(receiver);
      }

      return receivers_acc;
    });

    db.close();

    return receivers;
  }

  public static Receiver getById(int id) {
    Db db = new Db();
    Receiver receivers = db.query("SELECT * FROM receivers WHERE id = " + id, result -> {
      result.next();
      return (new Receiver(result.getInt("id"), result.getString("name"), result.getString("email")));
    });

    db.close();

    return receivers;
  }


}
