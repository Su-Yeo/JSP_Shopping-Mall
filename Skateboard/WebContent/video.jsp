<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="jsp.bean.VideoDAO"%>
<%@page import="jsp.bean.VideoBean"%>
<%@page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8"); %>
<! DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<style>
#inner{margin:70px; min-height:1000px;}
iframe{display: inline; float: left; margin-right: 100px;}
h1.title{color:black;}
div#inner div.set dl.text dt.text {margin-top:10px; font-size: 25px; color:black;}
div#inner div.set dl.text{display: block; min-height:315px;}
div#inner div.set:first-child{margin-top:0;}
div#inner div.set{margin-top:120px;}
div#page ul.pager {
    height: 27px;
    margin-top: 55px;
    width: 100%;
    text-align: center;
    margin-bottom:50px;
}
div#page ul {
    list-style: none;
}
div#page ul.pager li {
    display: inline-block;
    margin: 0 10px;
}
div#page ul.pager li.active a {
    font-weight: bold;
    color: #000;
    border-bottom: 1px solid #000;
}

div#page ul.pager li a {
    font-family: 'notokr-regular';
    font-size: 14px;
    color: #7a7674;
}
div#up{
	margin-top:30px;
	height: 30px;
	margin-right: 74px;
}
.skinbtn{ 
	width: 180px;
    height: 50px;
    font-size: 16px;
    background: #000;
    border: 1px solid #000;
    color: #fff;
    text-align:center;
    padding-top:13px;
    float:right;
}
</style>
</head>
<body>
<div id="wrapper">
<div id="up">
<%String login = (String)session.getAttribute("login"); 
if(login!=null&&login.equals("admin")){%>
	<a href="index.jsp?target=upVideo" class="skinbtn">비디오 업로드</a>
<%}%>
</div>
<%
VideoDAO video = VideoDAO.getInstance();
int count=0;
//전체 비디오 개수 구하기
count = video.getVideoCount();
//페이지당 비디오 개수 정하기
int pageSize=3;
//몇번재 페이지 가져올지 페이지 번호 구하기
String pageNum = request.getParameter("pageNum");
if(pageNum == null){
pageNum="1";
}
//현페이지 시작행 구하기
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage-1)*pageSize;
int endRow = currentPage*pageSize;
ArrayList<VideoBean> videoList = null;
if(count!=0){
	videoList= video.getVideoList(startRow, pageSize);
%>
<div id="inner">
<%
for(int i=0; i<videoList.size(); i++){
VideoBean v = (VideoBean)videoList.get(i);
%>
<div class="set">
<iframe width="560" height="315" src="https://www.youtube.com/embed/<%=v.getLink() %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	<dl class="text">
		<dt><h1 class="title"><%=v.getTitle() %></h1></dt>
		<dt class="text"><%=v.getText() %></dt>
	</dl>
</div>
<%} %>
</div>
<div id="page">
<ul class="pager">
<%
if(count>0){
 //페이징 작업을 하기 위해서는 전체 페이지수가 필요
 //전체 페이지수 구하기//50개=>5페이지, 51~59개=>6페이지
 int pageCount = count/pageSize+(count%pageSize==0?0:1);
 //한 페이지에 보여줄 페이지수 설정
 int pageBlock = 3;
 //한 페이지에 보여지는 시작페이지 구하기
 int startPage = ((int)(currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1;
 //한 페이지에 보여지는 끝페이지 구하기
 int endPage = startPage+pageBlock-1;
 if(endPage>pageCount){
  endPage=pageCount;
 }
 if(startPage>pageBlock){
  %><li class=" active"><a href="index.jsp?target=video&pageNum=<%=startPage-pageBlock%>">[이전]</a></li><%
 }
 for(int j=startPage; j<=endPage; j++){
  %><li class=" active"><a href="index.jsp?target=video&pageNum=<%=j%>"><%=j %></a></li><%
 }
 if(endPage<pageCount){
  %><li class=" active"><a href="index.jsp?target=video&pageNum=<%=startPage+pageBlock%>">[다음]</a></li><%  
 }
}
%>
</ul>
</div>
<%}else{ %>
<div style="color:#000; text-align:center; font-size:30px; width:100%; margin:0 auto; padding-top:40px;">
	<b>영상 준비중입니다.ㅠ~ㅠ</b>
</div>
<%} %>
</div>
</body>
</html>