package jsp.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
	private static NoticeDAO instance = new NoticeDAO();
	public static NoticeDAO getInstance() {
		return instance;
	}
	private NoticeDAO() {}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jspdb002");
		return ds.getConnection();
	}
	
	public void insertNotice(NoticeBean notice) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into notice(title, text, uid, date) values(?,?,?,now())");
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getText());
			pstmt.setString(3, notice.getUid());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null)
				try{pstmt.close();}catch(SQLException sqle){}
			
			if(conn != null)
				try{conn.close();}catch(SQLException sqle){}
		}
	}
	
	//글 가져오기
	public void getNotice(NoticeBean notice, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select nid, title, text, uid, date(date) as date from notice where nid=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice.setNid(rs.getString("nid"));
				notice.setUid(rs.getString("uid"));
				notice.setTitle(rs.getString("title"));
				notice.setText(rs.getString("text"));
				notice.setDate(rs.getString("date"));
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
	}	
	
	//글 삭제
	public int deleteNotice(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) from notice where nid=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pstmt != null)pstmt.close();
				pstmt = conn.prepareStatement("delete from notice where nid=?");
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				x=1;
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
	
	//공지사항 리스트
	public ArrayList<NoticeBean> getNoticeList(int startRow, int pageSize){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBean> noticeList = new ArrayList<NoticeBean>();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select nid, title, text, uid, date(date) as date from notice "
					+"order by nid desc limit "+startRow+", "+pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				NoticeBean notice = new NoticeBean();
				notice.setNid(rs.getString("nid"));
				notice.setTitle(rs.getString("title"));
				notice.setText(rs.getString("text"));
				notice.setUid(rs.getString("uid"));
				notice.setDate(rs.getString("date"));
				noticeList.add(notice);
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
	 	return noticeList;
	 }
	
	//공지사항 전체 글 개수
	public int getNoticeCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) as count from notice");
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
}
