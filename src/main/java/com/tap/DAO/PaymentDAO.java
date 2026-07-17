package com.tap.DAO;

import com.tap.Model.Payment;

public interface PaymentDAO {

    // Save payment details
    int insertPayment(Payment payment);

    // Get payment using Order ID
    Payment getPaymentByOrderId(int orderId);

    // Update payment status
    int updatePaymentStatus(String transactionId, String paymentStatus);

}