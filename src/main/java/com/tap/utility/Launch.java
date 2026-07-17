package com.tap.utility;

import java.util.List;
import java.util.Scanner;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.user;

public class Launch {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		
		
		// 4.ORDER_ITEM 
		
		//1.add Orderitem
		
//		System.out.println("Enter the OrderId"); 
//		int OrderId=scan.nextInt();	
//		System.out.println("Enter the orderitemId");
//		int orderitemId=scan.nextInt();	
//		System.out.println("Enter the quantity");
//		int quantity=scan.nextInt();	
//		System.out.println("Enter the itemtotal");	
//		double itemtotal =scan.nextDouble();
//		System.out.println("Enter the menuId");
//		int menuId=scan.nextInt();
//		
//		OrderItem oitem =new OrderItem(OrderId, orderitemId, quantity, itemtotal, menuId);
//		
//		OrderItemDAOImp oi=new OrderItemDAOImp();
//		oi.addOrderItem(oitem);
//	
		//2.GET_Orderitem
		
//		OrderItemDAOImp oi = new OrderItemDAOImp();
//		OrderItem oitem = oi.getOrderItem(2);
//		System.out.println(oitem);
//	

		//3.UPDATE_Orderitem
		
//	OrderItemDAOImp oi= new OrderItemDAOImp();
//	OrderItem oitem= oi.getOrderItem(101);
//		oitem.setItemtotal(1700);	
//	    oi.updateOrderItem(oitem);
//		System.out.println("Order item is updated");
	
//
		
//		//4.DELETE Order item
		
//		OrderItemDAOImp oi = new OrderItemDAOImp();
//		oi.deleteOrderItem(1);	
//		System.out.println("OrderItem Deleted");
	
//
//		//5.GET_ALL_Orderitem
		
//		OrderItemDAOImp oi = new OrderItemDAOImp();
//		List<OrderItem> allOrderItem=oi.getAllOrderItem();
//		for(OrderItem OrderItem:allOrderItem) {
//	System.out.println(OrderItem);
//   }

//
	
		
		//   3.ORDERS
		
		//1. ADD orders
//		System.out.println("Enter the OrderId");
//		int OrderId=scan.nextInt();	
//		System.out.println("Enter the userId");
//		int userId=scan.nextInt();	
//		System.out.println("Enter the RestaurantId");
//		int RestaurantId=scan.nextInt();	
//		scan.nextLine(); 
//		System.out.println("Enter the orderDate");
//   	 Timestamp orderDate=Timestamp.valueOf(scan.nextLine());
//   	 System.out.println("Enter the status");	
//   	 String status=scan.nextLine();
//   	 System.out.println("Enter the paymentMode");
//   	 String paymentMode=scan.nextLine();
//   	 System.out.println("Enter the deliveryAddress");	
//   	 String deliveryAddress=scan.nextLine();
//		System.out.println("Enter the amount");
//		int amount=scan.nextInt();
//		
//		Orders o=new Orders(OrderId, userId, RestaurantId, orderDate, status, paymentMode, deliveryAddress, amount);
//		
//		OrdersDAOImp or=new OrdersDAOImp();
//		or.addOrders(o);
	

		//2.GET_orders
//OrdersDAOImp or=new OrdersDAOImp();
//	Orders o = or.getOrders(1);
//		System.out.println(or);
//	

//		//3.UPDATE_orders
//		OrdersDAOImp or=new OrdersDAOImp();
//		Orders o = or.getOrders(1);

//	o.setStatus("Available");	
//    or.updateOrder(o);
//	System.out.println("Status is UPDATE");

	//4.DELETE orders
//	OrdersDAOImp or=new OrdersDAOImp();
//	or.deleteOrder(1);
//	System.out.println("Order Deleted");
	
//
//	//5.GET_ALL_orders
//	OrdersDAOImp or=new OrdersDAOImp();
//	List<Orders> allOrders=or.getAllOrders();
//		for( Orders o:allOrders) {
//	System.out.println(or);
		
		
		
		
		
		//2. RESTAURANTS
		
		//1.Add Restaurant
		
//		System.out.println("Enter the RestaurantId");
//		int RestaurantId=scan.nextInt();	
//		scan.nextLine();
//		System.out.println("Enter the RestaurantName");
//		String RestaurantName=scan.nextLine();
//		System.out.println("Enter the address");
//		String address=scan.nextLine();
//		System.out.println("Enter the cuisineType");
//		String cuisineType=scan.nextLine();
//		System.out.println("Enter the openingTime");	
//        LocalTime openingTime = LocalTime.parse(scan.next());
//		System.out.println("Enter the closingTime");
//        LocalTime closingTime = LocalTime.parse(scan.next());
//		System.out.println("Enter the rating");	
//		double rating =scan.nextDouble();
//		System.out.println("Enter the amount");
//		int amount=scan.nextInt();
		
//		Restaurant r = new Restaurant(RestaurantId, RestaurantName,address,cuisineType,openingTime, closingTime,rating,amount);
//		RestaurantDAOImp rdao=new RestaurantDAOImp();
//		rdao.addRestaurant(r);
//		System.out.println(r);

		//2.GET_Restaurant
//		RestaurantDAOImp rdao = new RestaurantDAOImp();
//		Restaurant r = rdao.getRestaurant(1);
//		System.out.println(r);

		//3.UPDATE_Restaurant
//		RestaurantDAOImp rdao= new RestaurantDAOImp();
//		Restaurant r= rdao.getRestaurant(1);
//		r.setAddress("SaiNagar");	
//	    rdao.updateRestaurant(r);
//		System.out.println("User is UPDATE");
//
//		//4.DELETE Restaurant
//		RestaurantDAOImp rdao = new RestaurantDAOImp();
//		rdao.deleteRestaurant(1);
//		System.out.println("Restaurant Deleted");
//
//		//5.GET_ALL_Restaurants
//		RestaurantDAOImp rdao = new RestaurantDAOImp();
//		List<Restaurant> allrestaurant=rdao.getAllRestaurants();
//		for(Restaurant Restaurant:allrestaurant) {
//	System.out.println(Restaurant);
//		}
		
		
		
		
		
		//1.USER
		
//1.ADD_User
		
//	System.out.println("Enter the UserName:");
//	String userName = scan.next();
//	System.out.println("Enter the Password:");
//	String password = scan.next();
//	System.out.println("Enter the Email:");
//	String email = scan.next();
//	scan.nextLine(); 
//	System.out.println("Enter the Adress:");
//	String adress = scan.nextLine();
//	System.out.println("Enter the Role:");
//	String role = scan.next();
//	
//	user u=new user(0, userName, password, email, adress, role);
//	
//	UserDAOImpl udao=new UserDAOImpl();
//	udao.addUser(u);
//	System.out.println(u);
		
		
//2.GET_User
		
//UserDAOImpl udao = new UserDAOImpl();
//user u= udao.getUser(1);
//
//System.out.println(u);


//3.UPDATE_User
		
//UserDAOImpl udao = new UserDAOImpl();
//user u= udao.getUser(1);
//u.setAdress("GandhiNagar");
//
//udao.UpdateUser(u);
//System.out.println("User is UPDATE");


//4.DELETE User
		
//UserDAOImpl udao = new UserDAOImpl();
//udao.deleteUser(3);
//System.out.println("USER Deleted");


//5.GET_ALL_User
//UserDAOImpl udao = new UserDAOImpl();
//List<user> alluser=udao.getAllUsers();
//for(user user:alluser) {
//	System.out.println(user);
//}
		
	}
}