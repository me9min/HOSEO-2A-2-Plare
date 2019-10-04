package shop;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import Bean.Database;

public class shop {
	
	public int getPoint(String email) {
		Connection conn = Database.connect();
        PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int point = 0;

        try {
        	String sql = "call store_selectPoint(?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            
            rs.next();
            point = rs.getInt("credits");
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return point;
	}
}
