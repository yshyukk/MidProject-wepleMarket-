<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.dev.dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>* 아이디 중복 확인 결과 *</h3>
	<%
	UserDAO dao = new UserDAO();
	String id = request.getParameter("id");
	int cnt = dao.duplecateId(id);
	out.println("입력 ID : <strong>" + id + "</stong>");
	if (cnt == 0) {
		out.println("<p>사용 가능한 아이디입니다.</p>");
		out.println("<a href='javascript:apply(\"" + id + "\")'>[적용]</a>");
	%>

	<script>
		function apply(id) {
			opener.document.signupForm.id.value = id;
			window.close(); 
		}
	</script>
	<%
	} else {
	out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>");
	} //if end
	%>
	<hr>
	<a href="javascript:history.back()">[다시시도]</a> &nbsp; &nbsp;
	<a href="javascript:window.close()">[창닫기]</a>

</body>
</html>