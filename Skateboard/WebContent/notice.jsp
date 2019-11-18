<%@page import="jsp.bean.CommentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp.bean.CommentDAO"%>
<%@page import="jsp.bean.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<style>
div.n{ width: 1100px; min-height: 900px; margin: 0 auto; margin-top:50px; margin-bottom:50px;}
div.n h1 {
    font-size: 48px;
    color: #000;
    font-family: 'notokr-regular';
    padding-bottom: 35px;
}
table.tb {
    width: 100%;
    height:500px;
    margin: 0;
    padding: 0;
    border-spacing: 0;
    border: 0;
    border-collapse: collapse;
    word-break: break-all;
}
table.tb thead {
    display: table-header-group;
    vertical-align: middle;
    color:black;
}
table.tb tr {
    display: table-row;
    vertical-align: inherit;
}
table.tb th {
    border-top: 2px solid #000;
    padding: 17px 0 16px 0;
}
table.tb tbody {
    display: table-row-group;
    vertical-align: top;
}
table.tb td {
    padding: 17px 0 16px 0;
    color: #000;
    font-family: 'notokr-regular';
    font-size: 24px;
    border-top: 1px solid #dcdcdc;
    text-align: left;
}
table.tb th.subject {
    font-family: 'notokr-regular';
    font-size: 30px;
    font-weight:normal;
    color: #000;
    text-align: left;
    padding-left: 20px;
}
table.tb th.date {
	padding:10px;
    font-family: 'notokr-regular';
    font-size: 23px;
    font-weight:normal;
    color: #000;
    text-align: right;
}
table.tb th.subject b{margin-right:20px;}
table.tb th.date b{margin-right:20px;}
span.space{padding-right:30px;}
.skinbtn.point2 { 
	width: 158px;
    height: 50px;
    font-size: 16px;
    background: #000;
    border: 1px solid #000;
    color: #fff;
}
.a{margin: 0 auto; text-align:center; margin-top:50px;}

