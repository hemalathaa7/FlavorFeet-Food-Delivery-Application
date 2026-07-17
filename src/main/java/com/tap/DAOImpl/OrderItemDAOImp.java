package com.tap.DAOImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.OrderItemDAO;
import com.tap.Model.OrderItem;
import com.tap.Model.Restaurant;
import com.tap.Model.TopSellingItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImp implements OrderItemDAO {
	
	private static final String INSERT_QUERY =
			"INSERT INTO OrderItem(OrderId, quantity, itemtotal, menuId) VALUES (?, ?, ?, ?)";
	private static final String SELECT_QUERY ="SELECT * FROM orderItem where orderitemId = ?";
	
	private static final String UPDATE_QUERY="UPDATE OrderItem SET OrderId = ?, quantity = ?, itemtotal = ?, menuId=? where orderitemId = ?";
	 
	private static final String DELETE_QUERY="DELETE FROM orderItem WHERE orderitemId = ?";
	
	private static final String SELECT_ALL_QUERY="SELECT * FROM OrderItem";
	
	
	private static final String GET_ORDER_ITEMS_BY_ORDERID =
	        "SELECT * FROM OrderItem WHERE OrderId = ?";
	
	private Connection connection;
	

	
	
	//1. ADD ORDERITEM
	
	@Override
	public void addOrderItem(OrderItem OrderItem) {

		Connection con = DBConnection.getConnection();

		try {
			PreparedStatement stmt=con.prepareStatement(INSERT_QUERY);
			
				
			stmt.setInt(1, OrderItem.getOrderId());
			stmt.setInt(2, OrderItem.getQuantity());
			stmt.setDouble(3, OrderItem.getItemtotal());
			stmt.setInt(4, OrderItem.getMenuId());
			
			int rows = stmt.executeUpdate();
			System.out.println("OrderItem Inserted = " + rows);
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	}		
	
	
	
	
	//2.GET ORDERITEM
	@Override
	public OrderItem getOrderItem(int orderitemId) {

	    Connection con = DBConnection.getConnection();
	    OrderItem orderitem = null;

	    try {
	        PreparedStatement stmt = con.prepareStatement(SELECT_QUERY);

	        stmt.setInt(1, orderitemId);

	        ResultSet res = stmt.executeQuery();

	        if(res.next()) {

	            int OrderId = res.getInt("OrderId");
	            int OrderitemId = res.getInt("orderitemId");
	            int Quantity = res.getInt("quantity");
	            double Itemtotal = res.getDouble("itemtotal");
	            int MenuId = res.getInt("menuId");

	            orderitem = new OrderItem(OrderId, OrderitemId, Quantity, Itemtotal, MenuId);
	        }
	        else {
	            System.out.println("No record found");
	        }

	    } catch(SQLException e) {
	        e.printStackTrace();
	    }

	    return orderitem;
	}
	
	//3.UPDATE ORDERITEM

	@Override
	public void updateOrderItem(OrderItem OrderItem) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt=con.prepareStatement(UPDATE_QUERY);
			
			stmt.setInt(1, OrderItem.getOrderId());
			stmt.setInt(2, OrderItem.getQuantity());
			stmt.setDouble(3, OrderItem.getItemtotal());
			stmt.setInt(4, OrderItem.getMenuId());
			stmt.setInt(5, OrderItem.getOrderitemId());

			
	          stmt.executeUpdate();
	          int rows = stmt.executeUpdate();
	          System.out.println("Rows Updated = " + rows);

		}catch(SQLException e){
			e.printStackTrace();
		}
	}		
	
//4. DELETE ORDERITEM
	@Override
	public void deleteOrderItem(int orderitemId) {

		
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt=con.prepareStatement(DELETE_QUERY);
			
			stmt.setInt(1, orderitemId);
			stmt.executeUpdate();
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	
	//5. GETALL ORDERITEM
	@Override
	public List<OrderItem> getAllOrderItem() {
		List<OrderItem> list = new ArrayList<OrderItem>();

		
		Connection connection = DBConnection.getConnection();
		
		try {
		Statement stmt=connection.createStatement();
		ResultSet res =stmt.executeQuery(SELECT_ALL_QUERY);

	     while(res.next()) {
	    	 int OrderId=res.getInt("OrderId");
	    	 int orderitemId=res.getInt("OrderitemId");	
	    	 int quantity=res.getInt("Quantity");
	    	 double itemtotal =res.getDouble("Itemtotal");
	    	 int  menuId=res.getInt("MenuId");
	 
	    	 
	    	OrderItem orderitem= new OrderItem(OrderId, orderitemId, quantity, itemtotal, menuId);
	    	list.add(orderitem);
	     }
		
	}catch(SQLException e){
		e.printStackTrace();
	}
		return list;
	}
	
	//TopSellingItem
	
	public List<TopSellingItem> getTopSellingItems() {

	    List<TopSellingItem> list = new ArrayList<>();

	    String query =
	        "SELECT m.itemName,r.restaurantName," +
	        "SUM(oi.quantity) totalSold," +
	        "SUM(oi.itemtotal) revenue " +
	        "FROM OrderItem oi " +
	        "JOIN Menu m ON oi.menuId=m.menuId " +
	        "JOIN Restaurant r ON m.restaurantId=r.restaurantId " +
	        "GROUP BY oi.menuId,m.itemName,r.restaurantName " +
	        "ORDER BY totalSold DESC " +
	        "LIMIT 5";

	    try{

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt = con.prepareStatement(query);

	        ResultSet rs = pstmt.executeQuery();

	        while(rs.next()){

	            TopSellingItem item = new TopSellingItem();

	            item.setItemName(rs.getString("itemName"));
	            item.setRestaurantName(rs.getString("restaurantName"));
	            item.setQuantitySold(rs.getInt("totalSold"));
	            item.setRevenue(rs.getDouble("revenue"));

	            list.add(item);
	        }

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return list;
	}
	
	
	
	// getOrderItemsByOrderId
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
	
	
	//getTopSellingItems
	public List<TopSellingItem> getTopSellingItems(String fromDate, String toDate) {

	    List<TopSellingItem> list = new ArrayList<>();

	    String query =
	        "SELECT m.itemName, r.restaurantName, " +
	        "SUM(oi.quantity) AS totalSold, " +
	        "SUM(oi.itemTotal) AS revenue " +
	        "FROM OrderItem oi " +
	        "JOIN Orders o ON oi.orderId = o.orderId " +
	        "JOIN Menu m ON oi.menuId = m.menuId " +
	        "JOIN Restaurant r ON m.restaurantId = r.restaurantId " +
	        "WHERE DATE(o.orderDate) BETWEEN ? AND ? " +
	        "GROUP BY oi.menuId, m.itemName, r.restaurantName " +
	        "ORDER BY totalSold DESC " +
	        "LIMIT 5";

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement pstmt = con.prepareStatement(query);

	        pstmt.setString(1, fromDate);
	        pstmt.setString(2, toDate);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            TopSellingItem item = new TopSellingItem();

	            item.setItemName(rs.getString("itemName"));
	            item.setRestaurantName(rs.getString("restaurantName"));
	            item.setQuantitySold(rs.getInt("totalSold"));
	            item.setRevenue(rs.getDouble("revenue"));

	            list.add(item);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
}
