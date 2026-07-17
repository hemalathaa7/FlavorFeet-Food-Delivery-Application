package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImp;
import com.tap.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateMenuServlet")
public class UpdateMenuServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        boolean isAvailable = Boolean.parseBoolean(request.getParameter("isAvailable"));
        String imagePath = request.getParameter("imagePath");

        Menu menu = new Menu();

        menu.setMenuId(menuId);
        menu.setRestaurantId(restaurantId);
        menu.setItemName(itemName);
        menu.setDescription(description);
        menu.setPrice(price);
        menu.setAvailable(isAvailable);
        menu.setImagePath(imagePath);

        MenuDAOImp dao = new MenuDAOImp();

        dao.updateMenu(menu);

        response.sendRedirect("AdminMenuServlet");
    }
}