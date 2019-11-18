<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<style>
div.wrapper{
	margin: 0 auto;
    padding: 100px 200px;
    min-height:1100px;
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
    width: 350px;
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
<div class="wrapper">
<div id="video">
<h1 style="text-align:center; margin-bottom:40px; color:black;">비디오 업로드</h1>
<form action="upVideoAct.jsp" method="post">
<table class="person-tb" >
<tbody>
<tr class="borderTop">
    <th>
        <div class="head-cell"><span class="empha"></span>제목</div>
    </th>
    <td>
        <div class="col-cell">
            <input type="text" name="title" class="MS_input_txt normal-input" size="30" required>
        </div>
    </td>
</tr>
<tr>
	<th>
		<div class="head-cell"><span class="empha"></span>설명</div>
	</th>
	<td>
		<div class="col-cel">
		    <!-- <input type="text" name="text" class="MS_input_txt normal-input" size="15" required> -->
		    <textarea name="text" style="margin: 0px; height: 330px; width: 350px; resize: none;" required></textarea>                                     
		</div>
	</td>
</tr>                  
<tr>
	<th style="border-bottom:1px solid black;">
	    <div class="head-cell"><span class="empha"></span>링크</div>
	</th>
	<td>
		<div class="col-cell">
			<input type="text" name="link" class="MS_input_txt normal-input" size="30" required>                 
		</div>
	</td>
</tr>
</tbody>
</table>
<div class="a">
	<input type="submit" class="skinbtn point2 l-login" value="Upload">
</div>
</form>
</div>
</div>
</body>
</html>