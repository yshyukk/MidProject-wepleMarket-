<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<thead>
			<tr>				
				<th>작성자</th>
				<th>작성일</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="qnaContentList" value="{qnaContent}"></c:set>
			<form>
					<tr>
						<td>${qnaContentList.writer }</td>
						<td>${qnaContentList.writeDate }</td>
						<td>${qnaContentList.boardContent }</td>			
					</tr>
			</form>
		
		</tbody>
	</table>
	

</body>
</html>