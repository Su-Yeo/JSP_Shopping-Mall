package jsp.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDAO {
	private static CommentDAO instance = new CommentDAO();
	public static CommentDAO getInstance() {
		return instance;
	}
	private CommentDAO() {}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jspdb002");
		return ds.getConnection();
	}
	
	public void insertComment(CommentBean comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("insert into comment(nid,text,uid,date) values(?,?,?,now())");
			pstmt.setInt(1, comment.getNid());
			pstmt.setString(2, comment.getText());
			pstmt.setString(3, comment.getUid());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null)
				try{rs.close();}catch(SQLException sqle){}
			if(pstmt != null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null)
				try{conn.close();}catch(SQLException sqle){}
		}
	}
	
	//댓글 삭제
	public int deleteComment(String cmid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("delete from comment where cmid=?");
			pstmt.setString(1, cmid);
			pstmt.executeUpdate();
			x=1;
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null)
				try{rs.close();}catch(SQLException sqle){}
			if(pstmt != null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null)
				try{conn.close();}catch(SQLException sqle){}
		}
		return x;
	}
	
	//전체 댓글 개수
	public int getCommentCount(String nid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) as count from comment where nid=?");
			pstmt.setString(1, nid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x=Integer.parseInt(rs.getString("count"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null)
				try{rs.close();}catch(SQLException sqle){}
			if(pstmt != null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null)
				try{conn.close();}catch(SQLException sqle){}
		}
		return x;
	}	
		
	//댓글 리스트
	public ArrayList<CommentBean> getComment(String nid,int startRow, int pageSize){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommentBean> commentList = new ArrayList<CommentBean>();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select cmid,uid,nid,text,DATE_FORMAT(date, \"%Y-%c-%d %T\") as date from comment where nid=?"
			+"order by cmid limit "+startRow+", "+pageSize);
			pstmt.setString(1, nid);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CommentBean comment = new CommentBean();
				comment.setCmid(rs.getInt("cmid"));
				comment.setUid(rs.getString("uid"));
				comment.setNid(rs.getInt("nid"));
				comment.setText(rs.getString("text"));
				comment.setDate(rs.getString("date"));
				commentList.add(comment);
				}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			 if(rs != null)
				 try{rs.close();}catch(SQLException sqle){}
			 if(pstmt != null)
				 try{pstmt.close();}catch(SQLException sqle){}
			 if(conn != null)
				 try{conn.close();}catch(SQLException sqle){}
		}
	 	return commentList;
	 }
	
}
