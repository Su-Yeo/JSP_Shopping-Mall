<%@page import="jsp.bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<style>
* {margin:0; padding:0;}
div#storeInner{margin:50px 100px; min-height:1100px;}
div.product dl{
    list-style: none;
    margin-top:24px;
    text-align: center;
    display: inline-block;
    overflow: hidden;
}
div.product dl.img {
	max-height: 970px;
	border: 1px solid #c2c2c2; 
    width: 60%;
    float:left;
    text-align: center;
	margin-right: 120px;
}
div.product dl.info {
	border: 0px solid #c2c2c2; 
    width: 30%;
    text-align: center;
}
a#target {
	width: 85%;
    height: 50px;
    font-size: 20px;
    background: #fff;
    border: 1px solid #000;
    color: #000;
    margin-top:20px;
    text-align: center;
    text-decoration: none;
    padding:13px 60px;
    display: inline-block;
}
div.product dl.img dd {
    width: 100%;
    font-family: 'notokr-regular';
    font-size: 20px;
    color: #000;
    overflow: hidden;
}
div.product dl.info dt {
    width: 100%;
    font-family: 'notokr-regular';
    color: #000;
}
div.product dl.info dt.title{font-size: 36px; padding-top:150px; padding-left:30px; text-align: left;}
div.product dl.info dt.text{font-size: 26px; padding:30px 0 0 30px; text-align: left;}
dd img{
    max-width: 90%;
    border: 0;
    vertical-align:middle;
}
.product_quantity_container {
	padding-left:30px;
	text-align: left;
    margin-top: 43px;
    display: block;
    position: relative;
    box-sizing: border-box;
}
.product_quantity_container span {
    display: inline-block;
    font-size: 14px;
    font-weight: 600;
    color: #232323;
    vertical-align: middle;
}
.product_quantity {
    display: inline-block;
    width: 122px;
    height: 41px;
    border: solid 1px #b5b5b5;
    overflow: hidden;
    padding-left: 11px;
    vertical-align: middle;
    margin-left: 14px;
}
input[type=number]::-webkit-inner-spin-button {  
    height: 40px; 
}
.product_quantity input {
    display: block;
    width: 100%;
    height: 41px;
    border: none;
    outline: none;
    font-size: 18px;
    font-weight: 400;
    color: #232323;
    text-align: left;
    padding-left: 9px;
    line-height: 39px;
}
.skinbtn.point2 { 
	width: 85%;
    height: 50px;
    font-size: 20px;
    background: #000;
    border: 1px solid #000;
    color: #fff;
    margin-top:40px;
    text-align: center;
}
</style>
</head>
<body>
<jsp:useBean id="product" class="jsp.bean.ProductBean" scope="request"/>
<%
String pid = request.getParameter("pid");
ProductDAO pdao = ProductDAO.getInstance();
int x =pdao.getProduct(product, pid);
if(x==1){
%>
<form action="pInputAct.jsp" method="post">
<div id="storeInner">
<div class="product">
	<dl class="img">
		<dd><img src="<%=product.getImg() %>"></dd>
	</dl>
</div>
<div class="product">
	<dl class="info">
		<dt class="title"><b><%=product.getName() %></b></dt>
		<dt class="text"><%=product.getPrice() %>원</dt>
		<dt class="product_quantity_container">
			<span>Quantity</span>
			<div class="product_quantity clearfix">
				<input type="number" pattern="[1-9]*" min=1 value=1 name="quantity">
				<input type="hidden" value="<%=pid %>" name="pid">
			</div>
		</dt>
		<dd><input type="submit" class="skinbtn point2" value="Add to Cart"></dd>
		<dt><a href="index.jsp?target=store" id="target">Back to catalog</a></dt>
	</dl>
</div>
</div>
</form>
<%}else{
	out.println("<script>");
	out.println("alert('상품정보가 없습니다.')");
	out.println("location.href='index.jsp?target=store'");
	out.println("</script>");
} %>
</html>