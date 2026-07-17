package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tap.DAO.PaymentDAO;
import com.tap.Model.Payment;
import com.tap.utility.DBConnection;

public class PaymentDAOImp implements PaymentDAO {

    private static final String INSERT_PAYMENT =
            "INSERT INTO payments(orderId,userId,amount,paymentMethod,transactionId,paymentStatus) VALUES(?,?,?,?,?,?)";

    private static final String GET_PAYMENT =
            "SELECT * FROM payments WHERE orderId=?";

    private static final String UPDATE_PAYMENT =
            "UPDATE payments SET paymentStatus=? WHERE transactionId=?";

    @Override
    public int insertPayment(Payment payment) {

        int result = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt = con.prepareStatement(INSERT_PAYMENT);

            pstmt.setInt(1, payment.getOrderId());
            pstmt.setInt(2, payment.getUserId());
            pstmt.setDouble(3, payment.getAmount());
            pstmt.setString(4, payment.getPaymentMethod());
            pstmt.setString(5, payment.getTransactionId());
            pstmt.setString(6, payment.getPaymentStatus());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public Payment getPaymentByOrderId(int orderId) {

        Payment payment = null;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt = con.prepareStatement(GET_PAYMENT);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                payment = new Payment();

                payment.setPaymentId(rs.getInt("paymentId"));
                payment.setOrderId(rs.getInt("orderId"));
                payment.setUserId(rs.getInt("userId"));
                payment.setAmount(rs.getDouble("amount"));
                payment.setPaymentMethod(rs.getString("paymentMethod"));
                payment.setTransactionId(rs.getString("transactionId"));
                payment.setPaymentStatus(rs.getString("paymentStatus"));
                payment.setPaymentDate(rs.getTimestamp("paymentDate"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payment;
    }

    @Override
    public int updatePaymentStatus(String transactionId, String paymentStatus) {

        int result = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt = con.prepareStatement(UPDATE_PAYMENT);

            pstmt.setString(1, paymentStatus);
            pstmt.setString(2, transactionId);

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

}