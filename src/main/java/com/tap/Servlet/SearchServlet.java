package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDAOImp;
import com.tap.DAOImpl.RestaurantDAOImp;
import com.tap.Model.Menu;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    String query = req.getParameter("query");

	    MenuDAOImp menuDAO = new MenuDAOImp();
	    RestaurantDAOImp restaurantDAO = new RestaurantDAOImp();

	    // ADD THESE TWO LINES
	    List<Menu> menuList = menuDAO.searchMenuItems(query);
	    List<Restaurant> restaurantList = restaurantDAO.searchRestaurants(query);

	    if (!menuList.isEmpty()) {
	        req.setAttribute("menuList", menuList);
	        req.getRequestDispatcher("menuSearchResults.jsp").forward(req, resp);
	    } else {
	        req.setAttribute("allRestaurants", restaurantList);
	        req.getRequestDispatcher("restaurant.jsp").forward(req, resp);
	    }
	}
}