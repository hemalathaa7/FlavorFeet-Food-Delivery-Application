package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String adress = request.getParameter("address");

        UserDAOImpl dao = new UserDAOImpl();

        // Get existing user from database
        user u = dao.getUser(userId);

        // Update details
        u.setUserName(userName);
        u.setEmail(email);
        u.setAdress(adress);

        // Save to database
        dao.UpdateUser(u);

        // Update session
        HttpSession session = request.getSession();
        session.setAttribute("user", u);

        // Redirect based on role
        if ("Admin".equalsIgnoreCase(u.getRole())) {
            response.sendRedirect("SettingsServlet");
        } else {
            response.sendRedirect("ProfileServlet");
        }
    }
}