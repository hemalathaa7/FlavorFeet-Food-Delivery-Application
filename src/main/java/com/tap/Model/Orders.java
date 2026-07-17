package com.tap.Model;

import java.sql.Timestamp;

public class Orders {
	
	private int OrderId;
	private int  userId;
	private int  RestaurantId;
	private Timestamp  orderDate;
	private String  status;
	private String  paymentMode;
	private String  deliveryAddress;
	private double  amount;
	
	private String userName;
	private String restaurantName;
	
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Orders(int orderId, int userId, int restaurantId, Timestamp orderDate, String status, String paymentMode,
			String deliveryAddress, double amount, String userName, String restaurantName) {
		super();
		OrderId = orderId;
		this.userId = userId;
		RestaurantId = restaurantId;
		this.orderDate = orderDate;
		this.status = status;
		this.paymentMode = paymentMode;
		this.deliveryAddress = deliveryAddress;
		this.amount = amount;
		this.userName = userName;
		this.restaurantName = restaurantName;
	}
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRestaurantId() {
		return RestaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		RestaurantId = restaurantId;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	@Override
	public String toString() {
		return "Orders [OrderId=" + OrderId + ", userId=" + userId + ", RestaurantId=" + RestaurantId + ", orderDate="
				+ orderDate + ", status=" + status + ", paymentMode=" + paymentMode + ", deliveryAddress="
				+ deliveryAddress + ", amount=" + amount + ", userName=" + userName + ", restaurantName="
				+ restaurantName + "]";
	}
	
	
}
