package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.RestaurantDAOImp;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.time.LocalTime;
@WebServlet("/AddRestaurantServlet")
public class AddRestaurantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String restaurantName = request.getParameter("restaurantName");
        String address = request.getParameter("address");
        String cuisineType = request.getParameter("cuisineType");
        LocalTime openingTime = LocalTime.parse(request.getParameter("openingTime"));

        LocalTime closingTime = LocalTime.parse(request.getParameter("closingTime"));

        double rating = Double.parseDouble(request.getParameter("rating"));

        int amount = Integer.parseInt(request.getParameter("amount"));

        String imagePath = request.getParameter("imagePath");

        Restaurant restaurant = new Restaurant();

        restaurant.setRestaurantName(restaurantName);
        restaurant.setAddress(address);
        restaurant.setCuisineType(cuisineType);
        restaurant.setOpeningTime(openingTime);
        restaurant.setClosingTime(closingTime);
        restaurant.setRating(rating);
        restaurant.setAmount(amount);
        restaurant.setImagePath(imagePath);

        RestaurantDAOImp dao = new RestaurantDAOImp();

        dao.addRestaurant(restaurant);

        response.sendRedirect("AdminRestaurantServlet");
    }
}