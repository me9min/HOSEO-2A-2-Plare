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
	
	public void insertArticle(BoardBean article, String category) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql="";

        try {
        	conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
            if(category == "free") {
	            sql = "insert into board_free(read_count,up_count,writer,ip,reg_date,edit_date,title,content) "
	            		+ "values(0,0,?,?,?,?,?,?)";
	
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, article.getWriter());
	            pstmt.setString(2, article.getIp());
	            pstmt.setDate(3, article.getReg_date());
				pstmt.setDate(4, article.getEdit_date());
	            pstmt.setString(5, article.getTitle());
				pstmt.setString(6, article.getContent());
				
	            pstmt.executeUpdate();
            } else if (category == "motd") {
            	sql = "insert into board_motd(read_count,writer,reg_date,title,content) "
	            		+ "values(0,?,?,?,?)";
	
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, article.getWriter());
	            pstmt.setDate(2, article.getReg_date());
	            pstmt.setString(3, article.getTitle());
				pstmt.setString(4, article.getContent());
				
	            pstmt.executeUpdate();
            } else if (category == "issue") {
            	
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
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
           
           pstmt = conn.prepareStatement("select count(*) from board_?");
           pstmt.setString(1, category);
           rs = pstmt.executeQuery();

           if (rs.next()) {
              x = rs.getInt(1);
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
           
           if(category == "free") {
        	   pstmt = conn.prepareStatement(
       	           	"select * from board_free order by num desc");
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
           } else if(category == "motd") {
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
           } else if(category == "issue") {
	       
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
	
	public void updateArticle(BoardBean article, String category) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String sql="";
        try {
        	conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
            
            if(category == "free") {
	            sql="update board_free set title=?,content=?,edit_date=?"
			     + "where num=?";
	            pstmt = conn.prepareStatement(sql);
	
	            pstmt.setString(1, article.getTitle());
	            pstmt.setString(2, article.getContent());
	            pstmt.setDate(3, article.getEdit_date());
	            pstmt.setInt(4, article.getNum());
	            pstmt.executeUpdate();
            } else if(category == "motd") {
            	sql="update board_motd set title=?,content=?"
   			     + "where num=?";
   	            pstmt = conn.prepareStatement(sql);
   	
   	            pstmt.setString(1, article.getTitle());
   	            pstmt.setString(2, article.getContent());
   	            pstmt.setInt(3, article.getNum());
   	            pstmt.executeUpdate();
            } else if(category == "issue") {
            	
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
            
            if(category == "free") {
	            sql="delete from board_free where num=?";
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, article.getNum());
	            pstmt.executeUpdate();
            } else if(category == "motd") {
            	sql="delete from board_motd where num=?";
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, article.getNum());
	            pstmt.executeUpdate();
            } else if(category == "issue") {
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
}
