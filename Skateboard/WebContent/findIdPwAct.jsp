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
	String id="";
String f = request.getParameter("find");
if(f.equals("pw")){ id = request.getParameter("id");}
String name = request.getParameter("name");
String tel = request.getParameter("tel");
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String email ="";
if(email2.equals("direct")){email=email1;}
else{email = email1+"@"+email2;}
%>
<jsp:useBean id="member" class="jsp.bean.MemberBean" scope="request"/>

<%
	MemberDAO logon = MemberDAO.getInstance();
int x = logon.findMember(member, id, name, email, tel);
if(x==1){
	id=member.getId();
	String pw=member.getPasswd();
	name = member.getName();
	out.print("<script>");
	if(f.equals("pw")){ 
		out.println("alert('"+name+"님의 비밀번호는 " + pw + "입니다.');");
	}else{
		out.println("alert('"+name+"님의 아이디는 " + id + "입니다.');");
	}
	out.println("location.href='index.jsp?target=login'");
	out.println("</script>");
	
}else{
	out.print("<script>");
	out.println("alert('찾을 수 없습니다.')");
	out.println("location.href='index.jsp?target=login'");
	out.println("</script>");
}
%>

</body>
</html>
