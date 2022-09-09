<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckForm.jsp</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* 아이디 중복확인 *</h3>
		<form method="post" action="idCheckProc.jsp"
			onsubmit="return blankCheck(this)">
			아이디 : <input type="text" name="id" maxlength="15" autofocus>
			<input type="submit" value="중복확인">
		</form>
	</div>

	<script>
		function blankCheck(f) {
			var id = f.id.value;
			id = id.trim();
			if (4>id.length||id.length>10) {
				alert("4~15자리를 입력해세오.");
				return false;
			}//if end
			return true;
		}//blankCheck() end
	</script>
</body>
</html>