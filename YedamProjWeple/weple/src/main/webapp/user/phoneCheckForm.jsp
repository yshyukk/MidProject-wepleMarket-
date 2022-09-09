<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>phoneCheckForm.jsp</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* 전화번호 중복확인 *</h3>
		<form method="post" action="phoneCheckProc.jsp">
			전화번호 : <input type="text" name="phone" autofocus>
			<input type="submit" value="중복확인">
		</form>
	</div>

	<script>

	</script>
</body>
</html>