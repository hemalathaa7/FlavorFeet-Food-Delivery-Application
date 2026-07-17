package com.tap.Servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callLoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String userName = req.getParameter("userName");
        String password = req.getParameter("password");

        UserDAOImpl userDAOImp = new UserDAOImpl();
        user user = userDAOImp.getUserByUsername(userName);

        if (user != null) {

            String dbPassword = user.getPassword();

            if (BCrypt.checkpw(password, dbPassword)) {

                HttpSession session = req.getSession();

                session.setAttribute("user", user);
                session.setAttribute("userName", user.getUserName());
                session.setAttribute("role", user.getRole());

                System.out.println("==================================");
                System.out.println("Login Successful");
                System.out.println("Username : " + user.getUserName());
                System.out.println("Role : " + user.getRole());
                System.out.println("==================================");

                String role = user.getRole();

                if (role.equalsIgnoreCase("Admin")) {
                    resp.sendRedirect("AdminDashboardServlet");
                }
                else if (role.equalsIgnoreCase("Customer")) {
                    resp.sendRedirect("home.jsp");
                }
                else if (role.equalsIgnoreCase("Delivery Agent")) {
                    resp.sendRedirect("deliveryDashboard.jsp");
                }
                else {
                    session.invalidate();
                    resp.sendRedirect("login.html");
                }

                return;
            }
            else {
                System.out.println("Invalid Password");
                resp.sendRedirect("login.html");
                return;
            }
        }
    }
}