package com.tap.DAOImpl;
import java.sql.Time;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.RestaurantDAO;
import com.tap.Model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImp implements RestaurantDAO {
	
	
	private static final String INSERT_QUERY ="INSERT INTO  `Restaurant`(restaurantId,restaurantName,address,cuisineType,openingTime,"+" closingTime,rating,amount,imagePath) values(?, ?, ?, ? ,?, ?, ?, ?,?)";

	private static final String SELECT_QUERY ="SELECT * FROM Restaurant where RestaurantId = ?";
	
	private static final String UPDATE_QUERY="UPDATE Restaurant SET RestaurantName = ?, address = ?, cuisineType = ?, openingTime = ?, closingTime=?,rating = ?,amount=?, imagePath=? where RestaurantId = ?";
	 
	private static final String DELETE_QUERY="DELETE FROM Restaurant WHERE RestaurantId = ?";
	
	private static final String SELECT_ALL_QUERY="SELECT * FROM Restaurant";

	private Connection connection;

private Restaurant restaurant;

	
	//1.ADD Restaurant	
	@Override
	public void addRestaurant(Restaurant restaurant) {
		
		Connection con = DBConnection.getConnection();

		try {
			PreparedStatement stmt=con.prepareStatement(INSERT_QUERY);
			
			
			
	    	stmt.setInt(1,restaurant.getRestaurantId());
			stmt.setString(2,restaurant .getRestaurantName());
			stmt.setString(3, restaurant.getAddress());
			stmt.setString(4, restaurant.getCuisineType());
			stmt.setTime(5,Time.valueOf(restaurant.getOpeningTime()));
			stmt.setTime(6,Time.valueOf(restaurant.getClosingTime()));
			stmt.setDouble(7, restaurant.getRating());
			stmt.setInt(8, restaurant.getAmount());
			stmt.setString(9, restaurant.getImagePath());

			
          stmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}		
	
	
	//2.GETUSER
	@Override
	public Restaurant getRestaurant(int RestaurantId) {

		//Restaurant Restaurant=null;
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt=con.prepareStatement(SELECT_QUERY);

		stmt.setInt(1,RestaurantId);
ResultSet res =stmt.executeQuery();
     while(res.next()) {
    	 int Restaurantid=res.getInt("Restaurantid");
    	 String RestaurantName=res.getString("RestaurantName");	
    	 String address=res.getString("address");
    	 String cuisineType=res.getString("cuisineType");
    	 LocalTime openingTime=res.getTime("openingTime").toLocalTime();
    	 LocalTime closingTime=res.getTime("closingTime").toLocalTime();
    	 double rating =res.getDouble("rating");
    	 int amount =res.getInt("amount");
    	 String imagePath=res.getString("imagePath");
 
    	 
    	  // restaurant=new Restaurant(RestaurantId, RestaurantName, address, cuisineType,openingTime , closingTime, rating, amount,imagePath);
    	 restaurant =new Restaurant(Restaurantid, RestaurantName, address, cuisineType, openingTime, closingTime, rating, amount, imagePath);
     }
		}catch(SQLException e){
			e.printStackTrace();
		}
	
		return restaurant;
	}
	

	
	//3.UPDATE USER 
	
		@Override
		public void updateRestaurant(Restaurant restaurant) {
			Connection con = DBConnection.getConnection();
			try {
				PreparedStatement stmt=con.prepareStatement(UPDATE_QUERY);
				
				stmt.setString(1, restaurant.getRestaurantName());
				stmt.setString(2, restaurant.getAddress());
				stmt.setString(3, restaurant.getCuisineType());
				stmt.setTime(4,Time.valueOf(restaurant.getOpeningTime()));
				stmt.setTime(5,Time.valueOf(restaurant.getClosingTime()));
				stmt.setDouble(6, restaurant.getRating());
				stmt.setInt(7, restaurant.getAmount());
				stmt.setString(8, restaurant.getImagePath());
				stmt.setInt(9, restaurant.getRestaurantId());

				
				
		          stmt.executeUpdate();

			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		//4.DELETE USER 

		@Override
		public void deleteRestaurant(int RestaurantId) {
			Connection con = DBConnection.getConnection();
			try {
				PreparedStatement stmt=con.prepareStatement(DELETE_QUERY);
				
				stmt.setInt(1, RestaurantId);
				stmt.executeUpdate();
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			
		}

		
		//5.GETALL USER 

		@Override
		public List<Restaurant> getAllRestaurants() {
			
			List<Restaurant> list = new ArrayList<>();
			
			Connection connection = DBConnection.getConnection();
			
			String sql="SELECT * FROM Restaurant";

			
			try {
			Statement stmt=connection.createStatement();
			ResultSet res =stmt.executeQuery(sql);

		     while(res.next()) {
		    	 int RestaurantId=res.getInt("restaurantId");
		    	 String RestaurantName=res.getString("restaurantName");	
		    	 String address=res.getString("address");
		    	 String cuisineType=res.getString("cuisineType");
		    	 LocalTime openingTime=res.getTime("openingTime").toLocalTime();
		    	 LocalTime closingTime=res.getTime("closingTime").toLocalTime();
		    	 double rating =res.getDouble("rating");
		    	 int amount =res.getInt("amount");
		    	 String imagePath=res.getString("imagePath");
		 
		    	 
		    	  Restaurant restaurant =new Restaurant(RestaurantId, RestaurantName, address, cuisineType, openingTime, closingTime, rating, amount, imagePath);
		    	list.add(restaurant);
		     }
			
		}catch(SQLException e){
			e.printStackTrace();
		}
			return list;
		}

//search
		
		
		public List<Restaurant> searchRestaurants(String query) {

		    List<Restaurant> restaurantList = new ArrayList<>();

		    String sql =
		        "SELECT DISTINCT r.* " +
		        "FROM restaurant r " +
		        "LEFT JOIN menu m ON r.restaurantId = m.restaurantId " +
		        "WHERE r.restaurantName LIKE ? " +
		        "OR r.cuisineType LIKE ? " +
		        "OR r.address LIKE ? " +
		        "OR m.itemName LIKE ?";

		    try (Connection con = DBConnection.getConnection();
		         PreparedStatement pstmt = con.prepareStatement(sql)) {

		        String keyword = "%" + query + "%";

		        pstmt.setString(1, keyword);
		        pstmt.setString(2, keyword);
		        pstmt.setString(3, keyword);
		        pstmt.setString(4, keyword);

		        ResultSet rs = pstmt.executeQuery();

		        while (rs.next()) {

		            Restaurant restaurant = new Restaurant();

		            restaurant.setRestaurantId(rs.getInt("restaurantId"));
		            restaurant.setRestaurantName(rs.getString("restaurantName"));
		            restaurant.setAddress(rs.getString("address"));
		            restaurant.setCuisineType(rs.getString("cuisineType"));
		            restaurant.setOpeningTime(rs.getTime("openingTime").toLocalTime());
		            restaurant.setClosingTime(rs.getTime("closingTime").toLocalTime());
		            restaurant.setRating(rs.getDouble("rating"));
		            restaurant.setAmount(rs.getInt("amount"));
		            restaurant.setImagePath(rs.getString("imagePath"));

		            restaurantList.add(restaurant);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return restaurantList;
		}
		
		///getRestaurantNameById
		public String getRestaurantNameById(int restaurantId) {

		    String restaurantName = "";

		    Connection connection = DBConnection.getConnection();

		    String query = "SELECT restaurantName FROM restaurant WHERE restaurantId = ?";

		    try {

		        PreparedStatement stmt = connection.prepareStatement(query);

		        stmt.setInt(1, restaurantId);

		        ResultSet res = stmt.executeQuery();

		        if(res.next()) {

		            restaurantName = res.getString("restaurantName");

		        }

		    }
		    catch(Exception e) {

		        e.printStackTrace();

		    }

		    return restaurantName;

		}
		
		// getRestaurantById(int restaurantId)
				@Override
				public Restaurant getRestaurantById(int restaurantId) {

				    Restaurant restaurant = null;

				    String query = "SELECT * FROM restaurant WHERE restaurantId=?";

				    try {

				        Connection con = DBConnection.getConnection();

				        PreparedStatement pstmt = con.prepareStatement(query);

				        pstmt.setInt(1, restaurantId);

				        ResultSet res = pstmt.executeQuery();

				        if(res.next()) {

				            restaurant = new Restaurant();

				            restaurant.setRestaurantId(res.getInt("restaurantId"));
				            restaurant.setRestaurantName(res.getString("restaurantName"));
				            restaurant.setAddress(res.getString("address"));
				            restaurant.setCuisineType(res.getString("cuisineType"));
				            restaurant.setOpeningTime(res.getTime("openingTime").toLocalTime());
				            restaurant.setClosingTime(res.getTime("closingTime").toLocalTime());
				            restaurant.setRating(res.getDouble("rating"));
				            restaurant.setAmount(res.getInt("amount"));
				            restaurant.setImagePath(res.getString("imagePath"));

				        }

				    }
				    catch(Exception e) {
				        e.printStackTrace();
				    }

				    return restaurant;
				}
		
				
				
				
				
				//getRestaurantsByIds
				public List<Restaurant> getRestaurantsByIds(List<Integer> ids) {

				    List<Restaurant> restaurants = new ArrayList<>();

				    if(ids == null || ids.isEmpty()) {
				        return restaurants;
				    }

				    try {

				        Connection con = DBConnection.getConnection();

				        StringBuilder query = new StringBuilder(
				                "SELECT * FROM restaurant WHERE restaurantId IN (");

				        for(int i = 0; i < ids.size(); i++) {

				            query.append("?");

				            if(i < ids.size() - 1) {
				                query.append(",");
				            }
				        }

				        query.append(")");

				        PreparedStatement pstmt =
				                con.prepareStatement(query.toString());

				        for(int i = 0; i < ids.size(); i++) {

				            pstmt.setInt(i + 1, ids.get(i));

				        }

				        ResultSet rs = pstmt.executeQuery();

				        while(rs.next()) {

				            Restaurant restaurant = new Restaurant();

				            restaurant.setRestaurantId(rs.getInt("restaurantId"));
				            restaurant.setRestaurantName(rs.getString("restaurantName"));
				            restaurant.setAddress(rs.getString("address"));
				            restaurant.setCuisineType(rs.getString("cuisineType"));
				            restaurant.setOpeningTime(rs.getTime("openingTime").toLocalTime());
				            restaurant.setClosingTime(rs.getTime("closingTime").toLocalTime());
				            restaurant.setRating(rs.getDouble("rating"));
				            restaurant.setAmount(rs.getInt("amount"));
				            restaurant.setImagePath(rs.getString("imagePath"));

				            restaurants.add(restaurant);

				        }

				    } catch(Exception e) {

				        e.printStackTrace();

				    }

				    return restaurants;
				}
}