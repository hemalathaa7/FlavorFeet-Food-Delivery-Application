package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminCustomersServlet")
public class AdminCustomersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        UserDAOImpl userDAO = new UserDAOImpl();

        // Fetch all customers
        List<user> customerList = userDAO.getAllUsers();

        // Send customer list to JSP
        request.setAttribute("customerList", customerList);

        // Open Manage Customers page
        request.getRequestDispatcher("manageCustomers.jsp")
               .forward(request, response);

    }

}