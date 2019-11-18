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
<%
	String id = (String)session.getAttribute("login");
MemberDAO logon = MemberDAO.getInstance();
int x = logon.deleteMember(id);
if(x==1){
	out.println("<script>");
	out.println("alert('잘가요 ㅠ~ㅠ')");
	out.println("location.href='logout.jsp'");
	out.println("</script>");
}else{
	out.println("<script>");
	out.println("alert('비밀번호가 틀립니다.')");
	out.println("location.href='index.jsp?target=home'");
	out.println("</script>");
}
%>
</body>
</html>