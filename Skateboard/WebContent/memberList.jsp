<%@page import="java.util.ArrayList"%>
<%@page import="jsp.bean.MemberDAO"%>
<%@page import="jsp.bean.MemberBean"%>
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
<style>
div.wrapper{
	margin: 0 auto;
    padding: 60px 0;
    height:700px;
}
table, th, td {
	text-align:center;
	color: #000;
    margin: 0 auto;
    padding: 0;
    border-spacing: 0;
    border: 0;
    border-collapse: collapse;
    vertical-align: middle;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.list-tb td {
    padding: 13px 30px;
    vertical-align: middle;
    height: 33px;
    border-bottom: 1px solid #888;
}
.list-tb th {
    padding: 20px 30px;
    background-color: #000;
    vertical-align: middle;
    color: #fff;
    text-align: center;
    font-size: 16px;
    font-weight: 500;
    height: 33px;
}

.MS_input_txt {
    line-height: 30px;
    height: 30px;
}

.skinbtn.point2 { 
	width: 158px;
    height: 50px;
    font-size: 16px;
    background: #000;
    border: 1px solid #000;
    color: #fff;
}
.a{margin: 0 auto; text-align:center; margin-top:50px;}
</style>
</head>
<body>
<jsp:useBean id="member" class="jsp.bean.MemberBean" scope="request"/>
<%
	String id = (String)session.getAttribute("login");
MemberDAO logon = MemberDAO.getInstance();
int x = logon.getMember(member, id);
if(x==0){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.')");
	out.println("location.href='index.jsp?target=login'");
	out.println("</script>");
}else{
	ArrayList<MemberBean> memberList= logon.getMemberList();
%>
<div class="wrapper" style="background-color:white">
<h1 style="color:black; text-align:center; margin:40px 0;">회원목록</h1>
<table class="list-tb" >
<tbody>
<tr><th class="head-cell">아이디</th><th class="head-cell">이름</th><th class="head-cell">주소</th><th class="head-cell">이메일</th><th class="head-cell">전화번호</th></tr>
<%
 for(int i=0; i<memberList.size(); i++){
  MemberBean m = (MemberBean)memberList.get(i);
  %>
  <tr><td class="col-cell MS_input_txt"><%=m.getId() %></td>
  <td class="col-cell MS_input_txt"><%=m.getName() %></td>
  <td class="col-cell MS_input_txt"><%=m.getAddr() %></td>
  <td class="col-cell MS_input_txt"><%=m.getEmail() %></td>
  <td class="col-cell MS_input_txt"><%=m.getTel() %></td></tr>
 <%}
}
%>
</tbody>
</table>
<div class="a">
	<a href="index.jsp?target=home" class="skinbtn point2 l-login" style="padding:10px 35px; margin-right:10px;">확인</a>
</div>
</div>
</body>
</html>