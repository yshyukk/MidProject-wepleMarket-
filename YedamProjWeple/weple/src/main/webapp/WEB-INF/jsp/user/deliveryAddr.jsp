<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/deliveryAddr.css" rel="stylesheet">
</head>
<body>
	<form id="deliveryList">
		<table class="deliveryList" style="text-align: center">
			<h4>나의 배송지</h4>
			<ul id="buttons">
				<li><input id="submit" type="button" value="추가"></li>
			</ul>
			<tr>
				<th>선택</th>
				<th>별칭</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>우편번호</th>
				<th>이름</th>
				<th>연락처</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<tr>
				<th><input type="checkbox" value="선택"></th>
				<th>아지트</th>
				<th>대구광역시 수성구 범어동 150-8 범어시티빌</th>
				<th>지하 1층</th>
				<th>420-111</th>
				<th>몽숭몽숭</th>
				<th>010-1111-2222</th>
				<th><input id="alteraddr" type="button" value="수정"></th>
				<th><input id="deladdr" type="submit" value="삭제"></th>
			</tr>
		</table>
	</form>
</body>
</html>