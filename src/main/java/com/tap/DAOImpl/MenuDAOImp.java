package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.MenuDAO;
import com.tap.Model.Menu;
import com.tap.Model.user;
import com.tap.utility.DBConnection;

public class MenuDAOImp implements MenuDAO{
	
	
	private static final String INSERT_QUERY ="INSERT INTO  `menu`(menuId,restaurantId,itemName,description, price,isAvailable,imagePath) values(?, ?, ?, ? ,?, ?, ?)";

	private static final String SELECT_QUERY ="SELECT * FROM menu where menuId = ?";
	
	private static final String UPDATE_QUERY="UPDATE menu SET  restaurantId = ?, itemName = ?," + "description = ?, price = ?, isAvailable=? ,imagePath=? where menuId = ?";
	 
	private static final String DELETE_QUERY="DELETE FROM menu WHERE menuId = ?";
	
	private static final String SELECT_ALL_QUERY="SELECT * FROM menu";

	private Connection connection;

	
	//1. Add_Menu
	@Override
	public void addMenu(Menu menu) {

		
		Connection con = DBConnection.getConnection();

		try {
			PreparedStatement stmt=con.prepareStatement(INSERT_QUERY);

			stmt.setInt(1, menu.getMenuId());
			stmt.setInt(2, menu.getRestaurantId());
			stmt.setString(3, menu.getItemName());
			stmt.setString(4, menu.getDescription());
			stmt.setDouble(5, menu.getPrice());
			stmt.setBoolean(6, menu.isAvailable());
			stmt.setString(7, menu.getImagePath());


          stmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}
		
	//2.GET_Menu	
	
	@Override
	public Menu getMenu(int menuId) {
		
		
		Menu menu=null;
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt=con.prepareStatement(SELECT_QUERY);

		stmt.setInt(1,menuId);
ResultSet res =stmt.executeQuery();
     while(res.next()) {
    	 
    	 int MenuId=res.getInt("menuId");
    	 int restaurantId=res.getInt("restaurantId");	
    	 String itemName=res.getString("itemName");
    	 String description=res.getString("description");
    	 double price=res.getDouble("price");
    	 Boolean isAvailable=res.getBoolean("isAvailable");
    	 String imagePath=res.getString("imagePath");

    	 
    	menu= new Menu(MenuId, restaurantId, itemName, description, price,isAvailable , imagePath);
    	 
 
     }
		}catch(SQLException e){
			e.printStackTrace();
		}
	
		return menu;
	}
		
	
	//3.UPdate_menu
	@Override
	public void updateMenu(Menu menu) {

	    Connection con = DBConnection.getConnection();

	    try {

	        PreparedStatement stmt = con.prepareStatement(UPDATE_QUERY);

	        stmt.setInt(1, menu.getRestaurantId());
	        stmt.setString(2, menu.getItemName());
	        stmt.setString(3, menu.getDescription());
	        stmt.setDouble(4, menu.getPrice());
	        stmt.setBoolean(5, menu.isAvailable());
	        stmt.setString(6, menu.getImagePath());
	        stmt.setInt(7, menu.getMenuId());

	        stmt.executeUpdate();

	    }
	    catch (SQLException e) {

	        e.printStackTrace();

	    }

	}
	
	
	//4.Delete_menu
	@Override
		public void deleteMenu(int menuId) {


		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt=con.prepareStatement(DELETE_QUERY);
			
			stmt.setInt(1, menuId);
			stmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
			
	}

	
	//5.GET_ALL_Menu
	@Override
	public List<Menu>getAllMenu() {
			
       List<Menu>list = new ArrayList<Menu>();
		
		Connection connection = DBConnection.getConnection();
		
		try {
		Statement stmt=connection.createStatement();
		ResultSet res =stmt.executeQuery(SELECT_ALL_QUERY);

	     while(res.next()) {
	    	
	    	 int MenuId=res.getInt("menuId");
	    	 int restaurantId=res.getInt("restaurantId");	
	    	 String itemName=res.getString("itemName");
	    	 String description=res.getString("description");
	    	 double price=res.getDouble("price");
	    	 Boolean isAvailable=res.getBoolean("isAvailable");
	    	 String imagePath=res.getString("imagePath");

	    	Menu menu= new Menu(MenuId, restaurantId, itemName, description, price, isAvailable, imagePath);
	    	 
	    	list.add(menu);
	     }
		
	}catch(SQLException e){
		e.printStackTrace();
	}
		return list;
	}

	
	// 6. GetAllMenusByRestaurant
	
	
		@Override
		public List<Menu> getAllMenusByRestaurant(int restaurantId) {

		    List<Menu> list = new ArrayList<>();

		    try {
		        Connection connection = DBConnection.getConnection();

		        String query = "SELECT * FROM menu WHERE restaurantId = ?";

		        PreparedStatement pstmt = connection.prepareStatement(query);
		        pstmt.setInt(1, restaurantId);

		        ResultSet res = pstmt.executeQuery();

		        while (res.next()) {
		        	
		        	int MenuId=res.getInt("menuId");
			    	 int restaurantId1=res.getInt("restaurantId");	
			    	 String itemName=res.getString("itemName");
			    	 String description=res.getString("description");
			    	 double price=res.getDouble("price");
			    	 Boolean isAvailable=res.getBoolean("isAvailable");
			    	 String imagePath=res.getString("imagePath");

			    	 
			    	Menu menu= new Menu(MenuId, restaurantId1, itemName, description, price,isAvailable , imagePath);
			    	list.add(menu);
		        			        	   
		        	}
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return list;
		}



//7. getMenuByCuisine

		public List<Menu> getMenuByCuisine(String cuisine) {

		    List<Menu> menuList = new ArrayList<>();

		    try {

		        String query = "";

		        if(cuisine.equalsIgnoreCase("Biryani")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Biryani%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Burgers")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Burger%' OR itemName LIKE '%Whopper%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Noodles")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Noodles%'";
		        }
		        else if(cuisine.equalsIgnoreCase("South Indian")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Dosa%' OR itemName LIKE '%Idli%' OR itemName LIKE '%Vada%' OR itemName LIKE '%Pongal%' OR itemName LIKE '%Poori%' OR itemName LIKE '%Coffee%'";
		        }
		        else if(cuisine.equalsIgnoreCase("North Indian")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Naan%' OR itemName LIKE '%Butter Chicken%' OR itemName LIKE '%Paneer%' OR itemName LIKE '%Dal Makhani%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Desserts")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Gulab Jamun%' OR itemName LIKE '%Rasmalai%' OR itemName LIKE '%Brownie%' OR itemName LIKE '%Meetha%' OR itemName LIKE '%Cake%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Shakes")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Shake%' OR itemName LIKE '%Krusher%' OR itemName LIKE '%McFlurry%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Kebab")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Tikka%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Fish")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Fish%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Meals")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Meals%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Dosa")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Dosa%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Tiffins")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Idli%' OR itemName LIKE '%Vada%' OR itemName LIKE '%Poori%' OR itemName LIKE '%Pongal%' OR itemName LIKE '%Dosa%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Mexican")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Taco%' OR itemName LIKE '%Burrito%' OR itemName LIKE '%Quesadilla%' OR itemName LIKE '%Nachos%' OR itemName LIKE '%Churros%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Pizza")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Pizza%'";
		        }
		        else if(cuisine.equalsIgnoreCase("IceCream")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%McFlurry%' OR itemName LIKE '%Ice Cream%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Sandwich")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Sandwich%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Pasta")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Pasta%'";
		        }
		        else if(cuisine.equalsIgnoreCase("RiceBowl")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Rice Bowl%'";
		        }
		        else if(cuisine.equalsIgnoreCase("FriedRice")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Fried Rice%'";
		        }
		        else if(cuisine.equalsIgnoreCase("Paneer")) {
		            query = "SELECT * FROM menu WHERE itemName LIKE '%Paneer%'";
		        }
		        else {
		            query = "SELECT * FROM menu";
		        }
		        

		        System.out.println("Query = " + query);
		        
		        Connection connection = DBConnection.getConnection();
		        PreparedStatement pstmt = connection.prepareStatement(query);

		        ResultSet rs = pstmt.executeQuery();

		        while(rs.next()) {

		            System.out.println(rs.getString("itemName"));

		            Menu menu = new Menu();

		            menu.setMenuId(rs.getInt("menuId"));
		            menu.setRestaurantId(rs.getInt("restaurantId"));
		            menu.setItemName(rs.getString("itemName"));
		            menu.setDescription(rs.getString("description"));
		            menu.setPrice(rs.getDouble("price"));
		            menu.setImagePath(rs.getString("imagePath"));

		            menuList.add(menu);
		        }
		        System.out.println("Total Menu Found = " + menuList.size());

		    } catch(Exception e) {
		        e.printStackTrace();
		    }

		    return menuList;
		}
		
		
		
		
		
		
		
		
		
		
		//serach

		public List<Menu> searchMenuItems(String query) {
			 List<Menu> menuList = new ArrayList<>();

			    String sql = "SELECT * FROM menu WHERE itemName LIKE ? OR description LIKE ?";

			    try (Connection con = DBConnection.getConnection();
			         PreparedStatement pstmt = con.prepareStatement(sql)) {

			        String keyword = "%" + query + "%";
			        pstmt.setString(1, keyword);
			        pstmt.setString(2, keyword);

			        ResultSet rs = pstmt.executeQuery();

			        while (rs.next()) {
			            Menu menu = new Menu();
			            menu.setMenuId(rs.getInt("menuId"));
			            menu.setRestaurantId(rs.getInt("restaurantId"));
			            menu.setItemName(rs.getString("itemName"));
			            menu.setDescription(rs.getString("description"));
			            menu.setPrice(rs.getDouble("price"));
			            menu.setImagePath(rs.getString("imagePath"));
			            menuList.add(menu);
			        }

			    } catch (Exception e) {
			        e.printStackTrace();
			    }

			    return menuList;
			}
		}
	