<%@page import="jsp.bean.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
</head>
<body>
<jsp:useBean id="cart" class="jsp.bean.CartBean" scope="request"/>
<%
String[] chk = request.getParameterValues("basketchks");
String s = request.getParameter("s");
CartDAO cdao = CartDAO.getInstance();
if(chk==null){
	if(s.equals("주문하기 ")){
		out.println("<script>");
		out.println("alert('주문하실 상품을 선택해주세요!');");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('삭제하실 상품을 선택해주세요!');");
		out.println("</script>");
	}
}else{
	for(String val : chk){
		int x =cdao.deleteCart(val);
	}
}
out.println("<script>");
out.println("location.href='index.jsp?target=cart'");
out.println("</script>");
%>
</body>
</html>