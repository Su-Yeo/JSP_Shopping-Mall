<%@page import="jsp.bean.MemberBean"%>
<%@page import="jsp.bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
</head>
<body>
<jsp:useBean id="member" class="jsp.bean.MemberBean" scope="request"/>
<jsp:setProperty name="member" property="id" param="id"/>
<jsp:setProperty name="member" property="passwd" param="password"/>
<jsp:setProperty name="member" property="name" param="name"/>
<jsp:setProperty name="member" property="email" param="email1"/>
<jsp:setProperty name="member" property="addr" param="address"/>
<jsp:setProperty name="member" property="tel" param="tel"/>

<%
	String id = (String)session.getAttribute("login");
MemberDAO logon = MemberDAO.getInstance();
int x = logon.updateMember(member,id);

if(x==1){
	out.println("<script>");
	out.println("location.href='index.jsp?target=myPage'");
	out.println("</script>");
}else if(x==0){
	out.println("<script>");
	out.println("alert('비밀번호를 다시 확인해주세요.')");
	out.println("location.href='index.jsp?target=login'");
	out.println("</script>");
}
%>
</body>
</html>