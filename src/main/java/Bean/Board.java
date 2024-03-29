package Bean;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import com.RemoveTag;
import javax.naming.*;
import Bean.BoardBean;
import Bean.Database;

public class Board {
	private static Board instance = new Board();
	//.jsp페이지에서 DB연동빈인 BoardBean클래스의 메소드에 접근시 필요
	public static Board getInstance() {
		return instance;
	}
	RemoveTag rt = new RemoveTag();
	
	public String getNickname(String email) {
		// 회원의 이메일 정보로 닉네임을 불러오는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String nickname = "";
		String sql = "";

        try {
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
		// 게시판에 글을 작성하는 메소드
        Connection conn = Database.connect();
        PreparedStatement pstmt = null;

		String sql="";

        try {
        	// 카테고리에 따라 다른 sql문을 실행
            if(category.equals("free")) {
	            sql = "insert into board_free (writer,ip,reg_date,title,content) values(?,?,now(),?,?)";
	
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, article.getWriter());
	            pstmt.setString(2, article.getIp());
	            pstmt.setString(3, rt.removeHtmlTag(article.getTitle()));
				pstmt.setString(4, article.getContent());
				
	            pstmt.executeUpdate();
            } else if (category.equals("motd")) {
            	sql = "insert into board_motd (writer,reg_date,title,content) values(?,now(),?,?)";
	
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, article.getWriter());
	            pstmt.setString(2, rt.removeHtmlTag(article.getTitle()));
				pstmt.setString(3, article.getContent());
				
	            pstmt.executeUpdate();
            } else if (category.equals("issue")) {
            	sql = "insert into board_issue (writer,ip,num_rep,reg_date,title,content,attach_file,attach_file_name) values(?,?,?,now(),?,?,?,?)";
            	
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, article.getWriter());
	            pstmt.setString(2, article.getIp());
	            pstmt.setInt(3, article.getNum_rep());
	            
	            pstmt.setString(4, rt.removeHtmlTag(article.getTitle()));
				pstmt.setString(5, article.getContent());
				pstmt.setString(6, article.getAttach_file());
				pstmt.setString(7, article.getAttach_file_name());
				
	            pstmt.executeUpdate();
            } else if (category.equals("event")) {
            	sql = "insert into board_event (writer,reg_date,title,content) values(?,now(),?,?)";
            	
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, article.getWriter());
	            pstmt.setString(2, rt.removeHtmlTag(article.getTitle()));
				pstmt.setString(3, article.getContent());
				
