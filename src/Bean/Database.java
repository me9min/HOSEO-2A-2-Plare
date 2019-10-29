package Bean;

import java.sql.*;

public class Database {
	private static String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static String JDBC_URL = "jdbc:mysql://plare.cf:3306/";
	private static String DB_ID = "web";
	private static String DB_PWD = "web";
	
	private static Connection conn = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//데이터베이스 연결 모듈 기본DB : web
	public static Connection connect() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch(Exception e) {
			System.out.println("Fail to load JDBC DRIVER");
		}
		try {
			conn = DriverManager.getConnection(JDBC_URL+"web", DB_ID, DB_PWD);
		} catch(Exception e) {
			System.out.println("Fail to Connect to 'web' Database");
			e.printStackTrace();
		}
		return conn;
	}
	
	//데이터베이스 연결 모듈 DB명을 파라미터에서받음
	public static Connection connect(String database) {
		try {
			Class.forName(JDBC_DRIVER);
		} catch(Exception e) {
			System.out.println("Fail to load JDBC DRIVER");
		}
		try {
			conn = DriverManager.getConnection(JDBC_URL+database, DB_ID, DB_PWD);
		} catch(Exception e) {
			System.out.println("Fail to Connect to DB : "+database);
			e.printStackTrace();
		}
		return conn;
	}
	
	//SQL문실행후 결과를 받음
	public static ResultSet result_query(String sql) {
		try {
			stmt = conn.createStatement();
			stmt.setMaxRows(100000);
			rs = stmt.executeQuery(sql);
		} catch(Exception e) {
			System.out.println("Result Query Error");
			rs = null;
		}
		return rs;
	}
	
	//SQL문실행
	public void non_result_query(String sql) {
		try {
			stmt = conn.createStatement();
			stmt.setMaxRows(100000);
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