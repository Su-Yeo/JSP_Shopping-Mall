<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="jsp.bean.CommentDAO"%>
<%@page import="jsp.bean.NoticeDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
</head>
<body>
<jsp:useBean id="comment" class="jsp.bean.CommentBean" scope="request"/>
<%
String id = (String)session.getAttribute("login");
if(id==null){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.')");
	out.println("location.href='index.jsp?target=login'");
	out.println("</script>");
}else{
	String t = request.getParameter("comment");
	String text = t.replace("\n", "<br>"); 
	String pageNum = request.getParameter("pageNum");
%>
<jsp:setProperty name="comment" property="uid" value="<%=id%>"/>
<jsp:setProperty name="comment" property="text" value="<%=text%>"/>
<jsp:setProperty name="comment" property="nid" param="nid"/>
<%
CommentDAO cdao = CommentDAO.getInstance();
cdao.insertComment(comment);
response.sendRedirect("index.jsp?target=notice&nid="+comment.getNid()+"&pageNum="+pageNum);
}
%>
</body>
</html>