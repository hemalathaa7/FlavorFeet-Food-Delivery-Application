package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditCustomerServlet")
public class EditCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        UserDAOImpl dao = new UserDAOImpl();

        user customer = dao.getUser(userId);

        request.setAttribute("customer", customer);

        request.getRequestDispatcher("editCustomer.jsp")
               .forward(request, response);
    }
}