<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>updateForm</title>
</head>
<body>
<form name="form" action="updateComments.do" method="get">
		<input type="hidden" name="repleNum" value="${repleNum }">
		수정할 내용 : <input type="text" name="updateComment"><br>
		<input type="reset" value="다시입력">
		<input type="submit" value="수정하기"><br>
	</form>
</body>
</html>