	            pstmt.executeUpdate();
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	
	public int getArticleCount(String category) throws Exception {
		// 게시판에 총 몇 개의 글이 존재하는지 알아내는 메소드
	       Connection conn = Database.connect();
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;

	       int x = 0;

	       try {
	    	   if(category.equals("free")) {
		           pstmt = conn.prepareStatement("select count(*) from board_free");
		           rs = pstmt.executeQuery();
		
		           if (rs.next()) {
		              x = rs.getInt(1);
					}
	    	   } else if(category.equals("motd")) {
	    		   pstmt = conn.prepareStatement("select count(*) from board_motd");
		           rs = pstmt.executeQuery();
		
		           if (rs.next()) {
		              x = rs.getInt(1);
					}
	    	   } else if(category.equals("issue")) {
	    		   pstmt = conn.prepareStatement("select count(*) from board_issue where num_rep = 0");
		           rs = pstmt.executeQuery();
		
		           if (rs.next()) {
		              x = rs.getInt(1);
					}
	    	   } else if(category.equals("event")) {
	    		   pstmt = conn.prepareStatement("select count(*) from board_event");
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
	
	public int getSearchCount(String category, String condition, String content) throws Exception {
		// 게시글 검색을 수행했을 때 결과 값의 개수를 구하는 메소드
	       Connection conn = Database.connect();
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;

	       int x = 0;
	       
	       String writer_email = null;
	       try {
	    	   if(category.equals("free")) {
	    		   if(condition.equals("all")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_free where title like ? or content like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		    		   pstmt.setString(2, "%" + content + "%");
		    		   rs = pstmt.executeQuery();
		    	   } else if(condition.equals("title")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_free where title like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		               rs = pstmt.executeQuery();
		    	   } else if(condition.equals("content")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_free where content like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		               rs = pstmt.executeQuery();
		    	   } else if(condition.equals("writer")) {
		    		   // writer에 들어가는 항목은 이메일이기 때문에 해당 닉네임을 가진 회원의 이메일을 검색하여 그 값으로 검색
		    		   pstmt = conn.prepareStatement("select email from member where nickname = ?");
		    		   pstmt.setString(1, content);
		    		   rs = pstmt.executeQuery();
		    		   rs.next();
		    		   writer_email = rs.getString("email");
		    		   
		    		   pstmt = conn.prepareStatement("select count(*) from board_free where writer like ?");
		    		   pstmt.setString(1, "%" + writer_email + "%");
		               rs = pstmt.executeQuery();
		    	   }
	    	   } else if(category.equals("motd")) {
	    		   if(condition.equals("all")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_motd where title like ? or content like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		    		   pstmt.setString(2, "%" + content + "%");
		    		   rs = pstmt.executeQuery();
		    	   } else if(condition.equals("title")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_motd where title like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		               rs = pstmt.executeQuery();
		    	   } else if(condition.equals("content")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_motd where content like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		               rs = pstmt.executeQuery();
		    	   } else if(condition.equals("writer")) {
		    		   pstmt = conn.prepareStatement("select email from member where nickname = ?");
		    		   pstmt.setString(1, content);
		    		   rs = pstmt.executeQuery();
		    		   rs.next();
		    		   writer_email = rs.getString("email");
		    		   
		    		   pstmt = conn.prepareStatement("select count(*) from board_motd where writer like ?");
		    		   pstmt.setString(1, "%" + writer_email + "%");
		               rs = pstmt.executeQuery();
		    	   }
	    	   } else if(category.equals("issue")) {
	    		   if(condition.equals("all")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_issue where title like ? or content like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		    		   pstmt.setString(2, "%" + content + "%");
		    		   rs = pstmt.executeQuery();
		    	   } else if(condition.equals("title")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_issue where title like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		               rs = pstmt.executeQuery();
		    	   } else if(condition.equals("content")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_issue where content like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		               rs = pstmt.executeQuery();
		    	   } else if(condition.equals("writer")) {
		    		   pstmt = conn.prepareStatement("select email from member where nickname = ?");
		    		   pstmt.setString(1, content);
		    		   rs = pstmt.executeQuery();
		    		   rs.next();
		    		   writer_email = rs.getString("email");
		    		   
		    		   pstmt = conn.prepareStatement("select count(*) from board_issue where writer like ?");
		    		   pstmt.setString(1, "%" + writer_email + "%");
		               rs = pstmt.executeQuery();
		    	   }
	    	   } else if(category.equals("event")) {
	    		   if(condition.equals("all")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_event where title like ? or content like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		    		   pstmt.setString(2, "%" + content + "%");
		    		   rs = pstmt.executeQuery();
		    	   } else if(condition.equals("title")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_event where title like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		               rs = pstmt.executeQuery();
		    	   } else if(condition.equals("content")) {
		    		   pstmt = conn.prepareStatement("select count(*) from board_event where content like ?");
		    		   pstmt.setString(1, "%" + content + "%");
		               rs = pstmt.executeQuery();
		    	   } else if(condition.equals("writer")) {
		    		   pstmt = conn.prepareStatement("select email from member where nickname = ?");
		    		   pstmt.setString(1, content);
		    		   rs = pstmt.executeQuery();
		    		   rs.next();
		    		   writer_email = rs.getString("email");
		    		   
		    		   pstmt = conn.prepareStatement("select count(*) from board_event where writer like ?");
		    		   pstmt.setString(1, "%" + writer_email + "%");
		               rs = pstmt.executeQuery();
		    	   }
	    	   }
	    	   
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
		// 게시글 목록을 불러오는 메소드
       Connection conn = Database.connect();
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<BoardBean> articleList=null;
       
       try {
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
   					  article.setReg_date(rs.getTimestamp("reg_date"));
   					  article.setEdit_date(rs.getTimestamp("edit_date"));
   					  article.setTitle(rs.getString("title"));
   					  article.setContent(rs.getString("content"));
   					  
   	                 articleList.add(article);
   				    }while(rs.next());
   				}
           } else if(category.equals("motd")) {
        	   pstmt = conn.prepareStatement(
          	           	"select * from board_motd order by num desc limit ?, ?");
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
  					  article.setReg_date(rs.getTimestamp("reg_date"));
  					  article.setTitle(rs.getString("title"));
  					  article.setContent(rs.getString("content"));
  					  
  	                 articleList.add(article);
  				    }while(rs.next());
  				}
           } else if(category.equals("issue")) {
        	   pstmt = conn.prepareStatement(
         	           	"select * from board_issue where num_rep = 0 order by num desc limit ?, ?");
        	   pstmt.setInt(1, start-1);
        	   pstmt.setInt(2, end);
     	       rs = pstmt.executeQuery();
     	
 	           if (rs.next()) {
 	               articleList = new ArrayList<BoardBean>(end);
 	               do{
 	                 BoardBean article= new BoardBean();
 					  article.setNum(rs.getInt("num"));
   					  article.setNum_rep(rs.getInt("num_rep"));
   					  article.setWriter(rs.getString("writer"));
 					  article.setRead_count(rs.getInt("read_count"));
 					  article.setUp_count(rs.getInt("up_count"));
 					  article.setIp(rs.getString("ip"));
 					  article.setReg_date(rs.getTimestamp("reg_date"));
 					  article.setEdit_date(rs.getTimestamp("edit_date"));
 					  article.setTitle(rs.getString("title"));
 					  article.setContent(rs.getString("content"));
 					  article.setAttach_file(rs.getString("attach_file"));
 					  article.setAttach_file_name(rs.getString("attach_file_name"));
 					  
 					  articleList.add(article);
 				    }while(rs.next());
 				}
           } else if(category.equals("event")) {
        	   pstmt = conn.prepareStatement(
         	           	"select * from board_event order by num desc limit ?, ?");
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
 					  article.setReg_date(rs.getTimestamp("reg_date"));
 					  article.setTitle(rs.getString("title"));
 					  article.setContent(rs.getString("content"));
 					  
 	                 articleList.add(article);
 				    }while(rs.next());
 				}
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
	
