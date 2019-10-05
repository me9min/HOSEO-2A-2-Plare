package Shop;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import Bean.Database;

public class Shop {
	
	//포인트조회
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
        return point;	//해당이메일 플레이어의 현재포인트
	}
	
	//포인트 추가+
	public void plusPoint(String email, int ppoint) {
		Connection conn = Database.connect();
        PreparedStatement pstmt = null;
		
        try {
        	String sql = "call store_plusPoint(?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
			pstmt.setInt(2, ppoint);
			pstmt.executeQuery();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	}
	
	//아이템구매 이메일,품목아이디
	public int buyItem(String email, String mid) {
		Connection conn = Database.connect();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int error = 3;
		
        try {
        	String sql = "call store_buyItem(?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			
			rs.next();
            error = rs.getInt("error");
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return error;	//0=성공, 1=포인트부족, 2=이미구매한아이템, 3=DB연결실패
	}
	
	
	
}
