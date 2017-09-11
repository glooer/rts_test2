package web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Receiver;

public class ReceiverServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter pw = resp.getWriter();

        String res = "";
        res += "<select class=\"form-control\" name=\"form_receiver-id\" id=\"form_receiver-id\">";
        for (Receiver receiver : repo.ReceiverRepo.getList()) {
          res += "<option value=\"" + receiver.getId() + "\">" + receiver.getName() + " - " + receiver.getEmail() + "</option>";
        }

        res += "</select>";




        pw.println(res);
    }
}
