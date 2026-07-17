package com.tap.Servlet;

import java.io.IOException;
import java.sql.Timestamp;

import com.tap.DAOImpl.OrderItemDAOImp;
import com.tap.Model.OrderItem;
import com.tap.DAOImpl.OrdersDAOImp;
import com.tap.Model.Cart;
import com.tap.Model.CartItem;
import com.tap.Model.Orders;
import com.tap.Model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        user user = (user) session.getAttribute("user");

        if(user == null)
        {
            resp.sendRedirect("login.html");
            return;
        }

        String address = req.getParameter("address");
        String payment = req.getParameter("paymentMode");

        

        
        
        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        double total = Double.parseDouble(req.getParameter("totalAmount"));
        
       

        
        
        
        Orders order = new Orders();

        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
        order.setStatus("Placed");
        order.setPaymentMode(payment);
        order.setDeliveryAddress(address);
        order.setAmount(total);

        OrdersDAOImp dao = new OrdersDAOImp();

        int orderId = dao.addOrders(order);
        
        System.out.println("Generated Order ID = " + orderId);

        Cart cart = (Cart) session.getAttribute("cart");

        OrderItemDAOImp orderItemDAO = new OrderItemDAOImp();

        if (cart != null) {	

            for (CartItem item : cart.getItems().values()) {

                OrderItem orderItem = new OrderItem();

                orderItem.setOrderId(orderId);
                orderItem.setMenuId(item.getMenuId());
                orderItem.setQuantity(item.getQuantity());
                orderItem.setItemtotal(item.getPrice() * item.getQuantity());

                orderItemDAO.addOrderItem(orderItem);
            }
        }

     // Store details for payment page
        session.setAttribute("orderId", orderId);
        session.setAttribute("userId", user.getUserId());
        session.setAttribute("totalAmount", total);

        // Keep the cart until payment is successful
        resp.sendRedirect("payment.jsp");
    }

}