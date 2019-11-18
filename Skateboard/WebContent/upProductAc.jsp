<%@page import="jsp.bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201707056 - 여수향</title>
</head>
<body>
<%
String savePath=application.getRealPath("/images"); // 업로드 파일을 저장할 폴더 지정
int sizeLimit = 5 * 1024 * 1024 ; // 5메가까지 제한 넘어서면 예외 발생
MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8",
new DefaultFileRenamePolicy()); // 파일 업로드는 이 시점에 이루어짐
File file = multi.getFile("upfile"); // 파일의 이름 얻어옴
String fileName=file.getName();
long fileSize=file.length();
if(fileName == null) { // 파일이 업로드 되지 않았을 때
out.print("파일 업로드 되지 않았음 (이유: 파일 사이즈 초과 등)");
} else {
	String img = "images/"+fileName;
%>
<jsp:useBean id="product" class="jsp.bean.ProductBean" scope="request"/>
<%
product.setRealPrice(Integer.parseInt(multi.getParameter("realPrice")));
product.setImg(img);
product.setName(multi.getParameter("name"));
ProductDAO pDao = ProductDAO.getInstance();
pDao.insertProduct(product);
out.println("<script>");
out.println("alert('성공!')");
out.println("location.href='index.jsp?target=upProduct'");
out.println("</script>");
}%>
</body>
</html>