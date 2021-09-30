package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import com.mysql.jdbc.Driver;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public final class DBConnect
{
	static Connection conn=null;
	
 private DBConnect()
 {
}
	
	
	public static Connection getConnection() {
		
	if(conn==null)
		
			try
			{
				String dbURL = "jdbc:mysql://localhost:3306/loginregister?useSSL=false&allowPublicKeyRetrieval=true";

				Class.forName(DbConnectionData.DATABSE_DRIVER);
				conn=DriverManager.getConnection(DbConnectionData.DATABSE_URL,DbConnectionData.DATABSE_USER,DbConnectionData.DATABSE_PASS);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
	System.out.println(conn);
			return conn;
			}
		
	}
	

