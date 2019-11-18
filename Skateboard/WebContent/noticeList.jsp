<%@page import="jsp.bean.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp.bean.NoticeBean"%>
<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<! DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<style>
section#sub03-s01 {
    height: 1052px;
    width: 100%;
    background-color:white;
}
article, aside, details, figcaption, figure, footer, hgroup, menu, section {
    display: block;
}
section#sub03-s01 div.inner {
    width: 1100px;
    height: 100%;
    margin: 0 auto;
}
section#sub03-s01 div.inner h1 {
    font-size: 48px;
    color: #000;
    font-family: 'notokr-regular';
    padding-top: 75px;
    padding-bottom: 35px;
}
section#sub03-s01 div.inner div.search-menu {
    height: 80px;
    background: #111;
    position: relative;
    margin-bottom: 19px;
}

div {
    display: block;
}
form {
    display: block;
    margin-top: 0em;
}

section#sub03-s01 div.inner .search-menu .notice-menu select {
    border: 1px solid #a9adaf;
    float: left;
    font-size: 14px;
    color: #686766;
    font-family: 'notokr-regular';
    width: 122px;
    padding: 3.4px 0;
}
section#sub03-s01 div.inner .search-menu .notice-menu select.second {
    position: absolute;
    right: 309px;
    top: 25px;
}
section#sub03-s01 div.inner .search-menu .search {
    position: absolute;
    right: 94px;
    top: 25px;
}
section#sub03-s01 div.inner .search-menu .search input#search-box {
    border: 1px solid #a9adaf;
    width: 209px;
    height: 30px;
}

section#sub03-s01 div.inner .search-menu .search input {
    text-indent: 10px;
}
.search-menu > .btn01 {
    position: absolute;
    right: 36px;
    top: 25px;
    background: #fff;
    font-size: 14px;
    color: #000;
    font-family: 'notokr-regular';
    width: 54px;
    height: 30px;
}
table {
    width: 100%;
    margin: 0;
    padding: 0;
    border-spacing: 0;
    border: 0;
    border-collapse: collapse;
    word-break: break-all;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    color:black;
}
section#sub03-s01 .inner table tr:last-child {
    border-bottom: 1px solid #7b7674;
}

tr {
    display: table-row;
    vertical-align: inherit;
}
th {
    border-top: 2px solid #000;
    padding: 17px 0 16px 0;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
}
section#sub03-s01 .inner table td {
    padding: 17px 0 16px 0;
    color: #a19e9c;
    font-family: 'notokr-regular';
    font-size: 14px;
    border-top: 1px solid #dcdcdc;
    text-align: center;
}
section#sub03-s01 .inner table td.subject {
    font-family: 'notokr-regular';
    font-size: 16px;
    color: #fff;
    text-align: center;
    padding-left: 20px;
}
section#sub03-s01 .inner ul.pager {
    height: 27px;
    margin-top: 55px;
    width: 100%;
    text-align: center;
}
ul, ol, dl {
    list-style: none;
}
section#sub03-s01 .inner ul.pager li {
    display: inline-block;
    margin: 0 10px;
}
section#sub03-s01 .inner ul.pager li.active a {
    font-weight: bold;
    color: #000;
    border-bottom: 1px solid #000;
}

section#sub03-s01 .inner ul.pager li a {
    font-family: 'notokr-regular';
    font-size: 14px;
    color: #7a7674;
}
tbody tr td.subject a {
    vertical-align: top;
    text-decoration: none;
    color: #000;
}
.write{ 
	position: absolute;
    right: 36px;
    top: 25px;
    background: #fff;
    font-size: 15px;
    font-weight:bold;
    color: #000;
    font-family: 'notokr-regular';
    padding:10px 15px;
}
</style>
</head>
<body>
<%
NoticeDAO notice = NoticeDAO.getInstance();
int count=0;
//전체 글 개수 구하기
count = notice.getNoticeCount();
//페이지당 글 개수 정하기
int pageSize=10;
//몇번재 페이지 가져올지 페이지 번호 구하기
String pageNum = request.getParameter("pageNum");
if(pageNum == null){
pageNum="1";
}
//현페이지 시작행 구하기
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage-1)*pageSize;
int endRow = currentPage*pageSize;
ArrayList<NoticeBean> noticeList = null;
if(count!=0){
noticeList= notice.getNoticeList(startRow, pageSize);
%>
<section id="sub03-s01">
<div class="inner">
	<a href="index.jsp?target=noticeList"><h1>게시판</h1></a>
	<div class="search-menu">
		<div class="notice-menu">
			<!-- <form action="#" method="post">
			
			<select name="s-menu" class="second" title="검색조건선택">
			  <option value="#">조건선택</option>
			  <option value="#">제목</option>
			  <option value="#">내용</option>
			  <option value="#">제목+내용</option>
			</select>
			
			</form>
		</div>
		<div class="search">
			<form action="#" method="get">
			  
				<input type="text" id="search-box">
			  
			</form> -->
		</div>
		<a href="index.jsp?target=noticeWrite" class="write">글쓰기</a>
		<!-- <button class="btn01" onclick="javascript:fnSearchForm(); return false;">검색</button> -->
	</div>
	<!--태이블 태그-->
	<table summary="번호, 제목, 등록일이 나타는 공지사항 게시판입니다.">
		<colgroup>
			<col width="8%">
			<col width="*">
			<col width="17%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">제목</th>
				<th scope="col">작성일자</th>
			</tr>
		</thead>
		<tbody>		
<%
for(int i=0; i<noticeList.size(); i++){
NoticeBean n = (NoticeBean)noticeList.get(i);
%>
			<tr>
				<td class="num"><%=n.getNid() %></td>
				<td class="subject">
					<a href="index.jsp?target=notice&nid=<%=n.getNid() %>&pageNum=<%=pageNum %>">
						<%=n.getTitle() %>
					</a>
				</td>
				<td><%=n.getDate() %></td>
			</tr>
<%} %>
		</tbody>
	</table><!--//태이블 태그-->
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
  %><li class=" active"><a href="index.jsp?target=noticeList&pageNum=<%=startPage-pageBlock%>">[이전]</a></li><%
 }
 for(int i=startPage; i<=endPage; i++){
  %><li class=" active"><a href="index.jsp?target=noticeList&pageNum=<%=i%>"><%=i %></a></li><%
 }
 if(endPage<pageCount){
  %><li class=" active"><a href="index.jsp?target=noticeList&pageNum=<%=startPage+pageBlock%>">[다음]</a></li><%  
 }
}
%>
	</ul>
</div>
<%}else{%>
<section id="sub03-s01">
<div class="inner">
	<h1>게시판</h1>
	<div class="search-menu">
		<div class="notice-menu"></div>
		<a href="index.jsp?target=noticeWrite" class="write">글쓰기</a>
	</div>
	<table summary="번호, 제목, 등록일이 나타는 공지사항 게시판입니다.">
		<colgroup>
			<col width="8%">
			<col width="*">
			<col width="17%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">제목</th>
				<th scope="col">작성일자</th>
			</tr>
		</thead>
	</table>
	<div style="color:#000; text-align:center; font-size:30px; width:100%; margin:0 auto; padding-top:40px;">
	<b>글이 없습니다.ㅠ~ㅠ</b>
	</div>
</div>
</section>
<%}%>
</section>
</body>
</html>