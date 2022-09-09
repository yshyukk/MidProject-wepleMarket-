<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALL QnaReview</title>
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

.flex-w.flex-t.p-b-68

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

</head>
<body>
	
	<table border="1">
		<tr>
		 	<th width="50px">작성자</th>
            <th width="500px">제목</th>
            <th width="150px">날짜</th>
            <th width="40px">조회</th>
            <th width="40px">답변여부</th>
            <th width="40px">수정</th>
		</tr>
		
		<c:forEach var="QnaList" items="${AllQnaList }">
		
			<tr>
			<td>${QnaList.writer }</td>	
			<td>${QnaList.title }</td>
			<td>${QnaList.writeDate }</td>
			<td>${QnaList.CNT }</td>
			<td>${QnaList.writer }</td>
			<td><input type="submit" value="수정" onclick="/update.do'"></td>
			</tr>
			
		</c:forEach>
		
	</table>
	<div class="pagination">
		<c:if test="${pageInfo.prev }">
			<a
				href="qnaList.do?pageNum=${pageInfo.startPage - 1 }&amount=${pageInfo.cri.amount}">prev</a>
		</c:if>
		<c:forEach var="num" begin="${pageInfo.startPage }"
			end="${pageInfo.endPage }">
			<a
				href="qnaList.do?pageNum=${num}&amount=${pageInfo.cri.amount}">${num }</a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a
				href="qnaList.do?pageNum=${pageInfo.endPage + 1 }&amount=${pageInfo.cri.amount}">next</a>
		</c:if>
	</div>
	
</body>
</html>