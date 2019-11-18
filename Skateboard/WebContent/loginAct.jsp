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
<jsp:setProperty name="member" property="passwd" param="passwd"/>

<%
	MemberDAO logon = MemberDAO.getInstance();
int x = logon.userCheck(member.getId(), member.getPasswd());
if(x==1){
	session.setAttribute("login", member.getId());
	out.println("<script>");
	out.println("location.href='index.jsp?target=home'");
	out.println("</script>");
}else if(x==0){
	out.println("<script>");
	out.println("alert('비밀번호를 다시 확인해주세요.')");
	out.println("location.href='index.jsp?target=login'");
	out.println("</script>");
}else{
	out.println("<script>");
	out.println("alert('아이디를 다시 확인해주세요.')");
	out.println("location.href='index.jsp?target=login'");
	out.println("</script>");
}
%>

</body>
</html>
