package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {
	
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/industrialtraining","root","root");
			return con;
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
			return null;
		}
	}
}
