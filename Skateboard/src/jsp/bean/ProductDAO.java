package jsp.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDAO {
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
	private ProductDAO() {}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jspdb002");
		return ds.getConnection();
	}
	
	public void insertProduct(ProductBean product) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into product(name,img,price) values(?,?,?)");
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getImg());
			pstmt.setInt(3, product.getRealPrice());
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
	
	//상품정보 수정
	public int updatProduct(ProductBean product,String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from product where pid=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pstmt != null)pstmt.close();
				pstmt = conn.prepareStatement("update product set name=?, img=?, price=? where pid=?");
				pstmt.setString(1, product.getName());
				pstmt.setString(2, product.getImg());
				pstmt.setInt(3, product.getRealPrice());
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
	
	//상품정보 가져오기
	public int getProduct(ProductBean product, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select pid, name, FORMAT(price , 0) as p, img from product where pid=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x=1;
				product.setPid(rs.getString("pid"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getString("p"));
				product.setImg(rs.getString("img"));
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
	
	//상품 삭제
	public int deleteProduct(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from Product where pid=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pstmt != null)pstmt.close();
				pstmt = conn.prepareStatement("delete from Product where pid=?");
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
	
	//상품 전체 개수
	public int getProductCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) as count from product");
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
	
	//상품 가져오기
	public ArrayList<ProductBean> getProductList(int startRow, int pageSize){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select pid, name, FORMAT(price , 0) as p, img from product "
					+"order by pid desc limit "+startRow+", "+pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ProductBean product = new ProductBean();
				product.setPid(rs.getString("pid"));
				product.setImg(rs.getString("img"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getString("p"));
				productList.add(product);
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
	 	return productList;
	 }    	
}
