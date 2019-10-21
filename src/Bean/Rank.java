package Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Rank {
	
	private static Rank instance = new Rank();
	public static Rank getInstance() {
		return instance;
	}
	
	public int getRankCount() throws Exception {
		Connection conn = Database.connect("nmrih_itemshop");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement("select count(steam_id) as 'count' from nmrih_itemshop");
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
		return count;
	}
	
	public List<RankBean> getRank(int startRow, int pageSize, String con,String q) throws Exception {
		Connection conn = Database.connect("nmrih_itemshop");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RankBean> articleList = null;
		
		try {
			
			pstmt = conn.prepareStatement("select steam_id,name,cash from nmrih_itemshop order by cash desc,steam_id limit ?,?");
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,pageSize);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				articleList = new ArrayList<RankBean>(rs.getRow());
				do {
					
					RankBean article= new RankBean();
					article.setSteam_id(rs.getString("steam_id"));
					article.setName(rs.getString("name"));
					article.setCash(rs.getInt("cash"));
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
}
