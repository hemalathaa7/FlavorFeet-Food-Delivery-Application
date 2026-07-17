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

@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Check Login
        user user = (user) session.getAttribute("user");

        if(user == null) {
            response.sendRedirect("login.html");
            return;
        }

        // DAO Object
        OrdersDAOImp dao = new OrdersDAOImp();

        // Get All Orders
        List<Orders> orderList = dao.getAllOrders();

        // Send Orders to JSP
        request.setAttribute("orderList", orderList);

        // Open Orders Page
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }

}