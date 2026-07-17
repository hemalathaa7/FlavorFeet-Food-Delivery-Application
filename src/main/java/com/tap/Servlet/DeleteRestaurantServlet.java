package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.RestaurantDAOImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteRestaurantServlet")
public class DeleteRestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

        RestaurantDAOImp dao = new RestaurantDAOImp();

        dao.deleteRestaurant(restaurantId);

        response.sendRedirect("AdminRestaurantServlet");

    }

}