.wrt_write textarea {
	margin: 0px; 
	width: 88%;
    padding: 1px 0;
    height: 119px;
    border: 1px solid #ddd;
    outline: none;
    color: #717171;
    font-size: 17px;
    font-family: Malgun Gothic,'맑은 고딕',Helvetica,AppleGothic,dotum,'돋움',sans-serif;
    overflow: auto;
    resize:none;
}
.wrt_write .CSSbuttonBlack {
    float: right;
    width: 118px;
    height: 120px;
    font-size: 16px;
    line-height: 120px;
    display: inline-block;
    color: #fff;
    text-align: center;
    border: 1px solid #231f20;
    background: #231f20;
}
.comment-box td {
    padding: 20px 0;
    border-bottom: 1px solid #e9e9e9;
    vertical-align: middle;
}
.tb-left {
    text-align: left;
}
.tb-center {
    text-align: center;
}
.comment-list {
    width: 100%;
    border-top: 1px solid #000;
}
.comment-box .com-name {
    margin-right: 20px;
    font-weight: bold;
    color: #000;
}
.comment-box .com-date {
    font-size: 11px;
    color: #aeaeae;
}
.comment-box .com-cont {
    padding: 10px 20px 0 0;
    color: #828282;
    line-height: 20px;
}
.bbs-link a {
    margin: 0 2px;
}
.CSSbuttonMin {
    padding: 3px 10px;
    font-size: 10px;
}
.CSSbuttonWhite {
    display: inline-block;
    color: #231f20;
    text-align: center;
    border: 1px solid #231f20;
    background: #fff;
    -webkit-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
div#page ul.pager {
    height: 27px;
    margin-top: 40px;
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
</style>
</head>
<body>
<jsp:useBean id="notice" class="jsp.bean.NoticeBean" scope="request"/>
<jsp:useBean id="comment" class="jsp.bean.CommentBean" scope="request"/>
<%
String id = (String)session.getAttribute("login");
String nid = request.getParameter("nid");
String pageNum = request.getParameter("pageNum");
NoticeDAO ndao = NoticeDAO.getInstance();
ndao.getNotice(notice, nid);
%>
<div class="n">
<a href="index.jsp?target=noticeList"><h1>게시판</h1></a>
	<table class="tb">
		<colgroup>
			<col width="*">
		</colgroup>
		<thead>
			<tr>
				<th class="subject"><b>제목</b> <%=notice.getTitle() %></th>
			</tr>
			<tr>
				<th class="date"><span class="space"><b>작성자 </b><%=notice.getUid() %></span>
				<span><b>등록일 </b><%=notice.getDate() %></span></th>
			</tr>
		</thead>
		<tbody>		
			<tr>
				<td><%=notice.getText() %></td>
			</tr>

		</tbody>
	</table>
<%
//페이지당 상품 개수 정하기
int pageSize=5;
//몇번재 페이지 가져올지 페이지 번호 구하기
String pageNumC = request.getParameter("pageNumC");
if(pageNumC == null){
pageNumC="1";
}
//현페이지 시작행 구하기
int currentPage = Integer.parseInt(pageNumC);
int startRow = (currentPage-1)*pageSize;
int endRow = currentPage*pageSize;
CommentDAO cdao = CommentDAO.getInstance();
int count = cdao.getCommentCount(nid);
if(count==0){
%>
	<form action="commentAct.jsp" method="post">
		<div class="wrt wrt_write">
		<textarea name="comment" placeholder="내용" maxlength="100" required></textarea>
		<input type="submit" value="댓글쓰기" class="CSSbuttonBlack">
		<input type="hidden" name="nid" value="<%=notice.getNid()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		</div>
	</form>
	<div class="a">
	<a href="index.jsp?target=noticeList&pageNum=<%=pageNum %>" class="skinbtn point2 l-login" style="padding:10px 35px; margin-right:10px;">목록</a>
	<%if(id!=null){
		if(id.equals(notice.getUid())||id.equals("admin")){ %>
	<a href="index.jsp?target=noticeModify&nid=<%=notice.getNid() %>" class="skinbtn point2 l-login" style="padding:10px 35px; margin-right:10px;">수정</a>
	<a href="noticeDelete.jsp?nid=<%=notice.getNid() %>" class="skinbtn point2 l-login" style="padding:10px 35px; margin-bottom:30px;">삭제</a>
	<%} }%>
	</div>
<%}else{ %>
	<table style="width:100%; margin-bottom:30px;" class="comment-box comment-list">
	<colgroup>
	    <col width="*">
	    <col width="150">                                                                            
	</colgroup>
	<tbody style="padding: 15px 0;">
<%
ArrayList<CommentBean> commentList = cdao.getComment(nid,startRow, pageSize);
for(int i=0; i<commentList.size(); i++){
CommentBean c = (CommentBean)commentList.get(i);
%>
    <tr>
	<td class="tb-left">
    	<span class="com-name"><%=c.getUid() %></span>
    	<span class="com-date"><%=c.getDate() %></span>
    	<div class="com-cont"><%=c.getText() %></div>
	</td>
	<td class="tb-center">
    <div class="bbs-link">
    <%if(id!=null){
		if(id.equals(c.getUid())||id.equals("admin")){ %>
        <span>
            <a href="commentDel.jsp?cmid=<%=c.getCmid() %>&nid=<%=nid%>&pageNum=<%=pageNum %>" class="CSSbuttonWhite CSSbuttonMin">DELETE</a>
         </span>
    <%} }%>
    </div>
    </td>
	</tr>
<%}%>
	</tbody>
	</table>
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
  %><li class=" active"><a href="index.jsp?target=notice&nid=<%=notice.getNid()%>&pageNum=<%=pageNum%>&pageNumC=<%=startPage-pageBlock%>">[이전]</a></li><%
 }
 for(int j=startPage; j<=endPage; j++){
  %><li class=" active"><a href="index.jsp?target=notice&nid=<%=notice.getNid()%>&pageNum=<%=pageNum%>&pageNumC=<%=j%>"><%=j %></a></li><%
 }
 if(endPage<pageCount){
  %><li class=" active"><a href="index.jsp?target=notice&nid=<%=notice.getNid()%>&pageNum=<%=pageNum%>&pageNumC=<%=startPage+pageBlock%>">[다음]</a></li><%  
 }
}
%>
</ul>
</div>
	<form action="commentAct.jsp" method="post">
		<div class="wrt wrt_write">
		<textarea name="comment" placeholder="내용" maxlength="100" required></textarea>
		<input type="submit" value="댓글쓰기" class="CSSbuttonBlack">
		<input type="hidden" name="nid" value="<%=notice.getNid()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		</div>
	</form>
	
	<div class="a">
	<a href="index.jsp?target=noticeList&pageNum=<%=pageNum %>" class="skinbtn point2 l-login" style="padding:10px 35px; margin-right:10px;">목록</a>
	<%if(id!=null){
		if(id.equals(notice.getUid())||id.equals("admin")){ %>
	<a href="index.jsp?target=noticeModify&nid=<%=notice.getNid() %>" class="skinbtn point2 l-login" style="padding:10px 35px; margin-right:10px;">수정</a>
	<a href="noticeDelete.jsp?nid=<%=notice.getNid() %>" class="skinbtn point2 l-login" style="padding:10px 35px; margin-right:10px;">삭제</a>
	<%} }%>
	</div>
<%} %>
</div>
</body>
</html>