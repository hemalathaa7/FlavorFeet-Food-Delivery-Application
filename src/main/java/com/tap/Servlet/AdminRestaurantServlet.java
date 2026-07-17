package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.RestaurantDAOImp;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminRestaurantServlet")
public class AdminRestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAOImp restaurantDAO = new RestaurantDAOImp();

        // Fetch all restaurants
        List<Restaurant> restaurantList =
                restaurantDAO.getAllRestaurants();

        // Send to JSP
        request.setAttribute("restaurantList", restaurantList);

        // Open Manage Restaurants Page
        request.getRequestDispatcher("manageRestaurant.jsp")
               .forward(request, response);

    }

}