package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        UserDAOImpl dao = new UserDAOImpl();

        dao.deleteUser(userId);

        response.sendRedirect("AdminCustomersServlet");

    }

}