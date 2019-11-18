<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="jsp.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp.bean.ProductDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>
<! DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<style>
div#n{min-height:1150px; margin: 0 auto;}
div#storeInner{margin:50px; min-height:1100px;; }
div.product dl.pro {
    border: 1px solid #c2c2c2;
    width: 30%;
    min-height: 500px;
    text-align: center;
    list-style: none;
    float:left;
    margin:24px;
    overflow: hidden;
}
a#target {
    vertical-align: top;
    text-decoration: none;
    color: #000;
}
div.product dl.pro dd {
    max-width: 100%;
    font-family: 'notokr-regular';
    font-size: 20px;
    color: #000;
    overflow: hidden;
}
div.product dl.pro dt {
    width: 100%;
    font-family: 'notokr-regular';
    color: #000;
}
div.product dl.pro dt.title{font-size: 36px; padding: 8px 0;}
div.product dl.pro dt.text{font-size: 26px; padding-bottom: 5px;}
dd#simg img{
    max-width: 90%; 
    height: auto;
    border: 0;
    vertical-align: top;
}
div#page ul.pager {
    height: 27px;
    margin-top: 55px;
    width: 100%;
    text-align: center;
    margin-bottom:50px;
}
div#page{
	clear: both;
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
	margin-right: 110px;
}
.skinbtn{ 
	width: 158px;
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
<div id="up">
<%String login = (String)session.getAttribute("login"); 
if(login!=null&&login.equals("admin")){%>
	<a href="index.jsp?target=upProduct" class="skinbtn">상품 업로드</a>
<%}%>
</div>
<div id="n">
<%
ProductDAO product = ProductDAO.getInstance();
int count=0;
//전체 상품 개수 구하기
count = product.getProductCount();
//페이지당 상품 개수 정하기
int pageSize=6;
//몇번재 페이지 가져올지 페이지 번호 구하기
String pageNum = request.getParameter("pageNum");
if(pageNum == null){
pageNum="1";
}
//현페이지 시작행 구하기
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage-1)*pageSize;
int endRow = currentPage*pageSize;
ArrayList<ProductBean> proList = null;
if(count!=0){
	proList= product.getProductList(startRow, pageSize);
%>
<div id="storeInner">
<%
for(int i=0; i<proList.size(); i++){
	ProductBean p = (ProductBean)proList.get(i);
%>
<div class="product">
<a href="index.jsp?target=product&pid=<%=p.getPid()%>" id="target">
	<dl class="pro">
		<dd id="simg"><img src="<%=p.getImg() %>" ></dd>
		<dt class="title"><b><%=p.getName() %></b></dt>
		<dt class="text"><%=p.getPrice() %>원</dt>
	</dl>
</a>
</div>
<%}%>
</div>
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
  %><li class=" active"><a href="index.jsp?target=store&pageNum=<%=startPage-pageBlock%>">[이전]</a></li><%
 }
 for(int j=startPage; j<=endPage; j++){
  %><li class=" active"><a href="index.jsp?target=store&pageNum=<%=j%>"><%=j %></a></li><%
 }
 if(endPage<pageCount){
  %><li class=" active"><a href="index.jsp?target=store&pageNum=<%=startPage+pageBlock%>">[다음]</a></li><%  
 }
}
%>
</ul>
</div>
<%}else{%>
<div style="color:#000; text-align:center; font-size:30px; width:100%; margin:0 auto; padding-top:40px;">
	<b>상품 준비중입니다.ㅠ~ㅠ</b>
</div>
<%}%>
</body>
</html>