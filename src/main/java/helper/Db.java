package helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Db {

  private Connection connect = null;

  public Db() {
    String url = "jdbc:postgresql://127.0.0.1:5432/test2";
    String name = "postgres";
    String password = "567056qQ";


    try {
      Class.forName("org.postgresql.Driver");
    } catch (ClassNotFoundException e) {
      System.out.println("Where is your PostgreSQL JDBC Driver? Include in your library path!");
      e.printStackTrace();
      return;
    }

    try {
      Class.forName("org.postgresql.Driver");
      this.connect = DriverManager.getConnection(url, name, password);
    } catch(Exception e) {
      e.printStackTrace();
    }
  }

  public void execUpdate(String update) {
    try {
      Statement stmt = this.connect.createStatement();
      stmt.execute(update);
      stmt.close();
    } catch (Exception e) {
      e.printStackTrace();
    }

  }

  public void close() {
    try {
      this.connect.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public <T> T query(String sql, DbResultHandler<T> handler) {

    T result = null;

    try {
      Statement stmt = this.connect.createStatement();

      ResultSet rs = stmt.executeQuery(sql);
      result = handler.handle(rs);

      stmt.close();
    } catch ( Exception e ) {
       System.err.println( e.getClass().getName()+": "+ e.getMessage() );
       System.exit(0);
    }


    return result;
  }

}
