package jsp.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jspdb002");
		return ds.getConnection();
	}
	
	public void insertMember(MemberBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into member2 values(?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getAddr());
			pstmt.setString(5, member.getTel());
			pstmt.setString(6, member.getEmail());
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
	
	//회원인증
	public int userCheck(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=-1;
		try {
			conn = getConnection();
			String orgPass = passwd;
			
			pstmt = conn.prepareStatement("select passwd from member2 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String dbPass = rs.getString("passwd");
				if(orgPass.equals(dbPass))  x=1;
				else x= 0;
			}else x=-1;
			
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
	
	//아이디 중복 확인
	public int confirmId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=-1;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select id from member2 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x=1; //같은 아이디 있음
			else x=0; //같은 아이디 없음
			
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
	
	//회원정보 수정
	public int updateMember(MemberBean member,String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=-1;
		try {
			conn = getConnection();
			String orgPass = member.getPasswd();
			
			pstmt = conn.prepareStatement("select passwd from member2 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orgPass = rs.getString("passwd");
				String dbPass = rs.getString("passwd");
				if(orgPass.equals(dbPass)) {
					if(pstmt != null)pstmt.close();
					pstmt = conn.prepareStatement("update member2 set passwd=?, name=?, addr=?, tel=?, email=? where id=?");
					pstmt.setString(1, member.getPasswd());
					pstmt.setString(2, member.getName());
					pstmt.setString(3, member.getAddr());
					pstmt.setString(4, member.getTel());
					pstmt.setString(5, member.getEmail());
					pstmt.setString(6, member.getId());
					pstmt.executeUpdate();
					x=1;
				}else x=0;
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
	
	//회원정보 가져오기
	public int getMember(MemberBean member, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from member2 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x=1;
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setAddr(rs.getString("addr"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
			}else {
				x=0;
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
	
	public int findMember(MemberBean member, String id, String name, String email, String tel) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = getConnection();
			if(id.equals("")) {
				pstmt = conn.prepareStatement("select * from member2 where name=? and email=? and tel=?");
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				pstmt.setString(3, tel);
			}else {
				pstmt = conn.prepareStatement("select * from member2 where id=? and name=? and email=? and tel=?");
				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, email);
				pstmt.setString(4, tel);
			}
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x=1;
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setAddr(rs.getString("addr"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
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
	
	//회원 삭제
	public int deleteMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=-1;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select passwd from member2 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pstmt != null)pstmt.close();
				pstmt = conn.prepareStatement("delete from member2 where id=?");
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
	
	//회원리스트
	public ArrayList<MemberBean> getMemberList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from member2");
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberBean member = new MemberBean();
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setAddr(rs.getString("addr"));
				member.setTel(rs.getString("tel"));
				member.setEmail(rs.getString("email"));
				memberList.add(member);
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
	 	return memberList;
	 }    	
}
