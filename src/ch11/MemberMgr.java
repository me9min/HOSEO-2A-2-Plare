package ch11;

import java.sql.*;
import java.util.*;
import ch11.RegisterBean;

public class MemberMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/web";
	private final String USER = "root";
	private final String PASS = "root";
	
	public MemberMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch(Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	}
	
	public Vector getMemberList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			String strQuery = "select * from member";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				RegisterBean regBean = new RegisterBean();
				regBean.setMem_email(rs.getString("email"));
				regBean.setMem_pw(rs.getString("pw"));
				regBean.setMem_name(rs.getString("name"));
				regBean.setMem_phone(rs.getString("phone"));
				regBean.setMem_zipcode(rs.getString("zipcode"));
				vecList.add(regBean);
			}
			System.out.println(vecList.capacity());
		} catch(Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(stmt != null) try {stmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return vecList;
	}
}
