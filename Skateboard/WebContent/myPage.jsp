<%@page import="jsp.bean.MemberDAO"%>
<%@page import="jsp.bean.MemberBean"%>
<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<! DOCTYPE html>
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
.person-tb td {
    padding: 13px;
    vertical-align: middle;
}
.person-tb th {
    padding: 13px 26px;
    background-color: #000;
    vertical-align: top;
    color: #fff;
    text-align: left;
    font-size: 14px;
    font-weight: 500;
}
.person-tb th{
    height: 33px;
    border-bottom: 1px solid #e9e9e9;
}
.person-tb td {
    height: 33px;
    border-bottom: 1px solid #888;
}
.normal-input {
    width: 400px;
}

.small-input, .normal-input, .large-input {
    height: 31px;
    line-height: 31px;
    border: 0px solid #888;
    padding: 0 10px;
}
.MS_input_txt {
    margin-right: 5px;
    padding: 2px 0 0 2px;
    line-height: 31px;
    height: 31px;
}
input, select {
    outline: none;
    font-family: Malgun Gothic,'맑은 고딕',Helvetica,AppleGothic,dotum,'돋움',sans-serif;
    color: #717171;
}
.cbtn {
    display: inline-block;
    font-size: 11px;
    color: #000;
    min-width: 98px;
    height: 31px;
    line-height: 32px;
    border: 1px solid #000;
    text-align: center;
    -webkit-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
.person-tb .head-cell {
    position: relative;
    padding-top: 6px;
}
.person-tb .col-cell.social .MS_select:first-child {
    margin-left: 0;
}

.person-tb .col-cell.social .MS_select {
    margin: 0 5px;
}
.person-tb .MS_select {
    height: 33px;
    padding: 0 0 0 10px;
}
.person-tb .col-cell.social .MS_radio {
    margin-left: 20px;
    margin-right: 5px;
}
tr.borderTop{
	border-top: 1px solid #888;
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
if(id==null||x==0){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.')");
	out.println("location.href='index.jsp?target=login'");
	out.println("</script>");
}else{
%>
<div class="wrapper" style="background-color:white">
<h1 style="color:black; text-align:center; margin:40px 0;">회원정보</h1>
<table class="person-tb" >
<tbody>
<tr class="borderTop">
    <th>
        <div class="head-cell"><span class="empha"></span>이름</div>
    </th>
    <td>
        <div class="col-cell">
            <div class="MS_input_txt normal-input"><jsp:getProperty name="member" property="name"/></div>
        </div>
    </td>
</tr>
<tr>
    <th>
        <div class="head-cell"><span class="empha"></span>아이디</div>
    </th>
    <td>
        <div class="col-cell">
            <div class="MS_input_txt normal-input"><jsp:getProperty name="member" property="id"/></div>                                                                                
        </div>
    </td>
</tr>
<tr>
	<th>
		<div class="head-cell"><span class="empha"></span>집주소</div>
    </th>
    <td>
    	<div class="col-cell">
    	<div class="MS_input_txt normal-input"><jsp:getProperty name="member" property="addr"/></div>
		</div>
	</td>
</tr>
<tr>
	<th>
		<div class="head-cell"><span class="empha"></span>이메일</div>
	</th>
	<td>
		<div class="col-cell email-area">
		    <div class="MS_input_txt normal-input"><jsp:getProperty name="member" property="email"/></div>                                            
		</div>
	</td>
</tr>                  
<tr>
	<th style="border-bottom:1px solid black;">
	    <div class="head-cell"><span class="empha"></span>휴대폰</div>
	</th>
	<td>
		<div class="col-cell">
			<div class="MS_input_txt normal-input"><jsp:getProperty name="member" property="tel"/></div>                
		</div>
	</td>
</tr>
</tbody>
</table>
<div class="a">
	<a href="index.jsp?target=memberModify" class="skinbtn point2 l-login" style="padding:10px 35px; margin-right:10px;">정보수정</a>
	<%if(id.equals("admin")){ %>
	<a href="index.jsp?target=memberList" class="skinbtn point2 l-login" style="padding:10px 35px; margin-right:10px;">회원목록</a>
	<%} %>
	<a href="memberRemove.jsp" class="skinbtn point2 l-login" style="padding:10px 35px;">회원탈퇴</a>
</div>
</div>
<%} %>
</body>
</html>