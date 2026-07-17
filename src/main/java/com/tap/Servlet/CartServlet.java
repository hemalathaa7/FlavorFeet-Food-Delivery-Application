package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImp;
import com.tap.Model.Cart;
import com.tap.Model.CartItem;
import com.tap.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

        String restaurantParam = req.getParameter("restaurantId");
        int newRestaurantId = 0;

        if (restaurantParam != null && !restaurantParam.isEmpty()) {
            newRestaurantId = Integer.parseInt(restaurantParam);
        }

        // create new cart if no cart exists OR restaurant changed
        if (cart == null || restaurantId == null || restaurantId != newRestaurantId) {
            cart = new Cart();
            session.setAttribute("cart", cart);
            session.setAttribute("restaurantId", newRestaurantId);
        }

        String action = req.getParameter("action");

        if (action != null) {
            if (action.equals("add")) {
                addItemToCart(req, cart);
            } 
            else if (action.equals("update")) {
                updateCartItem(req, cart);
            } 
            else if (action.equals("delete")) {
                deleteItemFromCart(req, cart);
            }
        }

        resp.sendRedirect("cart.jsp");
    }

    // ADD ITEM TO CART
    private void addItemToCart(HttpServletRequest req, Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        MenuDAOImp menuDAOImp = new MenuDAOImp();
        Menu menu = menuDAOImp.getMenu(menuId);

        if (menu != null) {
            CartItem cartItem = new CartItem(
                    menuId,
                    menu.getRestaurantId(),
                    menu.getItemName(),
                    menu.getPrice(),
                    quantity
            );

            // IMPORTANT: add item to cart object
            cart.addItem(cartItem);
        }
    }

    // UPDATE ITEM
    private void updateCartItem(HttpServletRequest req, Cart cart) {
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        cart.updateItem(menuId, quantity);
    }

    // DELETE ITEM
    private void deleteItemFromCart(HttpServletRequest req, Cart cart) {
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        cart.removeItem(menuId);
    }
}