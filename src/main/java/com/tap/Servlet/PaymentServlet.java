package com.tap.Servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.tap.DAO.PaymentDAO;
import com.tap.DAOImpl.PaymentDAOImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.tap.Model.Payment;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.println("PaymentServlet Executed");
    	
    	
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        int userId = Integer.parseInt(request.getParameter("userId"));

        double amount = Double.parseDouble(request.getParameter("amount"));

        String paymentMethod = "UPI";

        String paymentStatus = "SUCCESS";

        String transactionId =
                "TXN" +
                new SimpleDateFormat("yyyyMMddHHmmss")
                .format(new Date());

        Payment payment = new Payment();

        payment.setOrderId(orderId);
        payment.setUserId(userId);
        payment.setAmount(amount);
        payment.setPaymentMethod(paymentMethod);
        payment.setTransactionId(transactionId);
        payment.setPaymentStatus(paymentStatus);

        PaymentDAO dao = new PaymentDAOImp();

        int result = dao.insertPayment(payment);

        if(result > 0) {

            request.setAttribute("transactionId", transactionId);
            request.setAttribute("amount", amount);

            request.getRequestDispatcher("paymentSuccess.jsp")
                   .forward(request, response);

        } else {

            response.sendRedirect("payment.jsp");

        }

    }

}