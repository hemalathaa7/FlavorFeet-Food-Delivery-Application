package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.OrdersDAOImp;
import com.tap.Model.Orders;
import com.tap.DAOImpl.RestaurantDAOImp;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewOrderServlet")
public class ViewOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        OrdersDAOImp dao = new OrdersDAOImp();

        Orders order = dao.getOrderById(orderId);

        
        RestaurantDAOImp restaurantDao = new RestaurantDAOImp();

        Restaurant restaurant =
                restaurantDao.getRestaurantById(order.getRestaurantId());

        
        request.setAttribute("order", order);
        request.setAttribute("restaurant", restaurant);

        request.getRequestDispatcher("orderDetails.jsp").forward(request, response);
    }
}