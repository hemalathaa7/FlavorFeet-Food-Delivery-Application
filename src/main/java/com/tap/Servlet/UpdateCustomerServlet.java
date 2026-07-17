package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String adress = request.getParameter("adress");
        String role = request.getParameter("role");

        user customer = new user();

        customer.setUserId(userId);
        customer.setUserName(userName);
        customer.setPassword(password);
        customer.setEmail(email);
        customer.setAdress(adress);
        customer.setRole(role);

        UserDAOImpl dao = new UserDAOImpl();

        dao.UpdateUser(customer);

        response.sendRedirect("AdminCustomersServlet");

    }

}