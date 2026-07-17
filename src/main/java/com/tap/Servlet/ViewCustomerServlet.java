package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewCustomerServlet")
public class ViewCustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get Customer ID
            int userId = Integer.parseInt(request.getParameter("userId"));

            // DAO Object
            UserDAOImpl userDAO = new UserDAOImpl();

            // Fetch Customer
            user customer = userDAO.getUser(userId);

            if (customer != null) {

                request.setAttribute("customer", customer);

                request.getRequestDispatcher("viewCustomer.jsp")
                       .forward(request, response);

            } else {

                response.sendRedirect("AdminCustomersServlet");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("AdminCustomersServlet");
        }
    }
}