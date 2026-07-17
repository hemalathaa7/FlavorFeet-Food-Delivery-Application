package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrdersDAO;
import com.tap.Model.OrderItem;
import com.tap.Model.Orders;
import com.tap.Model.RestaurantPerformance;
import com.tap.Model.user;
import com.tap.utility.DBConnection;

public class OrdersDAOImp implements OrdersDAO{
	
	private static final String INSERT_QUERY =
			"INSERT INTO Orders(userId,RestaurantId,orderDate,status,paymentMode,deliveryAddress,amount) values(?,?,?,?,?,?,?)";
	private static final String SELECT_QUERY ="SELECT * FROM Orders where OrderId = ?";
	
	private static final String UPDATE_QUERY="UPDATE Orders SET userId = ?, RestaurantId = ?, orderDate = ?, status = ?, paymentMode=?,deliveryAddress = ?,amount=? where OrderId = ?";
	 
	private static final String DELETE_QUERY="DELETE FROM Orders WHERE OrderId = ?";
	
	
	private static final String GET_ORDER_ITEMS_BY_ORDERID =
	        "SELECT * FROM OrderItem WHERE OrderId = ?";
	private static final String SELECT_ALL_QUERY =
			"SELECT o.*, u.userName, r.restaurantName " +
			"FROM Orders o " +
			"JOIN user u ON o.userId = u.userId " +
			"JOIN restaurant r ON o.RestaurantId = r.RestaurantId";
	private static final String COUNT_QUERY ="SELECT COUNT(*) FROM orders";

	private static final String GET_ORDER_BY_ID =
	        "SELECT * FROM orders WHERE OrderId = ?";
	
	//1. ADD Orders
	
	
	
