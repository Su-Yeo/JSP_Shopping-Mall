<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="media/vidbg.js"></script>
<style>
div#main{
	min-height:900px;
	background-color:#000;
}
div#main section {
  height: 600px;
  background-color: #fff;
  -webkit-transform-style: preserve-3d;
  -moz-transform-style: preserve-3d;
  transform-style: preserve-3d;
}
div#main div.button{font-size:60px; text-align:center; margin-top:40px;}
div#main div.button a{background:#fff; color:black; padding:0 40px 10px 40px; border-radius: 20px;}
</style>
</head>
<body>
<div id="main">
	<section class="video" data-vidbg-bg="mp4: media/skate.mp4, poster: media/fallback.jpg" data-vidbg-options="loop: true, muted: true, overlay: false">
	</section>
	<div class="button"><a href="index.jsp?target=video">▶ MORE VIDEOS</a></div>
</div>
</body>
</html>