package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrderItemDAOImp;
import com.tap.DAOImpl.OrdersDAOImp;
import com.tap.Model.RestaurantPerformance;
import com.tap.Model.TopSellingItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ReportsServlet")
public class ReportsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

        OrdersDAOImp ordersDAO = new OrdersDAOImp();
        OrderItemDAOImp orderItemDAO = new OrderItemDAOImp();

        if (fromDate != null && !fromDate.isEmpty()
                && toDate != null && !toDate.isEmpty()) {

            request.setAttribute("totalRevenue",
                    ordersDAO.getRevenueBetweenDates(fromDate, toDate));

            request.setAttribute("totalOrders",
                    ordersDAO.getOrdersBetweenDates(fromDate, toDate));

            List<RestaurantPerformance> performance =
                    ordersDAO.getRestaurantPerformance(fromDate, toDate);

            request.setAttribute("restaurantPerformance", performance);

            List<TopSellingItem> topItems =
                    orderItemDAO.getTopSellingItems(fromDate, toDate);

            request.setAttribute("topItems", topItems);

        } else {

            request.setAttribute("totalRevenue",
                    ordersDAO.getTotalRevenue());

            request.setAttribute("totalOrders",
                    ordersDAO.getOrdersCount());

            request.setAttribute("restaurantPerformance",
                    ordersDAO.getRestaurantPerformance());

            request.setAttribute("topItems",
                    orderItemDAO.getTopSellingItems());
        }

        request.getRequestDispatcher("reports.jsp")
               .forward(request, response);
    }
}