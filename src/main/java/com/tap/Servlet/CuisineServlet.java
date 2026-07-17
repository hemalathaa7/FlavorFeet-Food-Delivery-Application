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

@WebServlet("/CuisineServlet")
public class CuisineServlet extends HttpServlet{
	

	    protected void doGet(HttpServletRequest request,
	                         HttpServletResponse response)
	                         throws ServletException, IOException {

	        String cuisine = request.getParameter("cuisine");

	        MenuDAOImp dao = new MenuDAOImp();

	        List<Menu> menuList =
	                dao.getMenuByCuisine(cuisine);
	        

                 System.out.println("Cuisine :" + cuisine);
                 System.out.println("Menu Count : " + menuList.size());


	        request.setAttribute("menuList", menuList);
	        request.setAttribute("cuisine", cuisine);

	        request.getRequestDispatcher("cuisineMenu.jsp")
	               .forward(request,response);
	    }
	}

