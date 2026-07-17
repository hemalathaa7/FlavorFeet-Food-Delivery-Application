package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.OrdersDAOImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        String status = request.getParameter("status");

        OrdersDAOImp dao = new OrdersDAOImp();

        dao.updateOrderStatus(orderId, status);

        response.sendRedirect("AdminOrdersServlet");

    }

}