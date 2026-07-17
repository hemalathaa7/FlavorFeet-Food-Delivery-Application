package com.tap.DAOImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.UserDAO;
import com.tap.Model.user;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO{


		
	private static final String INSERT_QUERY =
			"INSERT INTO user(userName,password,email,adress,role,createDate,lastLoginDate) VALUES(?,?,?,?,?,?,?)";
	private static final String SELECT_QUERY ="SELECT * FROM user where userId = ?";
	
	private static final String UPDATE_QUERY="UPDATE user SET userName = ?, password = ?, email = ?," + "adress = ?, role=?, createDate=?,lastLoginDate = ? where userId = ?";
	 
	private static final String DELETE_QUERY="DELETE FROM user WHERE userId = ?";
	
	private static final String SELECT_ALL_QUERY="SELECT * FROM user";

	private Connection connection;
	
	
//1.ADD USER	
	@Override
	public int addUser(user user) {	

		Connection con = DBConnection.getConnection();

		try {
			PreparedStatement stmt = con.prepareStatement(INSERT_QUERY);

			stmt.setString(1, user.getUserName());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getAdress());
			stmt.setString(5, user.getRole());
			stmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			stmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));

			int i = stmt.executeUpdate();
			return i;


			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
		
	}
	
//2.GETUSER
	
	@Override
	public user getUser(int userId) {
		
		user user=null;
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt=con.prepareStatement(SELECT_QUERY);

		stmt.setInt(1,userId);
ResultSet res =stmt.executeQuery();
     while(res.next()) {
    	 
    	 int userid=res.getInt("userId");
    	 String userName=res.getString("userName");	
    	 String password=res.getString("password");
    	 String email=res.getString("email");
    	 String adress=res.getString("adress");
    	 String role=res.getString("role");
    	 Timestamp createDate =res.getTimestamp("createDate");
    	 Timestamp lastLoginDate =res.getTimestamp("lastLoginDate");
 
    	 
    	user= new user(userid, userName, password, email, adress, role,createDate,lastLoginDate);
     }
		}catch(SQLException e){
			e.printStackTrace();
		}
	
		return user;
	}

	
	//3.UPDATE USER 
	
	
	@Override
	public void UpdateUser(user user) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt = con.prepareStatement(UPDATE_QUERY);

			stmt.setString(1, user.getUserName());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getAdress());
			stmt.setString(5, user.getRole());
			stmt.setTimestamp(6, user.getCreateDate());   // Keep original create date
			stmt.setTimestamp(7, new Timestamp(System.currentTimeMillis())); // Update last login
			stmt.setInt(8, user.getUserId());

			stmt.executeUpdate();
			

		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	
	
	//4.DELETE USER

	@Override
		public void deleteUser(int userId) {

		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement stmt=con.prepareStatement(DELETE_QUERY);
			
			stmt.setInt(1, userId);
			stmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}

	
	//4.GETALL USER

	@Override
	public List<user> getAllUsers() {
		
		List<user> list = new ArrayList<user>();
		
		Connection connection = DBConnection.getConnection();
		
		try {
		Statement stmt=connection.createStatement();
		ResultSet res =stmt.executeQuery(SELECT_ALL_QUERY);

	     while(res.next()) {
	    	 int userid=res.getInt("userId");
	    	 String userName=res.getString("userName");	
	    	 String password=res.getString("password");
	    	 String email=res.getString("email");
	    	 String adress=res.getString("adress");
	    	 String role=res.getString("role");
	    	 Timestamp createDate =res.getTimestamp("createDate");
	    	 Timestamp lastLoginDate =res.getTimestamp("lastLoginDate");
	 
	    	 
	    	 
	    	user user= new user(userid, userName, password, email, adress, role,createDate,lastLoginDate);
	    	list.add(user);
	     }
		
	}catch(SQLException e){
		e.printStackTrace();
	}
		return list;
	}




//5.  getUserByUsername

public user getUserByUsername(String username) {
	user user=null;
	
	String sql = "SELECT * FROM user WHERE userName=?";
	try (Connection con = DBConnection.getConnection();

		PreparedStatement stmt=con.prepareStatement(sql)){

	stmt.setString(1,username);
ResultSet res =stmt.executeQuery();
if(res.next()) {
	 
	 user=new user();
	 user.setUserId(res.getInt("userId"));
	 user.setUserName(res.getString("userName"));
	 user.setPassword(res.getString("password"));
	 user.setEmail(res.getString("email"));
	 user.setAdress(res.getString("adress"));
	 user.setRole(res.getString("role"));
	 
}

	 
	
	}catch(SQLException e){
		e.printStackTrace();
	}

	return user;
}




//getTotalCustomers
public int getTotalCustomers() {

    int count = 0;

    String query = "SELECT COUNT(*) FROM user";

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement pstmt = con.prepareStatement(query);

        ResultSet rs = pstmt.executeQuery();

        if(rs.next()){

            count = rs.getInt(1);

        }

    } catch(Exception e){

        e.printStackTrace();

    }

    return count;
}
}
	