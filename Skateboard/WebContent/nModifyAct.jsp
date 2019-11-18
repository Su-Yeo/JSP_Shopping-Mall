<%@page import="jsp.bean.NoticeDAO"%>
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
String t = request.getParameter("text");
String text = t.replace("\n", "<br>"); 
%>
<jsp:setProperty name="notice" property="nid" param="nid"/>
<jsp:setProperty name="notice" property="uid" param="uid"/>
<jsp:setProperty name="notice" property="title" param="title"/>
<jsp:setProperty name="notice" property="text" value="<%=text%>"/>
<%
NoticeDAO ndao = NoticeDAO.getInstance();
int x = ndao.deleteNotice(notice.getNid());
if(x==1){
	ndao.insertNotice(notice);
	out.println("<script>");
	out.println("alert('수정되었습니다.')");
	out.println("location.href='index.jsp?target=noticeList'");
	out.println("</script>");
}else{
	out.println("<script>");
	out.println("alert('수정할 수 없습니다.')");
	out.println("location.href='index.jsp?target=noticeList'");
	out.println("</script>");
	
}
%>
</body>
</html>