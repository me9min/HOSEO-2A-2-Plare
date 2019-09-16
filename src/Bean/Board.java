package Bean;

import java.util.*;
import java.sql.Date;
import java.sql.*;
import java.text.*;
import javax.sql.*;
import javax.naming.*;
import Bean.BoardBean;

public class Board {
	private String jdbc_driver = "com.mysql.jdbc.Driver";
	private String jdbc_url = "jdbc:mysql://plare.cf:3306/web";
	private String db_id = "web";
	private String db_pwd = "web";
	
	private static Board instance = new Board();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static Board getInstance() {
        return instance;
    }
	
	public Board() {
		// JDBC 드라이버 연결
		try {
			Class.forName(jdbc_driver);
		} catch(Exception e) {
			System.out.println("Fail to load JDBC DRIVER");
		}
	}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/web");
		return ds.getConnection();
	}
	
	public String getNickname(String email) {
		Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

		String nickname = "";
		String sql = "";

        try {
        	conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
        	sql = "select nickname from member where email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            
            rs.next();
            nickname = rs.getString("nickname");
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return nickname;
	}
	
	public void insertArticle(BoardBean article, String category) {
        Connection conn = null;
        PreparedStatement pstmt = null;

		String sql="";

        try {
        	conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
            if(category.equals("free")) {
	            sql = "insert into board_free (writer,ip,reg_date,title,content) values(?,?,now(),?,?)";
	
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, article.getWriter());
	            pstmt.setString(2, article.getIp());
	            pstmt.setString(3, article.getTitle());
				pstmt.setString(4, article.getContent());
				
	            pstmt.executeUpdate();
            } else if (category.equals("motd")) {
            	sql = "insert into board_motd (writer,reg_date,title,content) values(?,now(),?,?)";
	
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, article.getWriter());
	            pstmt.setString(2, article.getTitle());
				pstmt.setString(3, article.getContent());
				
	            pstmt.executeUpdate();
            } else if (category.equals("issue")) {
            	
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	
	public int getArticleCount(String category) throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       int x = 0;

       try {
    	   conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
           
    	   if(category.equals("free")) {
	           pstmt = conn.prepareStatement("select count(*) from board_free");
	           rs = pstmt.executeQuery();
	
	           if (rs.next()) {
	              x = rs.getInt(1);
				}
    	   }
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
		return x;
   }
	
	public List<BoardBean> getArticles(String category, int start, int end) throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<BoardBean> articleList=null;
       try {
    	   conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
           
           if(category.equals("free")) {
        	   pstmt = conn.prepareStatement(
       	           	"select * from board_free order by num desc limit ?, ?");
        	   pstmt.setInt(1, start-1);
        	   pstmt.setInt(2, end);
   	           rs = pstmt.executeQuery();
   	
   	           if (rs.next()) {
   	               articleList = new ArrayList<BoardBean>(end);
   	               do{
   	                 BoardBean article= new BoardBean();
   					  article.setNum(rs.getInt("num"));
   					  article.setWriter(rs.getString("writer"));
   					  article.setRead_count(rs.getInt("read_count"));
   					  article.setUp_count(rs.getInt("up_count"));
   					  article.setIp(rs.getString("ip"));
   					  article.setReg_date(rs.getDate("reg_date"));
   					  article.setEdit_date(rs.getDate("edit_date"));
   					  article.setTitle(rs.getString("title"));
   					  article.setContent(rs.getString("content"));
   					  
   	                 articleList.add(article);
   				    }while(rs.next());
   				}
           } else if(category.equals("motd")) {
        	   pstmt = conn.prepareStatement(
          	           	"select * from board_motd order by num desc");
      	           rs = pstmt.executeQuery();
      	
      	           if (rs.next()) {
      	               articleList = new ArrayList<BoardBean>(end);
      	               do{
      	                 BoardBean article= new BoardBean();
      					  article.setNum(rs.getInt("num"));
      					  article.setWriter(rs.getString("writer"));
      					  article.setRead_count(rs.getInt("read_count"));
      					  article.setReg_date(rs.getDate("reg_date"));
      					  article.setTitle(rs.getString("title"));
      					  article.setContent(rs.getString("content"));
      					  
      	                 articleList.add(article);
      				    }while(rs.next());
      				}
           } else if(category.equals("issue")) {
	       
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
	
	public BoardBean getArticle(String category, int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardBean article = null;
        try {
        	conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
            
            if(category.equals("free")) {
                pstmt = conn.prepareStatement(
                	"update board_free set read_count = read_count + 1 where num = ?");
    			pstmt.setInt(1, num);
    			pstmt.executeUpdate();

                pstmt = conn.prepareStatement("select * from board_free where num = ?");
                pstmt.setInt(1, num);
                rs = pstmt.executeQuery();
                
                if(rs.next()) {
	                article = new BoardBean();
	            	article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setRead_count(rs.getInt("read_count"));
					article.setUp_count(rs.getInt("up_count"));
					article.setIp(rs.getString("ip"));
					article.setReg_date(rs.getDate("reg_date"));
					article.setEdit_date(rs.getDate("edit_date"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
                }
            } else if(category.equals("motd")) {
            	pstmt = conn.prepareStatement("update board_motd set read_count = read_count + 1 where num = ?");
        		pstmt.setInt(1, num);
        		pstmt.executeUpdate();

                pstmt = conn.prepareStatement("select * from board_motd where num = ?");
                pstmt.setInt(1, num);
                rs = pstmt.executeQuery();
                    
                if (rs.next()) {
                	article = new BoardBean();
                   	article.setNum(rs.getInt("num"));
    				article.setWriter(rs.getString("writer"));
    				article.setRead_count(rs.getInt("read_count"));
    				article.setReg_date(rs.getDate("reg_date"));
    				article.setTitle(rs.getString("title"));
    				article.setContent(rs.getString("content")); 
        		}
            } else if(category.equals("issue")) {
            	
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return article;
    }
	
	public void updateArticle(String category, BoardBean article) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String sql="";
        try {
        	conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
            
            if(category.equals("free")) {
	            sql="update board_free set title=?,content=?,edit_date=now() where num=?";
	            pstmt = conn.prepareStatement(sql);
	
	            pstmt.setString(1, article.getTitle());
	            pstmt.setString(2, article.getContent());
	            pstmt.setInt(3, article.getNum());
	            pstmt.executeUpdate();
            } else if(category.equals("motd")) {
            	sql="update board_motd set title=?,content=?"
   			     + "where num=?";
   	            pstmt = conn.prepareStatement(sql);
   	
   	            pstmt.setString(1, article.getTitle());
   	            pstmt.setString(2, article.getContent());
   	            pstmt.setInt(3, article.getNum());
   	            pstmt.executeUpdate();
            } else if(category.equals("issue")) {
            	
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	
	public void deleteArticle(BoardBean article, String category) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String sql="";
        try {
        	conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
            
            if(category.equals("free")) {
	            sql="delete from board_free where num=?";
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, article.getNum());
	            pstmt.executeUpdate();
            } else if(category.equals("motd")) {
            	sql="delete from board_motd where num=?";
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, article.getNum());
	            pstmt.executeUpdate();
            } else if(category.equals("issue")) {
            	sql="delete from board_issue where num=?";
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, article.getNum());
	            pstmt.executeUpdate();
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	
	public void up(int num) {
		Connection conn = null;
        PreparedStatement pstmt = null;

        String sql="";
        try {
        	conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
            
        	sql = "update board_free set up_count = up_count + 1 where num = ?";
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setInt(1, num);
        	pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	}
}
