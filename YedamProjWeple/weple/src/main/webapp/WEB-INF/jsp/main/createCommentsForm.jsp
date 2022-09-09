<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form name="form" action="createComments.do" method="get">
		작성할 내용 : <input type="text" name="createComment"><br>
		<input type="hidden" name="bno" value="${bno }">
		<input type="reset" value="다시입력">
		<input type="submit" value="작성하기"><br>
	</form>
</body>
</html>