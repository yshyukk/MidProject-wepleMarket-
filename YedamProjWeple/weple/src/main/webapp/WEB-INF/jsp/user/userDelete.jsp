<%@page import="com.dev.dao.UserDAO"%>
<%@page import="com.dev.service.user.UserService"%>
<%@page import="com.dev.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="utf-8">
	<title>userUpdate</title>
	<style>
	
	</style>
</head>


<body>
	<%
	// 세션값 제어
	String id = (String)session.getAttribute("userId");
	
	if(id == null){
		response.sendRedirect("login.jsp");
	}
	
	// 해당 회원의 모든정보를 가져와서 화면에 출력
	
	UserDAO mdao = new UserDAO();	
	UserService service = UserService.getInstance();
	User userVO = service.getUserInfo(id);
	
	%>

	<div class="container">
		<div>
			<form action="userDelete.do" method="post" name="deleteForm" id="deleteForm">
				<h2>회원 탈퇴</h2>

				아이디<input class="input" type="text" name="id" id="id" placeholder="User ID" value="<%=userVO.getUserId()%>" style="border:none" readonly ><br>
				
				비번<input class="input" type="password" name="password" id="password" placeholder="Password"><br>
				비번확인<input class="input" type="password" name="passwordCheck" id="passwordCheck" placeholder="Password Check"><br>

				<button type="button" onclick="deleteCheck();" class="button">탈퇴</button>
			</form>
		</div>
	</div>



	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>     
	
    	/////유효성 검사//////
    	function deleteCheck() {
		  let id = document.getElementById("id");
		  let pw = document.getElementById("password");
		  let pwc = document.getElementById("passwordCheck");
		

		  if (pw.value == "") {
		    alert("비밀번호를 입력하세요.");
		    pw.focus();
		    return false;
		  };
		
		
		  if (pwc.value !== pw.value) {
		    alert("비밀번호가 일치하지 않습니다.");
		    pwc.value="";
		    pwc.focus();
		    return false;
		  };
		  

	

		  //입력 값 전송
		  deleteForm.submit();
		  alert("탈퇴 완료 그동안 이용 감사 굿바이");
		  //location.href="logout.do";
		}
		    	        
    </script>

</body>

</html>