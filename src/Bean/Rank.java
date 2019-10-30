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
	
	//전체랭크 플레이어수 불러오기
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
	
	//검색한 플레이어수 불러오기
	public int getRankCount(String con, String q) throws Exception {
		Connection conn = Database.connect("nmrih_itemshop");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			
			pstmt = conn.prepareStatement("select count(steam_id) as 'count' from nmrih_itemshop where "+con+" regexp ?");
			pstmt.setString(1,q);
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
	
	//현재페이지의 플레이어불러오기
	public List<RankBean> getRank(int startRow, int pageSize) throws Exception {
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
	
	//검색한 플레이이어 불러오기
	public List<RankBean> getRank(int startRow, int pageSize, String con, String q) throws Exception {
		Connection conn = Database.connect("nmrih_itemshop");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RankBean> articleList = null;
		
		try {
			
			pstmt = conn.prepareStatement("select steam_id,name,cash from nmrih_itemshop where "+con+" regexp ? order by cash desc,steam_id limit ?,?");
			pstmt.setString(1,q);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,pageSize);
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
	
	//나의랭크불러오기
	public int getMyRank(String email) {
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cash = 0;
		
		try {
			
			pstmt = conn.prepareStatement("call rank_selectRank(?)");
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cash = rs.getInt("cash");
			}
		} catch(Exception ex) {
		ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return cash;
	}
}