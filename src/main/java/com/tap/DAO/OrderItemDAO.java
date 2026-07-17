package com.tap.DAO;

import java.util.List;

import com.tap.Model.OrderItem;

public interface OrderItemDAO {
	void addOrderItem(OrderItem OrderItem);
	OrderItem getOrderItem(int orderitemId);
	void updateOrderItem(OrderItem OrderItem);
	void deleteOrderItem(int orderitemId);
	List<OrderItem> getAllOrderItem();
	List<OrderItem> getOrderItemsByOrderId(int orderId);
}