<%@page import="jsp.bean.ProductDAO"%>
<%@page import="jsp.bean.CartBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp.bean.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
<script type="text/javascript">
function check(chk) {
	chks = document.getElementsByName("basketchks");
	if(chk.checked==true){
		for(i=0; i < chks.length; i++) {
			chks[i].checked=true;
		}
	}else{
		for(i=0; i < chks.length; i++) {
			chks[i].checked=false;
		}
	}
}
</script>
<style>
div#cartWrap {
    display: block;
    width: 1100px;
    height: 100%;
    margin: 0 auto;
    color:#000;
}
div#cartWrap h1 {
    font-size: 48px;
    color: #000;
    font-family: 'notokr-regular';
    padding-top: 75px;
    padding-bottom: 35px;
    border-bottom: 1px solid #000;
}
table, th, td {
    margin: 0;
    padding: 0;
    border-spacing: 0;
    border: 0;
    border-collapse: collapse;
    vertical-align: middle;
}
.tb-center {
    text-align: center;
}
.tb-left {
    text-align: left;
}
.table-cart thead th {
    padding: 17px 0;
    background: #101010;
    color:#fff;
    font-weight: bold;
}
.table-cart tbody td {
    padding: 10px;
}
.table-cart tbody td .thumb img {
    display: block;
    width: 150px;
    height: 150px;
}
#cartWrap .basket-totalprice {
    height: 78px;
    padding: 0 10px 0 25px;
    font-size: 14px;
    color: #000;
    font-weight: bold;
    text-align: right;
    border-top: 1px solid #000;
    border-bottom: 1px solid #000;
}

#cartWrap .basket-totalprice .totalprice-img {
    float: left;
    line-height: 78px;
}
#cartWrap .basket-totalprice .totalprice-txt {
    float: right;
    line-height: 78px;
}
#cartWrap .btn-order-ctrl {
    margin: 40px 0 50px;
    text-align: center;
}
#cartWrap .btn-order-ctrl a {
    width: 178px;
    height: 58px;
    font-size: 16px;
    line-height: 58px;
}

.CSSbuttonBlack {
    display: inline-block;
    color: #fff;
    text-align: center;
    border: 1px solid #231f20;
    background: #231f20;
}

.butn {
	width: 178px;
    height: 58px;
    font-size: 16px;
    line-height: 58px;
	font-size: 16px;
    color: #fff;
    text-align: center;
    border: 1px solid #231f20;
    background: #231f20;
}
</style>
</head>
<body>
<jsp:useBean id="cart" class="jsp.bean.CartBean" scope="request"/>
<jsp:useBean id="product" class="jsp.bean.ProductBean" scope="request"/>
<%
String id = (String)session.getAttribute("login");
CartDAO cdao = CartDAO.getInstance();
ArrayList<CartBean> cartList = cdao.getCart(id);
int sum=0;
%>
<form action="cartDelete.jsp" method="post" name="form">
<div id="cartWrap">
<h1>장바구니</h1>
<div class="table-cart table-fill-prd">
<table>
	<colgroup>
	    <col width="60">
	    <col width="170">
	    <col width="480">
	    <col width="130">
	    <col width="130">
	    <col width="130">
	</colgroup>
	<thead>
	<tr>
	    <th scope="col"><div class="tb-center"><input type="checkbox" name="allcheck" checked="checked"  onclick="check(this);"></div></th>
        <th scope="col"><div class="tb-center">사진</div></th>
        <th scope="col"><div class="tb-center">상품명</div></th>
        <th scope="col"><div class="tb-center">수량</div></th>
        <th scope="col"><div class="tb-center">금액</div></th>
        <th scope="col"><div class="tb-center">배송비</div></th>
	 </tr>
	</thead>
</table>                    
</div>
<%
 for(int i=0; i<cartList.size(); i++){
	 CartBean c = (CartBean)cartList.get(i);
	 ProductDAO pdao = ProductDAO.getInstance();
	 int x =pdao.getProduct(product, c.getPid());
	 if(x!=1){
		out.println("<script>");
		out.println("alert('상품정보가 없습니다.')");
		out.println("location.href='index.jsp?target=store'");
		out.println("</script>");
	 }else{
%>
<div class="table-cart table-fill-prd">
<table>
<colgroup>
    <col width="60">
    <col width="170">
    <col width="480">
    <col width="130">
    <col width="130">
    <col width="130">
</colgroup>
<tbody>
<tr>
<td>
	<div class="tb-center">
	<input type="checkbox" name="basketchks" checked="checked" value="<%=c.getCid()%>">
	</div>
</td>
 <td>
     <div class="tb-center">
         <div class="thumb">
             <a href="#"><img src="<%=product.getImg() %>"></a>
         </div>
     </div>
 </td>
 <td>
     <div class="tb-left">
         <a href="#"><span style="color:#000;"><%=product.getName() %></span></a>
     </div>
 </td>
 <td><div class="tb-center tb-bold tb-price"><span><%=c.getQuantity() %></span></div></td>
 <td><div class="tb-center tb-bold tb-price"><span><%=c.getTotal() %></span>원</div></td>
 <td><div class="tb-center tb-bold tb-price"><span>무료배송</span></div></td>
</tr>
</tbody>
</table>
</div>
<%
sum+=c.getTotal();
 } 
 }
%>
<div class="basket-totalprice">
    <div class="totalprice-img">총 결제금액</div>
    <div class="totalprice-txt">
        <strong><%=sum%>원</strong>
    </div>
</div>
<div class="btn-order-ctrl">
    <!-- <a href="#" class="CSSbuttonBlack">주문하기</a> -->
    <input type="submit" name="s" class="butn" value="주문하기 ">
    <a href="index.jsp?target=store" class="CSSbuttonBlack">계속 쇼핑하기</a>
    <input type="submit" name="s" class="butn" value="장바구니 비우기">
    </div>
</div>
</form>
</body>
</html>