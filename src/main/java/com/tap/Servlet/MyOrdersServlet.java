package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrdersDAOImp;
import com.tap.Model.Orders;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MyOrdersServlet")
public class MyOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("user") == null){

            response.sendRedirect("login.html");
            return;

        }

        user customer = (user)session.getAttribute("user");

        OrdersDAOImp dao = new OrdersDAOImp();

        System.out.println("Logged-in User ID = " + customer.getUserId());
        List<Orders> orderList = dao.getOrdersByUserId(customer.getUserId());
        System.out.println("Orders Found = " + orderList.size());

        request.setAttribute("orderList", orderList);

        request.getRequestDispatcher("myOrders.jsp")
               .forward(request, response);

    }

}