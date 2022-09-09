<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>등록결과</title>
</head>
<body>

<h3>등록이 완료되었습니다.</h3>
	<input type="button" value="홈으로" onclick="location='main.do'"/>
	<input type="submit" value="나의 리뷰내역" onclick="location.href='myListPaging.do?pageNum=1&amount=10'"/>
	<input type="button" value="이전페이지로" onClick="location.href = 'selectOrderDetail.do?orderNum=${orderNum }'"> 
</body>
</html>