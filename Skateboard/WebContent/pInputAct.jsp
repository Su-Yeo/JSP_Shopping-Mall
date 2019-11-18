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
String id = (String)session.getAttribute("login");
if(id==null){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.')");
	out.println("location.href='index.jsp?target=login'");
	out.println("</script>");
}else{%>
<jsp:setProperty name="cart" property="uid" value="<%=id%>"/>
<jsp:setProperty name="cart" property="pid" param="pid"/>
<jsp:setProperty name="cart" property="quantity" param="quantity"/>
<%
CartDAO cdao = CartDAO.getInstance();
cdao.insertCart(cart);
out.println("<script>");
out.println("location.href='index.jsp?target=cart'");
out.println("</script>");
}
%>
</body>
</html>