	@Override
	public int addOrders(Orders orders) {

	    Connection con = DBConnection.getConnection();

	    try {

	        PreparedStatement stmt = con.prepareStatement(
	                INSERT_QUERY,
	                Statement.RETURN_GENERATED_KEYS);

	        stmt.setInt(1, orders.getUserId());
	        stmt.setInt(2, orders.getRestaurantId());
	        stmt.setTimestamp(3, orders.getOrderDate());
	        stmt.setString(4, orders.getStatus());
	        stmt.setString(5, orders.getPaymentMode());
	        stmt.setString(6, orders.getDeliveryAddress());
	        stmt.setDouble(7, orders.getAmount());

	        int rows = stmt.executeUpdate();

	        if (rows > 0) {

	            ResultSet rs = stmt.getGeneratedKeys();

	            if (rs.next()) {

	                return rs.getInt(1);

	            }

	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return 0;
	}
	
	//2. GET Orders
	@Override
	public Orders getOrders(int OrderId) {
		
		Orders orders=null;
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt=con.prepareStatement(SELECT_QUERY);

		stmt.setInt(1,OrderId);
ResultSet res =stmt.executeQuery();
     while(res.next()) {
    	 
    	 int orderId=res.getInt("OrderId");
    	 int userId=res.getInt("userId");	
    	 int RestaurantId=res.getInt("RestaurantId");
    	 Timestamp orderDate=res.getTimestamp("orderDate");
    	 String status=res.getString("status");
    	 String paymentMode=res.getString("paymentMode");
    	 String deliveryAddress =res.getString("deliveryAddress");
    	 double amount =res.getDouble("amount");
 
    	 
    	 
    	 orders = new Orders();

    	 orders.setOrderId(orderId);
    	 orders.setUserId(userId);
    	 orders.setRestaurantId(RestaurantId);
    	 orders.setOrderDate(orderDate);
    	 orders.setStatus(status);
    	 orders.setPaymentMode(paymentMode);
    	 orders.setDeliveryAddress(deliveryAddress);
    	 orders.setAmount(amount);     }
		}catch(SQLException e){
			e.printStackTrace();
		}
	
		return orders;
	}

	//3.UPDATE Orders
	@Override
	public void updateOrder(Orders orders) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt=con.prepareStatement(UPDATE_QUERY);

			stmt.setInt(1, orders.getUserId());
			stmt.setInt(2, orders.getRestaurantId());
			stmt.setTimestamp(3, orders.getOrderDate());
			stmt.setString(4, orders.getStatus());
			stmt.setString(5, orders.getPaymentMode());
			stmt.setString(6, orders.getDeliveryAddress());
			stmt.setDouble(7, orders.getAmount());
			stmt.setInt(8, orders.getOrderId());
	          stmt.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}
	}


	//4.DELETE ORDER

	@Override
	public void deleteOrder(int OrderId) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt=con.prepareStatement(DELETE_QUERY);
			
			stmt.setInt(1, OrderId);
			stmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		}
		
		//4.GETALL ORDER

		
	@Override
	public List<Orders> getAllOrders() {

 List<Orders> list = new ArrayList<Orders>();
		
		Connection connection = DBConnection.getConnection();
		
		try {
		Statement stmt=connection.createStatement();
		ResultSet res =stmt.executeQuery(SELECT_ALL_QUERY);

	     while(res.next()) {
	    	 
	    	 int orderId=res.getInt("OrderId");
	    	 int userId=res.getInt("userId");	
	    	 int RestaurantId=res.getInt("RestaurantId");
	    	 Timestamp orderDate=res.getTimestamp("orderDate");
	    	 String status=res.getString("status");
	    	 String paymentMode=res.getString("paymentMode");
	    	 String deliveryAddress =res.getString("deliveryAddress");
	    	 double amount =res.getDouble("amount");
	 
	    	 
	    	 
	    	 Orders order = new Orders();

	    	 order.setOrderId(orderId);
	    	 order.setUserId(userId);
	    	 order.setRestaurantId(RestaurantId);
	    	 order.setOrderDate(orderDate);
	    	 order.setStatus(status);
	    	 order.setPaymentMode(paymentMode);
	    	 order.setDeliveryAddress(deliveryAddress);
	    	 order.setAmount(amount);

	    	 list.add(order);		    	

	     }
		}catch(SQLException e){
			e.printStackTrace();
		}
			
		return list;
	}

	
	
	//ORDERS COUNT
	
		@Override
		public int getOrdersCount() {

		    int count = 0;

		    Connection con = DBConnection.getConnection();

		    try {

		        PreparedStatement ps =
		                con.prepareStatement(COUNT_QUERY);

		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {

		            count = rs.getInt(1);

		        }

		    } catch (Exception e) {

		        e.printStackTrace();

		    }

		    return count;
		}
		
		
	// ================= UPDATE ORDER STATUS =================

	public void updateOrderStatus(int orderId, String status) {

	    String query = "UPDATE Orders SET status = ? WHERE OrderId = ?";

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement stmt = con.prepareStatement(query);

	        stmt.setString(1, status);

	        stmt.setInt(2, orderId);

	        stmt.executeUpdate();

	    }
	    catch (SQLException e) {

	        e.printStackTrace();

	    }

	}
	
	//getOrdersByUserId
	public List<Orders> getOrdersByUserId(int userId) {

	    List<Orders> orderList = new ArrayList<>();

	    String query =
	    		"SELECT o.*, u.userName, r.restaurantName " +
	    		"FROM orders o " +
	    		"JOIN user u ON o.userId = u.userId " +
	    		"JOIN restaurant r ON o.restaurantId = r.restaurantId " +
	    		"WHERE o.userId=? " +
	    		"ORDER BY o.orderId DESC";
	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt = con.prepareStatement(query);

	        pstmt.setInt(1, userId);

	        System.out.println("Searching Orders for User ID = " + userId);
	        ResultSet rs = pstmt.executeQuery();

	        while(rs.next()){

	            Orders order = new Orders();

	            order.setOrderId(rs.getInt("orderId"));
	            order.setUserId(rs.getInt("userId"));
	            order.setRestaurantId(rs.getInt("restaurantId"));

	            order.setUserName(rs.getString("userName"));
	            order.setRestaurantName(rs.getString("restaurantName"));

	            order.setOrderDate(rs.getTimestamp("orderDate"));
	            order.setStatus(rs.getString("status"));
	            order.setPaymentMode(rs.getString("paymentMode"));
	            order.setDeliveryAddress(rs.getString("deliveryAddress"));
	            order.setAmount(rs.getDouble("amount"));

	            orderList.add(order);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return orderList;
	}
	
	//getTotalRevenue
	
	public double getTotalRevenue() {

	    double totalRevenue = 0;

	    String query = "SELECT SUM(amount) AS totalRevenue FROM Orders";

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt = con.prepareStatement(query);

	        ResultSet rs = pstmt.executeQuery();

	        if(rs.next()) {

	            totalRevenue = rs.getDouble("totalRevenue");

	        }

	    } catch (Exception e) {

	        e.printStackTrace();

	    }

	    return totalRevenue;
	}
	
	
	
	//getOrderCountByStatus
	public int getOrderCountByStatus(String status) {

	    int count = 0;

	    String query = "SELECT COUNT(*) FROM Orders WHERE status=?";

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt = con.prepareStatement(query);

	        pstmt.setString(1, status);

	        ResultSet rs = pstmt.executeQuery();

	        if(rs.next()) {

	            count = rs.getInt(1);

	        }

	    } catch(Exception e) {

	        e.printStackTrace();

	    }

	    return count;
	}
	
	
	
	
	// ================= Weekly Revenue =================

	public double[] getWeeklyRevenue() {

	    double[] revenue = new double[7];

	    String query =
	        "SELECT DAYOFWEEK(orderDate) day, SUM(amount) total " +
	        "FROM Orders " +
	        "GROUP BY DAYOFWEEK(orderDate)";

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt = con.prepareStatement(query);

	        ResultSet rs = pstmt.executeQuery();

	        while(rs.next()) {

	            int day = rs.getInt("day");
	            double total = rs.getDouble("total");

	            switch(day) {

	                case 2: revenue[0] = total; break; // Monday
	                case 3: revenue[1] = total; break; // Tuesday
	                case 4: revenue[2] = total; break; // Wednesday
	                case 5: revenue[3] = total; break; // Thursday
	                case 6: revenue[4] = total; break; // Friday
	                case 7: revenue[5] = total; break; // Saturday
	                case 1: revenue[6] = total; break; // Sunday
	            }
	        }

	    }
	    catch(Exception e) {
	        e.printStackTrace();
	    }

	    return revenue;
	}
	
	//RestaurantPerformance
	
	
	
	public List<RestaurantPerformance> getRestaurantPerformance(){

	    List<RestaurantPerformance> list = new ArrayList<>();

	    String query =
	        "SELECT r.restaurantName, r.rating," +
	        " COUNT(o.orderId) totalOrders," +
	        " SUM(o.amount) revenue " +
	        "FROM Orders o " +
	        "JOIN Restaurant r ON o.restaurantId=r.restaurantId " +
	        "GROUP BY r.restaurantId,r.restaurantName,r.rating " +
	        "ORDER BY revenue DESC";

	    try{

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt = con.prepareStatement(query);

	        ResultSet rs = pstmt.executeQuery();

	        while(rs.next()){

	            RestaurantPerformance rp =
	                new RestaurantPerformance();

	            rp.setRestaurantName(rs.getString("restaurantName"));
	            rp.setTotalOrders(rs.getInt("totalOrders"));
	            rp.setRevenue(rs.getDouble("revenue"));
	            rp.setRating(rs.getDouble("rating"));

	            list.add(rp);
	        }

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return list;
	}
	
	
	//getOrderItemsByOrderId
	@Override
	public List<OrderItem> getOrderItemsByOrderId(int orderId) {

	    List<OrderItem> orderItems = new ArrayList<>();

	    Connection con = DBConnection.getConnection();

	    try {

	        PreparedStatement stmt =
	                con.prepareStatement(GET_ORDER_ITEMS_BY_ORDERID);

	        stmt.setInt(1, orderId);

	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {

	            OrderItem item = new OrderItem();

	            item.setOrderId(rs.getInt("OrderId"));
	            item.setOrderitemId(rs.getInt("orderitemId"));
	            item.setQuantity(rs.getInt("quantity"));
	            item.setItemtotal(rs.getDouble("itemtotal"));
	            item.setMenuId(rs.getInt("menuId"));

	            orderItems.add(item);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orderItems;
	}

//getOrderById
	
	@Override
	public Orders getOrderById(int orderId) {

	    Orders order = null;

	    Connection con = DBConnection.getConnection();

	    try {

	        PreparedStatement stmt =
	                con.prepareStatement(GET_ORDER_BY_ID);

	        stmt.setInt(1, orderId);

	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {

	            order = new Orders();

	            order.setOrderId(rs.getInt("OrderId"));
	            order.setUserId(rs.getInt("userId"));
	            order.setRestaurantId(rs.getInt("RestaurantId"));
	            order.setOrderDate(rs.getTimestamp("orderDate"));
	            order.setStatus(rs.getString("status"));
	            order.setPaymentMode(rs.getString("paymentMode"));
	            order.setDeliveryAddress(rs.getString("deliveryAddress"));
	            order.setAmount(rs.getDouble("amount"));

	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return order;
	}

	
	//getTopSellingMenuItems
	public List<String[]> getTopSellingMenuItems() {

	    List<String[]> list = new ArrayList<>();

	    String query =
	        "SELECT m.itemName, " +
	        "SUM(oi.quantity) AS totalSold " +
	        "FROM OrderItem oi " +
	        "JOIN Menu m ON oi.menuId = m.menuId " +
	        "GROUP BY oi.menuId, m.itemName " +
	        "ORDER BY totalSold DESC " +
	        "LIMIT 5";

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt = con.prepareStatement(query);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            String[] row = new String[2];

	            row[0] = rs.getString("itemName");
	            row[1] = String.valueOf(rs.getInt("totalSold"));

	            list.add(row);
	        }

	    } catch (Exception e) {

	        e.printStackTrace();
	    }

	    return list;
	}
	
	
	//getRevenueBetweenDates
	
	public double getRevenueBetweenDates(String fromDate, String toDate) {

	    double revenue = 0;

	    String query =
	            "SELECT IFNULL(SUM(amount),0) totalRevenue " +
	            "FROM Orders " +
	            "WHERE DATE(orderDate) BETWEEN ? AND ?";

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt = con.prepareStatement(query);

	        pstmt.setString(1, fromDate);
	        pstmt.setString(2, toDate);

	        ResultSet rs = pstmt.executeQuery();

	        if(rs.next()) {

	            revenue = rs.getDouble("totalRevenue");

	        }

	    }
	    catch(Exception e) {

	        e.printStackTrace();

	    }

	    return revenue;
	}
	
	
	//getOrdersBetweenDates
	public int getOrdersBetweenDates(String fromDate,String toDate){

	    int count = 0;

	    String query =
	            "SELECT COUNT(*) totalOrders " +
	            "FROM Orders " +
	            "WHERE DATE(orderDate) BETWEEN ? AND ?";

	    try{

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt =
	                con.prepareStatement(query);

	        pstmt.setString(1, fromDate);
	        pstmt.setString(2, toDate);

	        ResultSet rs = pstmt.executeQuery();

	        if(rs.next()){

	            count = rs.getInt("totalOrders");

	        }

	    }catch(Exception e){

	        e.printStackTrace();

	    }

	    return count;
	}
	
	
	//getRestaurantPerformance
	public List<RestaurantPerformance> getRestaurantPerformance(String fromDate,String toDate){

	    List<RestaurantPerformance> list =
	            new ArrayList<>();

	    String query =
	        "SELECT r.restaurantName,r.rating," +
	        "COUNT(o.orderId) totalOrders," +
	        "SUM(o.amount) revenue " +
	        "FROM Orders o " +
	        "JOIN Restaurant r " +
	        "ON o.restaurantId=r.restaurantId " +
	        "WHERE DATE(o.orderDate) BETWEEN ? AND ? " +
	        "GROUP BY r.restaurantId,r.restaurantName,r.rating " +
	        "ORDER BY revenue DESC";

	    try{

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt =
	                con.prepareStatement(query);

	        pstmt.setString(1, fromDate);
	        pstmt.setString(2, toDate);

	        ResultSet rs = pstmt.executeQuery();

	        while(rs.next()){

	            RestaurantPerformance rp =
	                    new RestaurantPerformance();

	            rp.setRestaurantName(
	                    rs.getString("restaurantName"));

	            rp.setRating(
	                    rs.getDouble("rating"));

	            rp.setTotalOrders(
	                    rs.getInt("totalOrders"));

	            rp.setRevenue(
	                    rs.getDouble("revenue"));

	            list.add(rp);

	        }

	    }catch(Exception e){

	        e.printStackTrace();

	    }

	    return list;
	}
	
	
	
	//getTodayRevenue
	public double getTodayRevenue(){

	    double revenue = 0;

	    String query =
	        "SELECT IFNULL(SUM(amount),0) " +
	        "FROM Orders " +
	        "WHERE DATE(orderDate)=CURDATE()";

	    try{

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt =
	                con.prepareStatement(query);

	        ResultSet rs = pstmt.executeQuery();

	        if(rs.next()){

	            revenue = rs.getDouble(1);

	        }

	    }catch(Exception e){

	        e.printStackTrace();

	    }

	    return revenue;
	}
	
	
	
	//getWeekRevenue
	
	public double getWeekRevenue(){

	    double revenue = 0;

	    String query =
	        "SELECT IFNULL(SUM(amount),0) " +
	        "FROM Orders " +
	        "WHERE YEARWEEK(orderDate,1)=YEARWEEK(CURDATE(),1)";

	    try{

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt =
	                con.prepareStatement(query);

	        ResultSet rs = pstmt.executeQuery();

	        if(rs.next()){

	            revenue = rs.getDouble(1);

	        }

	    }catch(Exception e){

	        e.printStackTrace();

	    }

	    return revenue;
	}
	
	
	
	
	
	//getMonthRevenue
	public double getMonthRevenue(){

	    double revenue = 0;

	    String query =
	        "SELECT IFNULL(SUM(amount),0) " +
	        "FROM Orders " +
	        "WHERE MONTH(orderDate)=MONTH(CURDATE()) " +
	        "AND YEAR(orderDate)=YEAR(CURDATE())";

	    try{

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt =
	                con.prepareStatement(query);

	        ResultSet rs = pstmt.executeQuery();

	        if(rs.next()){

	            revenue = rs.getDouble(1);

	        }

	    }catch(Exception e){

	        e.printStackTrace();

	    }

	    return revenue;
	}
}
