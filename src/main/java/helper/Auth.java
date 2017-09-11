package helper;

import org.apache.commons.codec.digest.DigestUtils;
import java.security.SecureRandom;
import javax.servlet.http.Cookie;

public class Auth {

  public static boolean isOperator(String email) {
    Db db = new Db();
    boolean is_operator = db.query("SELECT is_operator FROM users WHERE email = " + helper.Other.escapeString(email), result -> {
      if (result.next()) {
        return result.getBoolean(1);
      } else {
        return false;
      }
    });

    db.close();

    return is_operator;
  }

  public static String getHashIfExist(Cookie[] cookies) {
    String auth_hash = "";


    if (cookies != null) {
      for (Cookie cookie : cookies) {
        if (cookie.getName().equals("auth_hash")) {
          auth_hash = cookie.getValue();
        };
      }
    }


    return auth_hash;
  }

  public static String getRandomHash(int len) {
    String abc = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    SecureRandom rnd = new SecureRandom();
    String res = "";

    while (--len > 0) {
      res += abc.charAt( rnd.nextInt(abc.length()) ) ;
    }

    return res;
  }

  public static String isAuth(String hash) {
    Db db = new Db();
    String email = db.query("SELECT email FROM users WHERE auth_hash = " + helper.Other.escapeString(hash), result -> {
      if (result.next()) {
        return result.getString(1);
      } else {
        return "";
      }
    });

    db.close();

    return email;
  }

  public static String auth(String email, String password) {

    if (email.isEmpty() || password.isEmpty()) {
      return "";
    }

    int uid = check(email, password);

    if (uid == 0) {
      return "";
    }

    String hash = getRandomHash(32);
    setHashToUser(uid, hash);
    return hash;
  }

  public static int check(String email, String password) {
    Db db = new Db();


    int id = db.query("SELECT id FROM users WHERE email = " + helper.Other.escapeString(email) + " AND pass = '" + DigestUtils.md5Hex(password) + "'", result -> {
      if (result.next()) {
        return result.getInt(1);
      } else {
        return 0;
      }
    });

    db.close();
    return id;
  }

  public static String getEmailById(int id) {
    Db db = new Db();
    String email = db.query("SELECT email FROM users WHERE id = " + id, result -> {
      if (result.next()) {
        return result.getString(1);
      } else {
        return "";
      }
    });

    db.close();

    return email;
  }

  public static int getIdByEmail(String email) {
    Db db = new Db();
    int id = db.query("SELECT id FROM users WHERE email = " + helper.Other.escapeString(email), result -> {
      if (result.next()) {
        return result.getInt(1);
      } else {
        return 0;
      }
    });

    db.close();

    return id;
  }

  public static void setHashToUser(int uid, String hash) {
    Db db = new Db();

    db.execUpdate("UPDATE users SET auth_hash = '" + hash + "' WHERE id = " + uid);

    db.close();
  }


}
