<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 리뷰 결과</title>
</head>
<body>
	<form>
	<table border="1">
		<tr>
		<th>상품번호</th>
		<th>상품이름</th>
		<th>작성자</th>
		<th>내용<th>
		<th>작성일</th>
		</tr>
			<c:forEach var="rvo" items="${list }">
			<tr>		
			<td>${rvo.prodId }</td>	
			<td>${rvo.prodName }</td>
			<td>${rvo.writer }</td>
			<td>${rvo.boardContent }</td>
			<td>${rvo.writeDate }</td>					
			</tr>
			</c:forEach>		
	</table>
	<input type="button" value="주문내역" id="move" name="${rvo.ProdId }" onclick="location.href=''">
	<input type="button" value="MyReview" id="move" name="${rvo.bno }" onclick="location.href='../myList.do'">
	<input type="button" value="홈으로" id="move" onclick="location.href=reviewboard/index.jsp'">
	</form>
</body>
</html>