	public List<BoardBean> getSearchResults(String category, int start, int end, String condition, String content) throws Exception {
		// 검색 결과를 리스트로 불러오는 메소드
	       Connection conn = Database.connect();
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;
	       List<BoardBean> articleList=null;
	       
	       String writer_email = null;
	       try {
	           if(category.equals("free")) {
	        	   if(condition.equals("all")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_free where title like ? or content like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setString(2, "%" + content + "%");
		        	   pstmt.setInt(3, start-1);
		        	   pstmt.setInt(4, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("title")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_free where title like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("content")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_free where content like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("writer")) {
		    		   pstmt = conn.prepareStatement("select email from member where nickname = ?");
		    		   pstmt.setString(1, content);
		    		   rs = pstmt.executeQuery();
		    		   rs.next();
		    		   writer_email = rs.getString("email");
		           
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_free where writer like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + writer_email + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   }
	   	
	   	           if (rs.next()) {
	   	               articleList = new ArrayList<BoardBean>(end);
	   	               do{
	   	                 BoardBean article= new BoardBean();
	   					  article.setNum(rs.getInt("num"));
	   					  article.setWriter(rs.getString("writer"));
	   					  article.setRead_count(rs.getInt("read_count"));
	   					  article.setUp_count(rs.getInt("up_count"));
	   					  article.setIp(rs.getString("ip"));
	   					  article.setReg_date(rs.getTimestamp("reg_date"));
	   					  article.setEdit_date(rs.getTimestamp("edit_date"));
	   					  article.setTitle(rs.getString("title"));
	   					  article.setContent(rs.getString("content"));
	   					  
	   	                 articleList.add(article);
	   				    }while(rs.next());
	   				}
	           } else if(category.equals("motd")) {
	        	   if(condition.equals("all")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_motd where title like ? or content like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setString(2, "%" + content + "%");
		        	   pstmt.setInt(3, start-1);
		        	   pstmt.setInt(4, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("title")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_motd where title like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("content")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_motd where content like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("writer")) {
		    		   pstmt = conn.prepareStatement("select email from member where nickname = ?");
		    		   pstmt.setString(1, content);
		    		   rs = pstmt.executeQuery();
		    		   rs.next();
		    		   writer_email = rs.getString("email");
		           
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_motd where writer like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + writer_email + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   }
	      	
	  	           if (rs.next()) {
	  	               articleList = new ArrayList<BoardBean>(end);
	  	               do{
	  	                 BoardBean article= new BoardBean();
	  					  article.setNum(rs.getInt("num"));
	  					  article.setWriter(rs.getString("writer"));
	  					  article.setRead_count(rs.getInt("read_count"));
	  					  article.setReg_date(rs.getTimestamp("reg_date"));
	  					  article.setTitle(rs.getString("title"));
	  					  article.setContent(rs.getString("content"));
	  					  
	  	                 articleList.add(article);
	  				    }while(rs.next());
	  				}
	           } else if(category.equals("issue")) {
	        	   if(condition.equals("all")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_issue where title like ? or content like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setString(2, "%" + content + "%");
		        	   pstmt.setInt(3, start-1);
		        	   pstmt.setInt(4, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("title")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_issue where title like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("content")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_issue where content like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("writer")) {
		    		   pstmt = conn.prepareStatement("select email from member where nickname = ?");
		    		   pstmt.setString(1, content);
		    		   rs = pstmt.executeQuery();
		    		   rs.next();
		    		   writer_email = rs.getString("email");
		           
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_issue where writer like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + writer_email + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   }
	     	
	 	           if (rs.next()) {
	 	               articleList = new ArrayList<BoardBean>(end);
	 	               do{
	 	                 BoardBean article= new BoardBean();
	 					  article.setNum(rs.getInt("num"));
	   					  article.setNum_rep(rs.getInt("num_rep"));
	   					  article.setWriter(rs.getString("writer"));
	 					  article.setRead_count(rs.getInt("read_count"));
	 					  article.setUp_count(rs.getInt("up_count"));
	 					  article.setIp(rs.getString("ip"));
	 					  article.setReg_date(rs.getTimestamp("reg_date"));
	 					  article.setEdit_date(rs.getTimestamp("edit_date"));
	 					  article.setTitle(rs.getString("title"));
	 					  article.setContent(rs.getString("content"));
	 					  article.setAttach_file(rs.getString("attach_file"));
	 					  article.setAttach_file_name(rs.getString("attach_file_name"));
	 					  
	 					  articleList.add(article);
	 				    }while(rs.next());
	 				}
	           } else if(category.equals("event")) {
	        	   if(condition.equals("all")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_event where title like ? or content like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setString(2, "%" + content + "%");
		        	   pstmt.setInt(3, start-1);
		        	   pstmt.setInt(4, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("title")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_event where title like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("content")) {
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_event where content like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + content + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   } else if(condition.equals("writer")) {
		    		   pstmt = conn.prepareStatement("select email from member where nickname = ?");
		    		   pstmt.setString(1, content);
		    		   rs = pstmt.executeQuery();
		    		   rs.next();
		    		   writer_email = rs.getString("email");
		           
	        		   pstmt = conn.prepareStatement(
			       	           	"select * from board_event where writer like ? order by num desc limit ?, ?");
		        	   pstmt.setString(1, "%" + writer_email + "%");
		        	   pstmt.setInt(2, start-1);
		        	   pstmt.setInt(3, end);
		   	           rs = pstmt.executeQuery();
	        	   }
	      	
	  	           if (rs.next()) {
	  	               articleList = new ArrayList<BoardBean>(end);
	  	               do{
	  	                 BoardBean article= new BoardBean();
	  					  article.setNum(rs.getInt("num"));
	  					  article.setWriter(rs.getString("writer"));
	  					  article.setRead_count(rs.getInt("read_count"));
	  					  article.setReg_date(rs.getTimestamp("reg_date"));
	  					  article.setTitle(rs.getString("title"));
	  					  article.setContent(rs.getString("content"));
	  					  
	  	                 articleList.add(article);
	  				    }while(rs.next());
	  				}
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
	
	public BoardBean getLatestMotd() {
		// 최근 공지사항 게시글 1개를 불러오는 메소드
		Connection conn = Database.connect();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardBean article = null;
        try {
            pstmt = conn.prepareStatement("select * from board_motd where reg_date = (select max(reg_date) from board_motd)");
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                article = new BoardBean();
            	article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setRead_count(rs.getInt("read_count"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
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
	
	public List<BoardBean> getLatestMotds() {
		// 최근 공지사항 게시글 3개를 불러오는 메소드
		Connection conn = Database.connect();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
        List<BoardBean> articleList=null;
	    try {
	 	   	pstmt = conn.prepareStatement(
	  	           	"select * from board_motd order by reg_date desc limit 3");
	 	   	rs = pstmt.executeQuery();
	 	   	
	 	   	if (rs.next()) {	
	 	   		articleList = new ArrayList<BoardBean>(3);
	            do{
		            BoardBean article= new BoardBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
					
					articleList.add(article);
	            }while(rs.next());
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
	
	public List<BoardBean> getLatestEvents() {
		// 최근 이벤트 게시글 3개를 불러오는 메소드
		Connection conn = Database.connect();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
        List<BoardBean> articleList=null;
	    try {
	 	   	pstmt = conn.prepareStatement(
	  	           	"select * from board_event order by reg_date desc limit 3");
	 	   	rs = pstmt.executeQuery();
	 	   	
	 	   	if (rs.next()) {	
	 	   		articleList = new ArrayList<BoardBean>(3);
	            do{
		            BoardBean article= new BoardBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
					
					articleList.add(article);
	            }while(rs.next());
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
		
		public BoardBean getBestArticle() {
			// 자유게시판에서 추천수가 가장 높은 게시글 1개를 불러오는 메소드
			Connection conn = Database.connect();
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        BoardBean article = null;
	        try {
	            pstmt = conn.prepareStatement("select * from board_free where up_count = (select max(up_count) from board_free )");
	            rs = pstmt.executeQuery();
	            
	            if(rs.next()) {
	                article = new BoardBean();
	            	article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setRead_count(rs.getInt("read_count"));
					article.setUp_count(rs.getInt("up_count"));
					article.setIp(rs.getString("ip"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setEdit_date(rs.getTimestamp("edit_date"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
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
		
	public List<BoardBean> getBestArticles() throws Exception {
		// 자유게시판에서 추천수가 가장 높은 게시글 4개를 불러오는 메소드
	       Connection conn = Database.connect();
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;
	       List<BoardBean> articleList=null;
	       try {
        	   pstmt = conn.prepareStatement(
         	           	"select * from board_free order by up_count desc limit 4");
     	       rs = pstmt.executeQuery();
     	
 	           if (rs.next()) {
 	               articleList = new ArrayList<BoardBean>(2);
 	               do{
 	                BoardBean article= new BoardBean();
 	                
	            	article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setRead_count(rs.getInt("read_count"));
					article.setUp_count(rs.getInt("up_count"));
					article.setIp(rs.getString("ip"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setEdit_date(rs.getTimestamp("edit_date"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
 					
					articleList.add(article);
 				    }while(rs.next());
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
	
	public List<BoardBean> getBestIssues() throws Exception {
		// 문의게시판에서 공감수가 가장 높은 게시글 2개를 불러오는 메소드
	       Connection conn = Database.connect();
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;
	       List<BoardBean> articleList=null;
	       try {
        	   pstmt = conn.prepareStatement(
         	           	"select * from board_issue order by up_count desc limit 2");
     	       rs = pstmt.executeQuery();
     	
 	           if (rs.next()) {
 	               articleList = new ArrayList<BoardBean>(2);
 	               do{
 	                 BoardBean article= new BoardBean();
 					  article.setNum(rs.getInt("num"));
   					  article.setNum_rep(rs.getInt("num_rep"));
   					  article.setWriter(rs.getString("writer"));
 					  article.setRead_count(rs.getInt("read_count"));
 					  article.setUp_count(rs.getInt("up_count"));
 					  article.setIp(rs.getString("ip"));
 					  article.setReg_date(rs.getTimestamp("reg_date"));
 					  article.setEdit_date(rs.getTimestamp("edit_date"));
 					  article.setTitle(rs.getString("title"));
 					  article.setContent(rs.getString("content"));
 					  article.setAttach_file(rs.getString("attach_file"));
 					  article.setAttach_file_name(rs.getString("attach_file_name"));
 					  
 					  articleList.add(article);
 				    }while(rs.next());
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
		// 게시글을 불러오는 메소드
        Connection conn = Database.connect();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardBean article = null;
        try {
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
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setEdit_date(rs.getTimestamp("edit_date"));
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
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content")); 
        		}
            } else if(category.equals("issue")) {
            	pstmt = conn.prepareStatement("update board_issue set read_count = read_count + 1 where num = ?");
    			pstmt.setInt(1, num);
    			pstmt.executeUpdate();

                pstmt = conn.prepareStatement("select * from board_issue where num = ?");
                pstmt.setInt(1, num);
                rs = pstmt.executeQuery();
                
                if(rs.next()) {
					article = new BoardBean();
					article.setNum(rs.getInt("num"));
					article.setNum_rep(rs.getInt("num_rep"));
					article.setWriter(rs.getString("writer"));
					article.setRead_count(rs.getInt("read_count"));
					article.setUp_count(rs.getInt("up_count"));
					article.setIp(rs.getString("ip"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setEdit_date(rs.getTimestamp("edit_date"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
					article.setAttach_file(rs.getString("attach_file"));
					article.setAttach_file_name(rs.getString("attach_file_name"));
                }
            } else if(category.equals("event")) {
            	pstmt = conn.prepareStatement("update board_event set read_count = read_count + 1 where num = ?");
        		pstmt.setInt(1, num);
        		pstmt.executeUpdate();

                pstmt = conn.prepareStatement("select * from board_event where num = ?");
                pstmt.setInt(1, num);
                rs = pstmt.executeQuery();
                    
                if (rs.next()) {
					article = new BoardBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setRead_count(rs.getInt("read_count"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content")); 
        		}
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
	
	public void updateArticle(BoardBean article, String category) throws Exception {
		// 게시글을 수정하는 메소드
        Connection conn = Database.connect();
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String sql="";
        try {
            if(category.equals("free")) {
	            sql="update board_free set title=?,content=?,edit_date=now() where num=?";
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1, rt.removeHtmlTag(article.getTitle()));
	            pstmt.setString(2, article.getContent());
	            pstmt.setInt(3, article.getNum());
	            pstmt.executeUpdate();
            } else if(category.equals("motd")) {
            	sql="update board_motd set title=?,content=? where num=?";
   	            pstmt = conn.prepareStatement(sql);
   	            
   	            pstmt.setString(1, rt.removeHtmlTag(article.getTitle()));
   	            pstmt.setString(2, article.getContent());
   	            pstmt.setInt(3, article.getNum());
   	            pstmt.executeUpdate();
            } else if(category.equals("issue")) {
            	sql="update board_issue set title=?,content=?,edit_date=now() where num=?";
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1, rt.removeHtmlTag(article.getTitle()));
	            pstmt.setString(2, article.getContent());
	            pstmt.setInt(3, article.getNum());
	            pstmt.executeUpdate();
            } else if(category.equals("event")) {
            	sql="update board_event set title=?,content=? where num=?";
   	            pstmt = conn.prepareStatement(sql);
   	            
   	            pstmt.setString(1, rt.removeHtmlTag(article.getTitle()));
   	            pstmt.setString(2, article.getContent());
   	            pstmt.setInt(3, article.getNum());
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
	
	public void deleteArticle(String category, int num) throws Exception {
		// 게시글을 삭제하는 메소드
        Connection conn = Database.connect();
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String sql="";
        try {
            if(category.equals("free")) {
	            sql="delete from board_free where num=?";
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, num);
	            pstmt.executeUpdate();
            } else if(category.equals("motd")) {
            	sql="delete from board_motd where num=?";
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, num);
	            pstmt.executeUpdate();
            } else if(category.equals("issue")) {
            	sql="delete from board_issue where num=?";
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, num);
	            pstmt.executeUpdate();
            } else if(category.equals("event")) {
            	sql="delete from board_event where num=?";
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, num);
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
	
	public BoardBean getIssueReply(int num) throws Exception {
		// 문의게시판에서 특정 게시글의 답변을 불러오는 메소드
        Connection conn = Database.connect();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardBean article = null;
        try {
            pstmt = conn.prepareStatement("select * from board_issue where num_rep = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                article = new BoardBean();
            	article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setRead_count(rs.getInt("read_count"));
				article.setUp_count(rs.getInt("up_count"));
				article.setIp(rs.getString("ip"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setEdit_date(rs.getTimestamp("edit_date"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setAttach_file(rs.getString("attach_file"));
				article.setAttach_file_name(rs.getString("attach_file_name"));
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
	
	public void up(String category, int num) {
		// 게시글을 추천/공감하는 메소드
		Connection conn = Database.connect();
        PreparedStatement pstmt = null;

        String sql="";
        try {
        	if(category.equals("free")) {
	        	sql = "update board_free set up_count = up_count + 1 where num = ?";
	        	pstmt = conn.prepareStatement(sql);
	        	pstmt.setInt(1, num);
	        	pstmt.executeUpdate();
        	} else if(category.equals("issue")) {
        		sql = "update board_issue set up_count = up_count + 1 where num = ?";
	        	pstmt = conn.prepareStatement(sql);
	        	pstmt.setInt(1, num);
	        	pstmt.executeUpdate();
        	}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	}
	
	public int getCommentCount(int num) throws Exception {
		// 게시글에 달린 댓글 수를 불러오는 메소드
	       Connection conn = Database.connect();
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;

	       int x = 0;

	       try {
	           pstmt = conn.prepareStatement("select count(*) from board_free_com where num_board = ?");
	           pstmt.setInt(1, num);
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
	
	public List<BoardBean> getComments(int num_board) throws Exception {
		// 게시글에 달린 댓글을 리스트로 불러오는 메소드
		Connection conn = Database.connect();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<BoardBean> articleList=null;
	    try {
	    	pstmt = conn.prepareStatement(
   	           	"select * from board_free_com where num_board = ? and num_rep = 0 order by num");
	    	pstmt.setInt(1, num_board);
	        rs = pstmt.executeQuery();
	
	        if (rs.next()) {
	        	articleList = new ArrayList<BoardBean>();
	            do{
	            	BoardBean article= new BoardBean();
	            	article.setNum(rs.getInt("num"));
	            	article.setNum_rep(rs.getInt("num_rep"));
	            	article.setWriter(rs.getString("writer"));
	            	article.setIp(rs.getString("ip"));
	            	article.setReg_date(rs.getTimestamp("reg_date"));
	            	article.setContent(rs.getString("content"));
	            	article.setNum_board(rs.getInt("num_board"));
					  
	                articleList.add(article);
				}while(rs.next());
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
	
	public List<BoardBean> getReplys(int num_rep) throws Exception {
		// 게시글에 달린 답변을 불러오는 메소드
		Connection conn = Database.connect();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<BoardBean> articleList=null;
	    try {
	    	pstmt = conn.prepareStatement(
   	           	"select * from board_free_com where num_rep = ? order by num");
	    	pstmt.setInt(1, num_rep);
	        rs = pstmt.executeQuery();
	
	        if (rs.next()) {
	        	articleList = new ArrayList<BoardBean>();
	            do{
	            	BoardBean article= new BoardBean();
	            	article.setNum(rs.getInt("num"));
	            	article.setNum_rep(rs.getInt("num_rep"));
	            	article.setWriter(rs.getString("writer"));
	            	article.setIp(rs.getString("ip"));
	            	article.setReg_date(rs.getTimestamp("reg_date"));
	            	article.setContent(rs.getString("content"));
	            	article.setNum_board(rs.getInt("num_board"));
					  
	                articleList.add(article);
				}while(rs.next());
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
	
	public void insertComment(BoardBean comment) {
		// 댓글을 작성하는 메소드
		Connection conn = Database.connect();
        PreparedStatement pstmt = null;

		String sql="";

        try {
            sql = "insert into board_free_com (num_rep,writer,ip,reg_date,content,num_board) values(?,?,?,now(),?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, comment.getNum_rep());
            pstmt.setString(2, comment.getWriter());
            pstmt.setString(3, comment.getIp());
			pstmt.setString(4, comment.getContent());
			pstmt.setInt(5, comment.getNum_board());
				
	        pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	}
	
	public void updateComment(int num, String content) {
		// 댓글을 수정하는 메소드
		Connection conn = Database.connect();
        PreparedStatement pstmt = null;

		String sql="";
		
		try {
            sql = "update board_free_com set content = ? where num = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, content);
            pstmt.setInt(2, num);
				
	        pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	}
	
	public void deleteComment(int num) {
		// 댓글을 삭제하는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		
		String sql="";
		
		try {
            sql = "delete from board_free_com where num = ?";

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
