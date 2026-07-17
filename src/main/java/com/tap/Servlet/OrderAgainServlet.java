package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDAOImp;
import com.tap.DAOImpl.OrderItemDAOImp;
import com.tap.Model.Cart;
import com.tap.Model.CartItem;
import com.tap.Model.Menu;
import com.tap.Model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderAgainServlet")
public class OrderAgainServlet extends HttpServlet {

	
	
	@Override
	protected void doGet(HttpServletRequest req,
	        HttpServletResponse resp)
	        throws ServletException, IOException {

	    doPost(req, resp);

	}
    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        int orderId =
                Integer.parseInt(req.getParameter("orderId"));

        OrderItemDAOImp orderItemDAO =
                new OrderItemDAOImp();

        List<OrderItem> orderItems =
                orderItemDAO.getOrderItemsByOrderId(orderId);

        Cart cart = new Cart();

        MenuDAOImp menuDAO = new MenuDAOImp();

        for (OrderItem orderItem : orderItems) {

            Menu menu =
                    menuDAO.getMenu(orderItem.getMenuId());

            CartItem cartItem = new CartItem();

            cartItem.setMenuId(menu.getMenuId());
            cartItem.setRestaurantId(menu.getRestaurantId());
            cartItem.setName(menu.getItemName());
            cartItem.setPrice(menu.getPrice());
            cartItem.setQuantity(orderItem.getQuantity());

            cart.addItem(cartItem);
        }

        session.setAttribute("cart", cart);

        resp.sendRedirect("cart.jsp");
    }
}