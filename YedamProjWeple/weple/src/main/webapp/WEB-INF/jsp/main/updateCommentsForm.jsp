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
		������ ���� : <input type="text" name="updateComment"><br>
		<input type="reset" value="�ٽ��Է�">
		<input type="submit" value="�����ϱ�"><br>
	</form>
</body>
</html>