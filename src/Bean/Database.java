package Bean;

import java.util.*;
import java.sql.*;

public class Database {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(Exception e) {
			System.out.println("Fail to load JDBC DRIVER");
		}
		try {
			String jdbc_url = "jdbc:mysql://plare.cf:3306/web";
			String db_id = "web";
			String db_pwd = "web";
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
		} catch(Exception e) {
			System.out.println("Fail to Connect to Database");
		}
	}
	
	public ResultSet result_query(String sql) {
		try {
			stmt = conn.createStatement();
			stmt.setMaxRows(100);
			rs = stmt.executeQuery(sql);
		} catch(Exception e) {
			System.out.println("Result Query Error");
			rs = null;
		}
		return rs;
	}
	
	public void non_result_query(String sql) {
		try {
			stmt = conn.createStatement();
			stmt.setMaxRows(100);
			stmt.executeUpdate(sql);
		} catch(Exception e) {
			System.out.println("Non-Result Query Error");
		}
	}
	
	public void close_stmt() {
		try {stmt.close();} catch(Exception e) {}
	}
	
	public void close_rs() {
		try {rs.close();} catch(Exception e) {}
	}
	public void close_conn() {
		try {conn.close();} catch(Exception e) {}
	}
}