package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.UserDetails;

public class DBOperations
{
	private static Connection connection=null;
	
	public static Connection getConnection() throws ClassNotFoundException,SQLException 
	{
		if(connection==null)
		{
		Class.forName("com.mysql.cj.jdbc.Driver");
		//System.out.println("driver class loaded");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","rishita2004");
		System.out.println("success");
		}
		return connection;
	}
	
}