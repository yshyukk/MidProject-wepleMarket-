<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>등록이 완료되었습니다.</h3>
	<input type="button" value="홈으로" onclick="location='index.jsp'"/>
	<input type="submit" value="My qna" onclick="location.href='myQnaListPaging.do?pageNum=1&amount=10'"/>
	<input type="button" value="이전페이지로" onClick="history.go(-1)"> 

</body>
</html>