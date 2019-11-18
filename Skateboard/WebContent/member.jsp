<%@page import="jsp.bean.MemberDAO"%>
<%@page import="jsp.bean.MemberBean"%>
<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<! DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<script>
function check(){
	if(!document.form.id.value){alert("ID를 입력하세요"); return false;}
	var url = "idCheck.jsp?id="+document.form.id.value;
	window.open(url,"아이디중복","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,directories=no,resizable=no,width=300,height=100");
}
function check2(){
	var telExp = /^\d{3}-\d{3,4}-\d{4}$/;
	var pwExp = /^[a-z0-9_]{4,20}$/;
	if(document.form.idDuplication.value !="idCheck"){
		alert('아이디 중복체크를 해주세요'); 
		return false;
	}
	if (!pwExp.test(document.form.password.value)) {
	      alert("비밀번호는 4~20자로 입력해 주세요.");
	      return false
	}
	if(document.form.password.value != document.form.password2.value){
		alert("비밀번호가 다릅니다.");
		document.form.password.value="";
		document.form.password2.value=""
		document.form.password1.focus();
		return false;
	}
	if (!telExp.test(document.form.tel.value)) {
	      alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
	      return false
	}
}
function inputIdChk(){
	document.form.idDuplication.value="idUnckeck";
}
</script>
<style>
div.wrapper{
	margin: 0 auto;
    padding: 60px 0;
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
    width: 265px;
}

.small-input, .normal-input, .large-input {
    height: 31px;
    line-height: 31px;
    border: 1px solid #888;
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
    background-color:#fff;
    min-width: 98px;
    height: 31px;
    line-height: 32px;
    border: 1px solid #717171;
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
.a{margin: 0 auto; text-align:center; margin-top:30px;}
</style>
</head>
<body>
<div class="wrapper" style="background-color:white">
<h1 style="color:black; text-align:center; margin-bottom:40px;">회원가입</h1>
<form action="input.jsp" method="post" name="form" onsubmit="return check2()">
<table class="person-tb" >
<tbody>
<tr class="borderTop">
    <th>
        <div class="head-cell"><span class="empha"></span>이름</div>
    </th>
    <td>
        <div class="col-cell">
            <input type="text" name="name" id="hname" value="" class="MS_input_txt normal-input" size="15" maxlength="30" required>
        </div>
    </td>
</tr>
<tr>
    <th>
        <div class="head-cell"><span class="empha"></span>아이디</div>
    </th>
    <td>
        <div class="col-cell">
            <input type="text" name="id" id="id" value="" class="MS_input_txt normal-input" size="10" maxlength="20" onkeydown="inputIdChk()" required>                                                                                 
            <input type="button" name="idCheck" id="bt" value="중복확인" onclick="check()" class="cbtn form" required> 
        	<input type="hidden" name="idDuplication" value="idUnckeck">
        </div>
    </td>
</tr>
<tr>
    <th>
        <div class="head-cell"><span class="empha"></span>비밀번호</div>
    </th>
    <td>
        <div class="col-cell">
             <input type="password" name="password" id="password1" class="MS_input_txt normal-input" value="" size="15" maxlength="20" required>                                        
             <span class="idpw-info">* 비밀번호는 4~20자로 입력해 주세요.</span>
        </div>
    </td>
</tr>
<tr>
    <th>
        <div class="head-cell"><span class="empha"></span>비밀번호 확인</div>
    </th>
    <td>
        <div class="col-cell">
            <input type="password" name="password2" id="password2" class="MS_input_txt normal-input" value="" size="15" maxlength="20" required>
        </div>
    </td>
</tr>
<tr>
	<th>
		<div class="head-cell"><span class="empha"></span>집주소</div>
    </th>
    <td>
    	<div class="col-cell">
    	<input type="text" name="address" id="haddress1" class="MS_input_txt normal-input" value="" size="40" maxlength="100" required>
		</div>
	</td>
</tr>
<tr>
	<th>
		<div class="head-cell"><span class="empha"></span>이메일</div>
	</th>
	<td>
		<div class="col-cell email-area">
		    <input type="text" name="email1" id="email1" onchange="this.form.emailcheck.value=''" class="MS_input_txt normal-input" size="10" maxlength="20" value="" required>
		    <span>@</span> 
		    <select name="email2" id="email2" class="MS_select MS_email" style="margin-right:5px;" required>
			<option value="">선택</option><option value="naver.com">naver.com</option><option value="nate.com">nate.com</option>
			<option value="gmail.com">gmail.com</option><option value="hanmail.net">hanmail.net</option><option value="direct">직접입력</option>
			</select>                                          
		</div>
	</td>
</tr>                  
<tr>
	<th style="border-bottom:1px solid black;">
	    <div class="head-cell"><span class="empha"></span>휴대폰</div>
	</th>
	<td>
		<div class="col-cell">
			<input type="tel" name="tel" id="etcphone3" class="MS_input_txt normal-input" value="" size="4" maxlength="13" required>
			<span class="idpw-info"> * - 포함</span>                   
		</div>
	</td>
</tr>
</tbody>
</table>
<div class="a">
	<input type="submit" class="skinbtn point2 l-login" value="회원가입">
</div>
</form>
</div>
</body>
</html>