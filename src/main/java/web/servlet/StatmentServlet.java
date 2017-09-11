package web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Statment;
import models.Receiver;

public class StatmentServlet extends HttpServlet {

  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    resp.setContentType("text/html;charset=utf-8");
    PrintWriter pw = resp.getWriter();

    String search = req.getParameter("search");

    ArrayList<Statment> statments = repo.StatmentRepo.search(search);

    String res = "";
    if (statments.isEmpty()) {
      res = "Ничего не найдено.";
    } else {
      for (Statment statment : statments) {
        res += "<div class='form-group'>";
          res += "<div><b>От:</b> " + helper.Auth.getEmailById(statment.getUserId()) + "</div>";
          res += "<div><b>Кому:</b> " + repo.ReceiverRepo.getById(statment.getReceiverId()) + "</div>";
          res += "<div><b>ФИО отправителя:</b> " + statment.getFullName() + "</div>";
          res += "<div><b>Тема:</b> " + statment.getTitle() + "</div>";
          res += "<div><b>Сообщение:</b> " + statment.getMessage() + "</div>";
        res += "</div>";
      }
    }



    pw.println(res);
  }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter pw = resp.getWriter();

        ArrayList<String> errors = new ArrayList();

        Statment statment = new Statment();
        String search = "";

        if (req.getParameter("form_last-name") != null && !req.getParameter("form_last-name").equals("")) {
          statment.setLastName(req.getParameter("form_last-name"));
          search += req.getParameter("form_last-name");
        }

        if (req.getParameter("form_first-name") != null && !req.getParameter("form_first-name").equals("")) {
          statment.setFirstName(req.getParameter("form_first-name"));
          search += req.getParameter("form_first-name");
        }

        if (req.getParameter("form_middle-name") != null && !req.getParameter("form_middle-name").equals("")) {
          statment.setMiddleName(req.getParameter("form_middle-name"));
          search += req.getParameter("form_middle-name");
        }

        if (req.getParameter("form_receiver-id") != null && !req.getParameter("form_receiver-id").equals("")) {
          statment.setReceiverId(Integer.valueOf(req.getParameter("form_receiver-id")));
          Receiver receiver = repo.ReceiverRepo.getById(Integer.valueOf(req.getParameter("form_receiver-id")));
          search += receiver.getEmail() + receiver.getName();
        }

        if (req.getParameter("form-title") != null && !req.getParameter("form-title").equals("")) {
          statment.setTitle(req.getParameter("form-title"));
          search += req.getParameter("form-title");
        }

        if (req.getParameter("form_text-message") != null && !req.getParameter("form_text-message").equals("")) {
          statment.setMessage(req.getParameter("form_text-message"));
          search += req.getParameter("form_text-message");
        }


        // если пользователь авторизован поставляем его, иначе пытаемся найти в бд пользоватьеля гость
        String auth_hash = helper.Auth.getHashIfExist(req.getCookies());

        String user_email = helper.Auth.isAuth(auth_hash);

        if (user_email.equals("")) {
          user_email = "guest@example.com";
        }

        statment.setUserId(helper.Auth.getIdByEmail(user_email));

        statment.setSearch(search);

        repo.StatmentRepo.add(statment);


        pw.println("ok");
    }
}
