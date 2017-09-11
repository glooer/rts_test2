package web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AuthServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      resp.setContentType("text/html;charset=utf-8");

      System.out.println(req.getParameter("unlogin"));

      if (req.getParameter("unlogin").equals("true")) {
        Cookie userCookie = new Cookie("auth_hash", null);
        userCookie.setMaxAge(-1);
        userCookie.setPath("/");
        resp.addCookie(userCookie);
      }

      resp.sendRedirect("/");
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      resp.setContentType("text/html;charset=utf-8");

      String hash = helper.Auth.auth(req.getParameter("email"), req.getParameter("password"));

      if (hash.length() == 0) {
        resp.sendRedirect("/auth/?state=nope");
      } else {
        Cookie userCookie = new Cookie("auth_hash", hash);

        if (req.getParameter("is_remember") != null && req.getParameter("is_remember").equals("true")) {
          userCookie.setMaxAge(60*60*24*365); //Store cookie for 1 year
        }

        userCookie.setPath("/"); //Store cookie for 1 year
        resp.addCookie(userCookie);
        resp.sendRedirect("/");
      }
    }
}
