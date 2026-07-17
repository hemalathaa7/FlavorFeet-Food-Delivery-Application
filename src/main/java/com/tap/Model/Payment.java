package com.tap.Model;

import java.sql.Timestamp;

public class Payment {

    private int paymentId;

    private int orderId;

    private int userId;

    private double amount;

    private String paymentMethod;

    private String transactionId;

    private String paymentStatus;

    private Timestamp paymentDate;

    public Payment() {

    }

    public Payment(int orderId, int userId, double amount,
            String paymentMethod,
            String transactionId,
            String paymentStatus) {

        this.orderId = orderId;
        this.userId = userId;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.transactionId = transactionId;
        this.paymentStatus = paymentStatus;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Timestamp getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Timestamp paymentDate) {
        this.paymentDate = paymentDate;
    }

}