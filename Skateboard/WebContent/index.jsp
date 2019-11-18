<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String target = request.getParameter("target");
if(target == null) target = "home";
String targetPage = target + ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<style>
*{margin:0; padding:0; box-sizing:border-box;}
ol,ul{list-style:none;}
body{color:#fff; font-family:"맑은 고딕",나눔고딕,굴림,돋움,sans-serif;line-height:1.2;}
a{text-decoration:none;color:#fff; font-family:"맑은 고딕",나눔고딕,굴림,돋움,sans-serif;}
div#infoMenu{background:black;  height:50px;}
div#infoMenu ul#info{float:right;padding-top:13px;margin-right:40px;}
div#infoMenu ul#info li{display:inline; padding-right:5px;}
header{height:130px; background:black; }
header div.inner img{float:left; margin:30px;}
header div.inner nav ul#navi{float:right; margin-top:60px; margin-right:40px;}
header div.inner nav ul#navi li{display:inline; font-size:30px; padding:10px;}
div.include{min-height:900px;}
footer.bottom{background:black; font-size:20px; height:150px; padding:50px; line-height:35px; width:100%;}
</style>
</head>
<body>
<div id="infoMenu">
	<ul id="info">
	<%String login = (String)session.getAttribute("login"); 
	if(login!=null){%>
		<li><a href="logout.jsp">로그아웃</a></li>
		<li><a href="index.jsp?target=cart">장바구니</a></li>
	<%}else{ %>
		<li><a href="index.jsp?target=login">로그인</a></li>
		<li><a href="index.jsp?target=member">회원가입</a></li>
	<%} %>
		<li><a href="index.jsp?target=myPage">마이페이지</a></li>
	</ul>	
</div>
<hr style="height:2px;border-width:0;color:gray;background-color:white">
<header>
	<div class="inner">
		<a href="index.jsp?target=home"><img src="./images/logo.png" alt="logo"></a>
		<nav>
			<ul id="navi">
				<li><a href="index.jsp?target=about">ABOUT</a></li>
				<li><a href="index.jsp?target=store">STORE</a></li>
				<li><a href="index.jsp?target=noticeList">NOTICE</a></li>
				<li><a href="index.jsp?target=video">VIDEOS</a></li>
			</ul>
		</nav>
	</div>
</header>
<div class="include">
	<jsp:include page="<%= targetPage %>" flush="true"/>
</div>
<footer class="bottom">
201707056 - 여수향 © 2018.12.14<br>
참조 : SK8MAFIA, NOLLIE SKATEBOARDING, monopatin, 삼양맛샵
</footer>

</body>
</html>