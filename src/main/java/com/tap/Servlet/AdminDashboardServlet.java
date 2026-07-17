package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrdersDAOImp;
import com.tap.DAOImpl.RestaurantDAOImp;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.Orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAOImp restaurantDAO = new RestaurantDAOImp();
        UserDAOImpl userDAO = new UserDAOImpl();
        OrdersDAOImp ordersDAO = new OrdersDAOImp();

        // Dashboard Counts
        int restaurantCount = restaurantDAO.getAllRestaurants().size();
        int customerCount = userDAO.getAllUsers().size();
        int orderCount = ordersDAO.getAllOrders().size();

        // Revenue
        double totalRevenue = 0;

        int placedCount = 0;
        int preparingCount = 0;
        int outForDeliveryCount = 0;
        int deliveredCount = 0;
        int cancelledCount = 0;

        List<Orders> orderList = ordersDAO.getAllOrders();

        for (Orders order : orderList) {

            totalRevenue += order.getAmount();

            if ("Placed".equalsIgnoreCase(order.getStatus())) {

                placedCount++;

            } else if ("Preparing".equalsIgnoreCase(order.getStatus())) {

                preparingCount++;

            } else if ("Out For Delivery".equalsIgnoreCase(order.getStatus())) {

                outForDeliveryCount++;

            } else if ("Delivered".equalsIgnoreCase(order.getStatus())) {

                deliveredCount++;

            } else if ("Cancelled".equalsIgnoreCase(order.getStatus())) {

                cancelledCount++;

            }

        }

        request.setAttribute("restaurantCount", restaurantCount);
        request.setAttribute("customerCount", customerCount);
        request.setAttribute("orderCount", orderCount);

        request.setAttribute("totalRevenue", totalRevenue);

        request.setAttribute("placedCount", placedCount);
        request.setAttribute("preparingCount", preparingCount);
        request.setAttribute("outForDeliveryCount", outForDeliveryCount);
        request.setAttribute("deliveredCount", deliveredCount);
        request.setAttribute("cancelledCount", cancelledCount);

        request.setAttribute("orderList", orderList);

        request.getRequestDispatcher("adminDashboard.jsp")
               .forward(request, response);

    }

}