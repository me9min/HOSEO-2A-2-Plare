package Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Bean.HistoryBean;

public class History {
	
	private static History instance = new History();
	//.jsp페이지에서 DB연동빈인 BoardBean클래스의 메소드에 접근시 필요
	public static History getInstance() {
		return instance;
	}
	
	public int getHistoryCount(String email) throws Exception {
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement("call store_countHistory(?)");
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch(Exception ex) {
		ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		System.out.println("count = "+count);	//디버그
		return count;
	}
	
	public List<HistoryBean> getHistory(String email, int startRow, int pageSize, String con,String q) throws Exception {
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HistoryBean> articleList = null;
		
		System.out.println("email = "+email);	//디버그
		System.out.println("startRow = "+startRow);
		System.out.println("pageSize = "+pageSize);
		System.out.println("con = "+con);
		System.out.println("q = "+q);
		
		try {
			
			pstmt = conn.prepareStatement("call store_selectHistory(?,?,?)");
			pstmt.setString(1,email);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,startRow+pageSize);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				System.out.println("rs.getRow() = "+rs.getRow());
				articleList = new ArrayList<HistoryBean>(rs.getRow());
				do {
					
					HistoryBean article= new HistoryBean();
					article.setUnique_id(rs.getString("unique_id"));
					article.setItem_type(rs.getString("item_type"));
					article.setItem_name(rs.getString("item_name"));
					article.setDate_of_purchase(rs.getInt("date_of_purchase"));
					article.setPrice_of_purchase(rs.getInt("price_of_purchase"));
					articleList.add(article);
				} while(rs.next());
			}
		} catch(Exception ex) {
		ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return articleList;
	}
	
	public void buyPoint(String email, int amount) throws Exception {
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement("call store_plusPoint(?,?)");
			pstmt.setString(1,email);
			pstmt.setInt(1,amount);
			pstmt.executeQuery();
		} catch(Exception ex) {
		ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
}
