package web.app.search;


import java.util.ArrayList;
import java.util.HashMap;
import models.Human;
import models.Car;
// import java.io.IOException;
// import java.io.PrintWriter;
//
// import javax.servlet.ServletException;
// import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;

public class SearchHuman {
  public static HashMap<String, Human> byHttpParams(HttpServletRequest req) {

    ArrayList<HashMap<String, String>> filter = new ArrayList();
    HashMap<String, String> filter_item = new HashMap();


    String[] params = new String[] { "first_name", "last_name", "middle_name", "city", "car", "car_gos" };


    for (String param : params) {
      if (req.getParameter(param) != null && !req.getParameter(param).isEmpty()) {
        filter_item = new HashMap<String, String>();
        filter_item.put("key", param);
        filter_item.put("value", "%" + req.getParameter(param) + "%");
        filter.add(filter_item);
      }
    }

    HashMap<String, Human> userList = new HashMap();

    if (!filter_item.isEmpty()) {
      userList = repo.HumanRepo.find(filter);
    }


    return userList;
  }

  public static String getHtml(HashMap<String, Human> userList) {

    if (userList.isEmpty()) {
      return "Ничего не найдено.";
    }

    String result = "<table class=\"table\">";

    result += "<tr>";
    result += "<th>Имя</th>";
    result += "<th>Город</th>";
    result += "<th>Машина</th>";
    result += "</tr>";

    for (Human human : userList.values()) {
      result += "<tr>";
      result += "<td>" + human.getFullName() + "</td>";
      result += "<td>" + human.getCity() + "</td>";
      result += "<td>";
      for (Car car : human.getCar()) {
        result += car;
        result += "<br>";

      }
      result += "</td>";

      result += "</tr>";
    }

    result += "<table>";

    return result;
  }
}
