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
String id = (String)session.getAttribute("login");
%>
<jsp:setProperty name="notice" property="uid" value="<%=id%>"/>
<jsp:setProperty name="notice" property="title" param="title"/>
<jsp:setProperty name="notice" property="text" value="<%=text%>"/>
<%
NoticeDAO ndao = NoticeDAO.getInstance();
ndao.insertNotice(notice);
out.println("<script>");
out.println("location.href='index.jsp?target=noticeList'");
out.println("</script>");
%>
</body>
</html>