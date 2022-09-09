<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckForm.jsp</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* Email 중복확인 *</h3>
		<form method="post" action="mailCheckProc.jsp">
			Email : <input type="text" name="mail" id="cInput" autofocus>
			<input type="submit" value="중복확인">
		</form>
	</div>

	<script>

	</script>
</body>
</html>