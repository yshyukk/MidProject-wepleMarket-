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
		�ۼ��� ���� : <input type="text" name="createComment"><br>
		<input type="hidden" name="bno" value="${bno }">
		<input type="reset" value="�ٽ��Է�">
		<input type="submit" value="�ۼ��ϱ�"><br>
	</form>
</body>
</html>