<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<! DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<style>
.member {
	height:650px;
    width: 579px;
    margin: 0 auto;
    padding: 100px 0;
}
.member h2 {
    color: #222;
    font-size: 28px;
}
.member .box {
    margin: 17px 0 0;
    padding: 53px 54px 59px;
    border: 1px solid #dcdcdc;
}
.member .box h3 {
    padding: 0 0 3px;
    color: #222;
    font-size: 20px;
    font-weight: normal;
}
.member .box .login {
    overflow: hidden;
}
.member .box .login .input-info {
    float: left;
}
.member .box .login .input-info div {
    position: relative;
    margin: 11px 0 0;
}
.member .box .login .input-info div input {
    width: 290px;
    height: 36px;
    padding: 0 13px;
    border: 1px solid #ccc;
    color: #8c8c8c;
    font-size: 13px;
    line-height: 36px;
}
.member .box .login button {
    float: right;
    margin: 11px 0 0;
}
.skinbtn.point1.l-confirm, .skinbtn.point2.l-login, .skinbtn.point2.fi-id {
    width: 158px;
    height: 87px;
    font-size: 16px;
    font-weight: bold;
    line-height: 85px;
    margin:10px;
}
.skinbtn.point2 {
    background: #000;
    border: 1px solid #000;
    color: #fff;
    font-weight: bold;
}
.member .box .btn {
    margin: 16px 0 0;
    padding: 16px 0 0;
    border-top: 1px solid #dbdbdb;
    font-size: 0;
    text-align: center;
}
.skinbtn.base3.l-join, .skinbtn.default.l-findid, .skinbtn.default.l-findpw, .skinbtn.default.fi-pw, .skinbtn.default.fi-login {
    width: 149px;
    height: 44px;
    line-height: 42px;
    font-weight: bold;
}

.skinbtn.base3 {
    border: 1px solid #a3a3a3;
    color: #666;
}
.skinbtn {
    display: inline-block;
    *display: inline;
    *zoom: 1;
    height: 40px;
    padding: 0 5px;
    text-align: center;
    vertical-align: top;
    box-sizing: border-box;
    cursor: pointer;
    font-size: 12px;
}
.skinbtn.default {
    border: 1px solid #a3a3a3;
    color: #666;
}

.skinbtn + .skinbtn {
    margin: 0 0 0 10px;
}
</style>
</head>
<body>
<div>
	<div class="member">
		<h2>로그인</h2>
		<div class="box">
			<h3>회원 로그인</h3>
			<form action="loginAct.jsp" method="post" name="form">
			 <div class="login">
					<div class="input-info">
						<div>
							<input type="text" name="id" maxlength="20" class="MS_login_id txt-frm" autofocus required></div>
						<div>
						  <input type="password" name="passwd" maxlength="20" class="MS_login_pw txt-frm" required></div>
					</div>
					<input type="submit" class="skinbtn point2 l-login" value="로그인">
				</div>

				<div class="btn">
					<a href="index.jsp?target=member" class="skinbtn base3 l-join" id="btnJoinMember">회원가입</a>
					<a href="index.jsp?target=findIdPw&find=id" class="skinbtn default l-findid" id="btnFindId">아이디 찾기</a>
					<a href="index.jsp?target=findIdPw&find=pw" class="skinbtn default l-findpw" id="btnFindPwd">비밀번호 찾기</a>
				</div>
			</form>				
		</div>
	</div>
</div>
</body>
</html>