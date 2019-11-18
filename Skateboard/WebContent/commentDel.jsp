<%@page import="jsp.bean.CommentDAO"%>
<%@page import="jsp.bean.MemberDAO"%>
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
<jsp:useBean id="comment" class="jsp.bean.CommentBean" scope="request"/>
<%
String cmid = request.getParameter("cmid");
String nid = request.getParameter("nid");
String pageNum = request.getParameter("pageNum");
CommentDAO cdao = CommentDAO.getInstance();
int x = cdao.deleteComment(cmid);
if(x==1){
	out.println("<script>");
	out.println("alert('삭제되었습니다.')");
	response.sendRedirect("index.jsp?target=notice&nid="+nid+"&pageNum="+pageNum);
	out.println("</script>");
}else{
	out.println("<script>");
	out.println("alert('삭제할 수 없습니다.')");
	response.sendRedirect("index.jsp?target=notice&nid="+nid+"&pageNum="+pageNum);
	out.println("</script>");
}
%>
</body>
</html>