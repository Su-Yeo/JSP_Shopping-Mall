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
div.n{ width: 1100px; height: 1000px; margin: 0 auto; margin-top:50px; margin-bottom:50px;}
div.n h1 {
    font-size: 48px;
    color: #000;
    font-family: 'notokr-regular';
    padding-bottom: 35px;
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
    vertical-align: top;
}
table td {
    padding: 17px 0 16px 0;
    color: #000;
    font-family: 'notokr-regular';
    font-size: 24px;
    border-top: 1px solid #dcdcdc;
    text-align: center;
}
table th.subject {
    font-family: 'notokr-regular';
    font-size: 30px;
    font-weight:normal;
    color: #000;
    text-align: left;
    padding-left: 20px;
}
table th.date {
	padding:10px;
    font-family: 'notokr-regular';
    font-size: 23px;
    font-weight:normal;
    color: #000;
    text-align: right;
}
table th.subject b{margin-right:20px;}
table th.date b{margin-right:20px;}
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

.input_txt {
	font-size: 30px;
	width:90%;
	border: 1px solid #888;
}

textarea{
	font-size: 24px;
	resize:none;
	width:100%;
	height:600px;
}
</style>
</head>
<body>
<jsp:useBean id="notice" class="jsp.bean.NoticeBean" scope="request"/>
<%
String nid = request.getParameter("nid");
NoticeDAO ndao = NoticeDAO.getInstance();
ndao.getNotice(notice, nid);
%>
<div class="n">
<a href="index.jsp?target=noticeList"><h1>게시판</h1></a>
<form action="nModifyAct.jsp" method="post" name="form" autocomplete="off">
	<table>
		<colgroup>
			<col width="*">
		</colgroup>
		<thead>
			<tr>
				<th class="subject"><b>제목</b>
				<input type="text" name="title" value="<%=notice.getTitle()%>" class="input_txt" required>
				</th>
			</tr>
			<tr>
				<th class="date"><span class="space"><b>작성자 </b><%=notice.getUid() %></span>
				<span><b>등록일 </b><%=notice.getDate() %></span></th>
			</tr>
		</thead>
		<tbody>		
			<tr>
				<td>
				<%String s = notice.getText().replace("<br>", "\n"); %>
				<textarea name="text" required><%=s %></textarea>
				<input type="hidden" name="nid" value="<%=notice.getNid()%>">
				<input type="hidden" name="uid" value="<%=notice.getUid()%>">
				</td>
			</tr>
		</tbody>
	</table>
	<div class="a">
		<input type="submit" class="skinbtn point2 l-login" value="수정">
		<a href="index.jsp?target=noticeList" class="skinbtn point2 l-login" style="padding:13px 60px; margin-left:10px;">취소</a>
	</div>
	</form>
</div>
</body>
</html>