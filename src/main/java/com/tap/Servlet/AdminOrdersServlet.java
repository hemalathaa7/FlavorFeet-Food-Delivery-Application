package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrdersDAOImp;
import com.tap.Model.Orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminOrdersServlet")
public class AdminOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        OrdersDAOImp ordersDAO = new OrdersDAOImp();

        // Get all orders
        List<Orders> orderList = ordersDAO.getAllOrders();

        // Send to JSP
        request.setAttribute("orderList", orderList);

        // Open Manage Orders Page
        request.getRequestDispatcher("manageOrders.jsp")
               .forward(request, response);

    }

}