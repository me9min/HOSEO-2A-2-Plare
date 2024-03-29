package Bean;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import Bean.Database;
import Bean.ShopBean;

public class Shop {
	private static Shop instance = new Shop();
    //.jsp페이지에서 DB연동빈인 ShopBean클래스의 메소드에 접근시 필요
    public static Shop getInstance() {
        return instance;
    }	
	
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
	
	public void insertItem(ShopBean item) {
		// 관리자 계정으로 아이템을 추가하는 메소드
        Connection conn = Database.connect();
        PreparedStatement pstmt = null;

		String sql = "";

        try {
            sql = "insert into store_menu(unique_id, item_type, item_name, item_price, item_dec, item_img) values(?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, item.getUnique_id());
            pstmt.setString(2, item.getItem_type());
            pstmt.setString(3, item.getItem_name());
			pstmt.setInt(4, item.getItem_price());
			pstmt.setString(5, item.getItem_dec());
			pstmt.setString(6, item.getItem_img());
			
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	
	public void updateItem(ShopBean item, int id) {
		// 관리자 계정으로 아이템을 수정하는 메소드
        Connection conn = Database.connect();
        PreparedStatement pstmt = null;

		String sql = "";

        try {
            sql = "update store_menu set unique_id=?, item_type=?, item_name=?, item_price=?, item_dec=?, item_img=? where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, item.getUnique_id());
            pstmt.setString(2, item.getItem_type());
            pstmt.setString(3, item.getItem_name());
			pstmt.setInt(4, item.getItem_price());
			pstmt.setString(5, item.getItem_dec());
			pstmt.setString(6, item.getItem_img());
			pstmt.setInt(7, id);
			
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	
	public void deleteItem(int id) {
		// 관리자 계정으로 아이템을 삭제하는 메소드
        Connection conn = Database.connect();
        PreparedStatement pstmt = null;

		String sql = "";

        try {
            sql = "delete from store_menu where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
			
            pstmt.executeUpdate();
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
	
	public int getItemCount(String category) {
		// 전체 아이템 개수를 가져오는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			if(category.equals("all")) {
				pstmt = conn.prepareStatement("select count(*) from store_menu");
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} else if(category.equals("skin")) {
				pstmt = conn.prepareStatement("select count(*) from store_menu where item_type='playerskin'");
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} else if(category.equals("hat")) {
				pstmt = conn.prepareStatement("select count(*) from store_menu where item_type='hat'");
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} else if(category.equals("pet")) {
				pstmt = conn.prepareStatement("select count(*) from store_menu where item_type='pet'");
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} else if(category.equals("grenade")) {
				pstmt = conn.prepareStatement("select count(*) from store_menu where item_type='grenadeskin'");
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} else if(category.equals("lasersight")) {
				pstmt = conn.prepareStatement("select count(*) from store_menu where item_type='lasersight'");
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
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
	
	public List<ShopBean> getItems(String category, int start, int end) {
		// 아이템을 리스트로 불러오는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShopBean> itemList = null;
		
		try {
			if(category.equals("all")) {
				pstmt = conn.prepareStatement(
						"select * from store_menu order by id desc limit ?, ?");
				pstmt.setInt(1, start-1);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					itemList = new ArrayList<ShopBean>(end);
					do {
						ShopBean item = new ShopBean();
						item.setId(rs.getInt("id"));
						item.setUnique_id(rs.getString("unique_id"));
						item.setItem_type(rs.getString("item_type"));
						item.setItem_name(rs.getString("item_name"));
						item.setItem_price(rs.getInt("item_price"));
						item.setItem_count(rs.getInt("item_count"));
						item.setItem_cat(rs.getString("item_cat"));
						item.setItem_img(rs.getString("item_img"));
						item.setItem_dec(rs.getString("item_dec"));
						
						itemList.add(item);
					} while(rs.next());
				}
			} else if(category.equals("skin")) {
				pstmt = conn.prepareStatement(
						"select * from store_menu where item_type = 'playerskin' order by id desc limit ?, ?");
				pstmt.setInt(1, start-1);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					itemList = new ArrayList<ShopBean>(end);
					do {
						ShopBean item = new ShopBean();
						item.setId(rs.getInt("id"));
						item.setUnique_id(rs.getString("unique_id"));
						item.setItem_type(rs.getString("item_type"));
						item.setItem_name(rs.getString("item_name"));
						item.setItem_price(rs.getInt("item_price"));
						item.setItem_count(rs.getInt("item_count"));
						item.setItem_cat(rs.getString("item_cat"));
						item.setItem_img(rs.getString("item_img"));
						item.setItem_dec(rs.getString("item_dec"));
						
						itemList.add(item);
					} while(rs.next());
				}
			} else if(category.equals("hat")) {
				pstmt = conn.prepareStatement(
						"select * from store_menu where item_type = 'hat' order by id desc limit ?, ?");
				pstmt.setInt(1, start-1);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					itemList = new ArrayList<ShopBean>(end);
					do {
						ShopBean item = new ShopBean();
						item.setId(rs.getInt("id"));
						item.setUnique_id(rs.getString("unique_id"));
						item.setItem_type(rs.getString("item_type"));
						item.setItem_name(rs.getString("item_name"));
						item.setItem_price(rs.getInt("item_price"));
						item.setItem_count(rs.getInt("item_count"));
						item.setItem_cat(rs.getString("item_cat"));
						item.setItem_img(rs.getString("item_img"));
						item.setItem_dec(rs.getString("item_dec"));
						
						itemList.add(item);
					} while(rs.next());
				}
			} else if(category.equals("pet")) {
				pstmt = conn.prepareStatement(
						"select * from store_menu where item_type = 'pet' order by id desc limit ?, ?");
				pstmt.setInt(1, start-1);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					itemList = new ArrayList<ShopBean>(end);
					do {
						ShopBean item = new ShopBean();
						item.setId(rs.getInt("id"));
						item.setUnique_id(rs.getString("unique_id"));
						item.setItem_type(rs.getString("item_type"));
						item.setItem_name(rs.getString("item_name"));
						item.setItem_price(rs.getInt("item_price"));
						item.setItem_count(rs.getInt("item_count"));
						item.setItem_cat(rs.getString("item_cat"));
						item.setItem_img(rs.getString("item_img"));
						item.setItem_dec(rs.getString("item_dec"));
						
						itemList.add(item);
					} while(rs.next());
				}
			} else if(category.equals("grenade")) {
				pstmt = conn.prepareStatement(
						"select * from store_menu where item_type = 'grenadeskin' order by id desc limit ?, ?");
				pstmt.setInt(1, start-1);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					itemList = new ArrayList<ShopBean>(end);
					do {
						ShopBean item = new ShopBean();
						item.setId(rs.getInt("id"));
						item.setUnique_id(rs.getString("unique_id"));
						item.setItem_type(rs.getString("item_type"));
						item.setItem_name(rs.getString("item_name"));
						item.setItem_price(rs.getInt("item_price"));
						item.setItem_count(rs.getInt("item_count"));
						item.setItem_cat(rs.getString("item_cat"));
						item.setItem_img(rs.getString("item_img"));
						item.setItem_dec(rs.getString("item_dec"));
						
						itemList.add(item);
					} while(rs.next());
				}
			} else if(category.equals("lasersight")) {
				pstmt = conn.prepareStatement(
						"select * from store_menu where item_type = 'lasersight' order by id desc limit ?, ?");
				pstmt.setInt(1, start-1);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					itemList = new ArrayList<ShopBean>(end);
					do {
						ShopBean item = new ShopBean();
						item.setId(rs.getInt("id"));
						item.setUnique_id(rs.getString("unique_id"));
						item.setItem_type(rs.getString("item_type"));
						item.setItem_name(rs.getString("item_name"));
						item.setItem_price(rs.getInt("item_price"));
						item.setItem_count(rs.getInt("item_count"));
						item.setItem_cat(rs.getString("item_cat"));
						item.setItem_img(rs.getString("item_img"));
						item.setItem_dec(rs.getString("item_dec"));
						
						itemList.add(item);
					} while(rs.next());
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return itemList;
	}
	
	public List<ShopBean> getItems(List<Integer> idList) {
		// 아이디 리스트를 사용하여 아이템을 리스트로 불러오는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShopBean> itemList = null;
		
		try {
			itemList = new ArrayList<ShopBean>();
			for(int i=0; i<idList.size(); i++) {
				pstmt = conn.prepareStatement("select * from store_menu where id = ?");
				pstmt.setInt(1, idList.get(i));
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					do {
						ShopBean item = new ShopBean();
						item.setId(rs.getInt("id"));
						item.setUnique_id(rs.getString("unique_id"));
						item.setItem_type(rs.getString("item_type"));
						item.setItem_name(rs.getString("item_name"));
						item.setItem_price(rs.getInt("item_price"));
						item.setItem_count(rs.getInt("item_count"));
						item.setItem_cat(rs.getString("item_cat"));
						item.setItem_img(rs.getString("item_img"));
						item.setItem_dec(rs.getString("item_dec"));
						
						itemList.add(item);
					} while(rs.next());
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return itemList;
	}
	
	public List<ShopBean> getItems(String[] idList) {
		// 아이디 배열을 사용하여 아이템을 리스트로 불러오는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShopBean> itemList = null;
		
		try {
			itemList = new ArrayList<ShopBean>();
			for(int i=0; i<idList.length; i++) {
				pstmt = conn.prepareStatement("select * from store_menu where unique_id = ?");
				pstmt.setString(1, idList[i]);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					do {
						ShopBean item = new ShopBean();
						item.setId(rs.getInt("id"));
						item.setUnique_id(rs.getString("unique_id"));
						item.setItem_type(rs.getString("item_type"));
						item.setItem_name(rs.getString("item_name"));
						item.setItem_price(rs.getInt("item_price"));
						item.setItem_count(rs.getInt("item_count"));
						item.setItem_cat(rs.getString("item_cat"));
						item.setItem_img(rs.getString("item_img"));
						item.setItem_dec(rs.getString("item_dec"));
						
						itemList.add(item);
					} while(rs.next());
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return itemList;
	}
	
	public ShopBean getItem(int num) {
		// 아이템 정보를 불러오는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShopBean item = null;
		
		try {
			pstmt = conn.prepareStatement(
					"select * from store_menu where id = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				item = new ShopBean();
				item.setId(rs.getInt("id"));
				item.setUnique_id(rs.getString("unique_id"));
				item.setItem_type(rs.getString("item_type"));
				item.setItem_name(rs.getString("item_name"));
				item.setItem_price(rs.getInt("item_price"));
				item.setItem_count(rs.getInt("item_count"));
				item.setItem_cat(rs.getString("item_cat"));
				item.setItem_img(rs.getString("item_img"));
				item.setItem_dec(rs.getString("item_dec"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return item;
	}
}
