<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALL Review</title>
<style>
.pagination {
  display: inline-block;
  margin : 0 auto;
  margin-top : 20px;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

</head>
<body>
	<table border="1">
		<tr>
		<th>작성자</th>
		<th>내용</th>
		<th>작성일</th>
		
		</tr>
		<c:forEach var="allRevList" items="${AllPagingList }">
			<tr>
			<td>${allRevList.writer }</td>	
			<td>${allRevList.boardContent }</td>
			<td>${allRevList.writeDate }</td>
			</tr>
		</c:forEach>
	</table>
	<div class="pagination">
		<c:if test="${pageInfo.prev }">
			<a
				href="reviewListPaging.do?pageNum=${pageInfo.startPage - 1 }&amount=${pageInfo.cri.amount}">prev</a>
		</c:if>
		<c:forEach var="num" begin="${pageInfo.startPage }"
			end="${pageInfo.endPage }">
			<a
				href="reviewListPaging.do?pageNum=${num}&amount=${pageInfo.cri.amount}">${num }</a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a
				href="reviewListPaging.do?pageNum=${pageInfo.endPage + 1 }&amount=${pageInfo.cri.amount}">next</a>
		</c:if>
	</div>
	
</body>
</html>