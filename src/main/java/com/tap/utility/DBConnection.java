package com.tap.utility;
import java.lang.Class;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
		    private static final String URL = "jdbc:mysql://localhost:3306/food_delivery_application";
			private static final String USERNAME ="root";
			private static final String PASSWORD ="Tap@Mysql26";
			private static Connection connection=null;
		
			public static Connection getConnection()
{
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					connection=DriverManager.getConnection(URL,USERNAME,PASSWORD);
					}
				catch(ClassNotFoundException | SQLException e)
				{
				    e.printStackTrace();
				}	return connection;

}
}



