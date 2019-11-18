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
<script language="Javascript">
function a(){
	opener.document.form.idDuplication.value="idCheck";
	self.close();
}
function b(){
	opener.document.form.id.value="";
	self.close();
}
</script>
<style type="text/css">
div#center{margin:0 atuo; width: 100%; text-align: center;}
.okbtn { 
	width: 100px;
    height: 40px;
    font-size: 13px;
    background: #000;
    border: 1px solid #000;
    color: #fff;
}
</style>
</head>
<body>
<div id="center">
<%
	String id = request.getParameter("id");
%>
<%
	MemberDAO logon = MemberDAO.getInstance();
int x = logon.confirmId(id);
if(x==0){
%>

<h3 style="color:black; text-align:center; margin-bottom:30px;">사용가능한 아이디 입니다.</h3>
<input type="button" value="확인" class="okbtn" onclick="a()">

<%}else{%>

<h3 style="color:black; text-align:center; margin-bottom:30px;">이미 존재하는 아이디 입니다.</h3>
<input type="button" value="확인" class="okbtn" onclick="b()">

<%}%>
</div>
</body>
</html>
