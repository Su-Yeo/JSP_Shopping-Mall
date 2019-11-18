package jsp.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDAO {
	private static CartDAO instance = new CartDAO();
	public static CartDAO getInstance() {
		return instance;
	}
	private CartDAO() {}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jspdb002");
		return ds.getConnection();
	}
	
	public void insertCart(CartBean cart) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select price from product where pid=?");
			pstmt.setString(1, cart.getPid());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int price = rs.getInt("price");
				if(pstmt != null)pstmt.close();
				pstmt = conn.prepareStatement("insert into cart(uid,pid,quantity,total) values(?,?,?,?)");
				pstmt.setString(1, cart.getUid());
				pstmt.setString(2, cart.getPid());
				pstmt.setInt(3, cart.getQuantity());
				pstmt.setInt(4, (cart.getQuantity()*price));
				pstmt.executeUpdate();
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
	
	//장바구니 삭제
	public int deleteCart(String cid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("delete from cart where cid=?");
			pstmt.setString(1, cid);
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
	
	//장바구니 리스트
	public ArrayList<CartBean> getCart(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CartBean> cartList = new ArrayList<CartBean>();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from cart where uid=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CartBean cart = new CartBean();
				cart.setCid(rs.getInt("cid"));
				cart.setUid(rs.getString("uid"));
				cart.setPid(rs.getString("pid"));
				cart.setQuantity(rs.getInt("quantity"));
				cart.setTotal(rs.getInt("total"));
				cartList.add(cart);
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
	 	return cartList;
	 }
	
}
