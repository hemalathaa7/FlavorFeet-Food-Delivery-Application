package com.tap.Model;

import java.sql.Timestamp;

public class OrderItem {
	
	
	private int OrderId;
	private int  orderitemId;
	private int quantity;                                       //Number of units ordered.     //	(Example: 2 Pizzas, 3 Burgers.)
	private double  itemtotal ;																				//Total cost for this item.
	private int  menuId;
	
	
	public OrderItem() {
		// TODO Auto-generated constructor stub
	}


	public OrderItem(int orderId, int orderitemId, int quantity, double itemtotal, int menuId) {
		super();
		OrderId = orderId;
		this.orderitemId = orderitemId;
		this.quantity = quantity;
		this.itemtotal = itemtotal;
		this.menuId = menuId;
	}


	public int getOrderId() {
		return OrderId;
	}


	public void setOrderId(int orderId) {
		OrderId = orderId;
	}


	public int getOrderitemId() {
		return orderitemId;
	}


	public void setOrderitemId(int orderitemId) {
		this.orderitemId = orderitemId;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public double getItemtotal() {
		return itemtotal;
	}


	public void setItemtotal(double itemtotal) {
		this.itemtotal = itemtotal;
	}


	public int getMenuId() {
		return menuId;
	}


	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}


	@Override
	public String toString() {
		return "OrderItem [OrderId=" + OrderId + ", orderitemId=" + orderitemId + ", quantity=" + quantity
				+ ", itemtotal=" + itemtotal + ", menuId=" + menuId + "]";
	}
	
	
}