package Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Cart {
	private static Cart instance = new Cart();
    //.jsp페이지에서 DB연동빈인 CartBean클래스의 메소드에 접근시 필요
    public static Cart getInstance() {
        return instance;
    }	
    
    public int getCartCount(String email) {
    	// 로그인한 사용자의 이메일 받아와, 해당 사용자의 장바구니에 몇 개의 아이템이 있는지 확인하는 메소드
    	Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement("call cart_selectCount(?)");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return count;	
    }
    
    public List<Integer> getCartId(String email, int start, int end) {
    	// 로그인한 사용자의 스팀 ID를 player_id로 가지고 있는 항목을 리턴하는 메소드
    	Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Integer> idList = null;
		
		try {
			pstmt = conn.prepareStatement("call cart_selectId(?, ?, ?)");
			pstmt.setString(1, email);
			pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				idList = new ArrayList<Integer>(end);
				do {
					Integer id = rs.getInt(1);
					idList.add(id);
				} while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return idList;	
    }
    
    public int InsertCart(String email, int mid) {
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int error = 3;
		
		try {
			String sql = "call cart_insertItem(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, mid);
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
		return error;	//0=성공, 1=이미구매한아이템, 2=이미장바구니에있는아이템, 3=DB연결실패
	}
    
    public void DeleteCart(String email, String menu_id) {
    	Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		int mid = Integer.parseInt(menu_id);
		
		try {
			String sql = "call cart_deleteItem(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, mid);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
    }

    public int buyCart(String email, String mid) {
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int error = 3;
		
		try {
			String sql = "call cart_buyItem(?,?)";
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