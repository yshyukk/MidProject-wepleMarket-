<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.dev.dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mailCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>* Email 중복 확인 결과 *</h3>
	<%
	UserDAO dao = new UserDAO();
	String mail = request.getParameter("mail");
	int cnt = dao.duplecateEmail(mail);
	out.println("입력 Email : <strong>" + mail + "</stong>");
	if (cnt == 0) {
		out.println("<p>등록된 메일이 없습니다.</p>");
		//out.println("<a href='javascript:apply(\"" + mail + "\")'>[적용]</a>");
	%>

	<script>
		function apply(mail1) {
			opener.document.signupForm.mail1.value = mail1;
			window.close();
		}
	</script>
	<%
	} else {
	out.println("<p style='color: red'>해당 메일은 사용하실 수 없습니다.</p>");
	} //if end
	%>
	<hr>
	<a href="javascript:history.back()">[다시시도]</a> &nbsp; &nbsp;
	<a href="javascript:window.close()">[창닫기]</a>

</body>
</html>