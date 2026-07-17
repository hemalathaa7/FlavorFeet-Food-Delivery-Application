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

@WebServlet("/SettingsServlet")
public class SettingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // User not logged in
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.html");
            return;
        }

        // Logged in user
        user sessionUser = (user) session.getAttribute("user");

        // Get latest user details from database
        UserDAOImpl userDAO = new UserDAOImpl();

        user admin = userDAO.getUser(sessionUser.getUserId());

        // Send to JSP
        request.setAttribute("admin", admin);

        // Open Settings Page
        request.getRequestDispatcher("settings.jsp")
               .forward(request, response);
    }
}