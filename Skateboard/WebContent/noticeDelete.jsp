<%@page import="jsp.bean.NoticeDAO"%>
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
<jsp:useBean id="notice" class="jsp.bean.NoticeBean" scope="request"/>
<%
String nid = request.getParameter("nid");
NoticeDAO ndao = NoticeDAO.getInstance();
int x = ndao.deleteNotice(nid);
if(x==1){
	out.println("<script>");
	out.println("alert('삭제되었습니다.')");
	out.println("location.href='index.jsp?target=noticeList'");
	out.println("</script>");
}else{
	out.println("<script>");
	out.println("alert('삭제할 수 없습니다.')");
	out.println("location.href='index.jsp?target=noticeList'");
	out.println("</script>");
}
%>
</body>
</html>