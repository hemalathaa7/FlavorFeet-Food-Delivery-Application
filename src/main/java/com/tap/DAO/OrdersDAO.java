package com.tap.DAO;

import java.util.List;

import com.tap.Model.OrderItem;
import com.tap.Model.Orders;

public interface OrdersDAO {
	int addOrders(Orders Order);
	Orders getOrders(int OrderId);
	void updateOrder(Orders Order);
	void deleteOrder(int OrderId);
	List<Orders> getAllOrders();
	
	
	void updateOrderStatus(int orderId, String status);
	List<OrderItem> getOrderItemsByOrderId(int orderId);
	int getOrdersCount();
	Orders getOrderById(int orderId);

}


