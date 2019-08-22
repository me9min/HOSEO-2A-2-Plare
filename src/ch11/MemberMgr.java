package ch11;

import java.sql.*;
import java.util.*;
import ch11.RegisterBean;

public class MemberMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/basicjsp";
	private final String USER = "jspid";
	private final String PASS = "jsppass";
	
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
			String strQuery = "select * from member2";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				RegisterBean regBean = new RegisterBean();
				regBean.setMem_id(rs.getString("id"));
				regBean.setMem_passwd(rs.getString("passwd"));
				regBean.setMem_name(rs.getString("name"));
				regBean.setMem_num1(rs.getString("mem_num1"));
				regBean.setMem_num2(rs.getString("mem_num2"));
				regBean.setMem_email(rs.getString("e_mail"));
				regBean.setMem_phone(rs.getString("phone"));
				regBean.setMem_zipcode(rs.getString("zipcode"));
				regBean.setMem_address(rs.getString("address"));
				regBean.setMem_job(rs.getString("job"));
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
