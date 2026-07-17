package com.tap.Servlet;

import java.io.IOException;
import java.time.LocalTime;

import com.tap.DAOImpl.RestaurantDAOImp;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateRestaurantServlet")
public class UpdateRestaurantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int restaurantId =
                Integer.parseInt(request.getParameter("restaurantId"));

        String restaurantName =
                request.getParameter("restaurantName");

        String address =
                request.getParameter("address");

        String cuisineType =
                request.getParameter("cuisineType");

        LocalTime openingTime =
                LocalTime.parse(request.getParameter("openingTime"));

        LocalTime closingTime =
                LocalTime.parse(request.getParameter("closingTime"));

        double rating =
                Double.parseDouble(request.getParameter("rating"));

        int amount =
                Integer.parseInt(request.getParameter("amount"));

        String imagePath =
                request.getParameter("imagePath");

        Restaurant restaurant = new Restaurant();

        restaurant.setRestaurantId(restaurantId);
        restaurant.setRestaurantName(restaurantName);
        restaurant.setAddress(address);
        restaurant.setCuisineType(cuisineType);
        restaurant.setOpeningTime(openingTime);
        restaurant.setClosingTime(closingTime);
        restaurant.setRating(rating);
        restaurant.setAmount(amount);
        restaurant.setImagePath(imagePath);

        RestaurantDAOImp dao = new RestaurantDAOImp();

        dao.updateRestaurant(restaurant);

        response.sendRedirect("AdminRestaurantServlet");

    }

}