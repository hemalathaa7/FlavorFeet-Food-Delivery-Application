package com.tap.Servlet;

import java.io.IOException;

import java.sql.SQLException;
import java.util.List;

import com.tap.DAOImpl.RestaurantDAOImp;
import com.tap.Model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/callRestaurantServlet")
public class RestaurantServlet extends HttpServlet {

	

	    @Override
	    protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {

	        try {

	            RestaurantDAOImp restaurantDAOImp = new RestaurantDAOImp();

	            List<Restaurant> allRestaurants = restaurantDAOImp.getAllRestaurants();
	            
	            req.setAttribute("allRestaurants", allRestaurants);

	            RequestDispatcher rd=req.getRequestDispatcher("restaurant.jsp");
	            rd.forward(req, resp);
	            

	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	    }
	}