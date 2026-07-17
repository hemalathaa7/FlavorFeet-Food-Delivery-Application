package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.FavoriteDAOImp;
import com.tap.Model.FavoriteMenu;
import com.tap.Model.FavoriteRestaurant;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FavoriteDAOImp favoriteDAO;

    @Override
    public void init() throws ServletException {
        favoriteDAO = new FavoriteDAOImp();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        user user = (user) session.getAttribute("user");

        if(user == null){
            response.sendRedirect("login.html");
            return;
        }

        request.setAttribute("favoriteRestaurants",
                favoriteDAO.getFavoriteRestaurantDetails(user.getUserId()));

        request.setAttribute("favoriteMenus",
                favoriteDAO.getFavoriteMenuDetails(user.getUserId()));

        request.getRequestDispatcher("favorites.jsp")
               .forward(request, response);
    }
    
    
    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

    	
    	System.out.println("===== doPost Called =====");
    	
    	
    	
    	System.out.println("restaurantId = " + request.getParameter("restaurantId"));
    	
    	
    	
        HttpSession session = request.getSession();

        user user = (user) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        int userId = user.getUserId();

        String type = request.getParameter("type");
        String action = request.getParameter("action");

        if ("restaurant".equals(type)) {

            int restaurantId =
                    Integer.parseInt(request.getParameter("restaurantId"));

            if ("add".equals(action)) {

            	boolean status = favoriteDAO.addFavoriteRestaurant(
            		    new FavoriteRestaurant(userId, restaurantId));

            		System.out.println("Insert Status = " + status);

            } else {

                favoriteDAO.removeFavoriteRestaurant(userId, restaurantId);
            }

            
            String source = request.getParameter("source");

            if ("favorites".equals(source)) {
                response.sendRedirect("FavoriteServlet");
            } else {
                response.sendRedirect("callRestaurantServlet");
            }
            
        }

        else if ("menu".equals(type)) {

            System.out.println("===== MENU FAVORITE =====");
            System.out.println("menuId = " + request.getParameter("menuId"));
            System.out.println("restaurantId = " + request.getParameter("restaurantId"));

            int menuId = Integer.parseInt(request.getParameter("menuId"));

            boolean status;

            if ("add".equals(action)) {
                status = favoriteDAO.addFavoriteMenu(
                        new FavoriteMenu(userId, menuId));
            } else {
                status = favoriteDAO.removeFavoriteMenu(userId, menuId);
            }

            System.out.println("Insert Status = " + status);

            String restaurantId = request.getParameter("restaurantId");

            response.sendRedirect("menu?restaurantId=" + restaurantId);
        }
    }

}