package jsp.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class VideoDAO {
	private static VideoDAO instance = new VideoDAO();
	public static VideoDAO getInstance() {
		return instance;
	}
	private VideoDAO() {}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jspdb002");
		return ds.getConnection();
	}
	
	public void insertVideo(VideoBean video) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into video(title,text,link) values(?,?,?)");
			pstmt.setString(1, video.getTitle());
			pstmt.setString(2, video.getText());
			pstmt.setString(3, video.getLink());
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
	
	//비디오정보 수정
	public int updatVideo(VideoBean video,String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from video where vid=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pstmt != null)pstmt.close();
				pstmt = conn.prepareStatement("update video set title=?, text=?, link=? where vid=?");
				pstmt.setString(1, video.getTitle());
				pstmt.setString(2, video.getText());
				pstmt.setString(3, video.getLink());
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
	
	//비디오 삭제
	public int deleteVideo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from video where  vid=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pstmt != null)pstmt.close();
				pstmt = conn.prepareStatement("delete from video where vid=?");
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
	
	//비디오 전체 개수
	public int getVideoCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) as count from video");
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
	
	//비디오 가져오기
	public ArrayList<VideoBean> getVideoList(int startRow, int pageSize){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<VideoBean> videoList = new ArrayList<VideoBean>();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from video order by vid limit "+startRow+", "+pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				VideoBean video = new VideoBean();
				video.setVid(rs.getString("vid"));
				video.setTitle(rs.getString("title"));
				video.setText(rs.getString("text"));
				video.setLink(rs.getString("link"));
				videoList.add(video);
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
	 	return videoList;
	 }    	
}
