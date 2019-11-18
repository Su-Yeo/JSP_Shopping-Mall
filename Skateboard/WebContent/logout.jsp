<%@page import="jsp.bean.MemberBean"%>
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
<jsp:useBean id="member" class="jsp.bean.MemberBean" scope="request"/>
<jsp:setProperty name="member" property="id" value=""/>
<% 
session.invalidate();
response.sendRedirect("index.jsp?target=home"); 
%>
</body>
</html>
