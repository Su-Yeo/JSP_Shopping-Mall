<%@page import="jsp.bean.VideoDAO"%>
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
<jsp:useBean id="video" class="jsp.bean.VideoBean" scope="request"/>
<%
String t = request.getParameter("text");
String text = t.replace("\n", "<br>"); 
String id = (String)session.getAttribute("login");
%>
<jsp:setProperty name="video" property="link" param="link"/>
<jsp:setProperty name="video" property="title" param="title"/>
<jsp:setProperty name="video" property="text" value="<%=text%>"/>
<%
VideoDAO vdao = VideoDAO.getInstance();
vdao.insertVideo(video);
out.println("<script>");
out.println("alert('성공!')");
out.println("location.href='index.jsp?target=upVideo'");
out.println("</script>");
%>
</body>
</html>