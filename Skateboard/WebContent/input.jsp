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
<%
	//입력 폼에서 값을 전달받는 코드 
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String email ="";
if(email2.equals("direct")){email=email1;}
else{email = email1+"@"+email2;}
%>
<jsp:useBean id="member" class="jsp.bean.MemberBean" scope="request"/>
<jsp:setProperty name="member" property="id" param="id"/>
<jsp:setProperty name="member" property="passwd" param="password"/>
<jsp:setProperty name="member" property="name" param="name"/>
<jsp:setProperty name="member" property="email" value="<%=email%>"/>
<jsp:setProperty name="member" property="addr" param="address"/>
<jsp:setProperty name="member" property="tel" param="tel"/>

<%
	MemberDAO logon = MemberDAO.getInstance();
logon.insertMember(member);
out.println("<script>");
out.println("alert('가입완료!')");
out.println("location.href='index.jsp?target=login'");
out.println("</script>");
%>

</body>
</html>
