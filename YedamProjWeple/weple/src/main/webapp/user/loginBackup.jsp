<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>login</title>
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@100;500&display=swap');


* {
	box-sizing: border-box;
}

body {
	background: #EDEDEE;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Raleway', sans-serif;
    height: 100vh;
}

h1 {
	font-weight: bold;
	margin: 0;
}

p {
	font-size: 10px;
}

a {
	font-size: 12px;
	text-decoration: none;
	margin: 15px;
}

button {
	border: none;
	font-size: 12px;
	padding: 12px 45px;
    background-color: #a7a7ac;
}


form {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 50px;
	height: 100%;
}

input {
	border: 1px solid;
	padding: 12px;
	margin: 8px;
	width: 100%;
}

.container {
    border: 1px solid;
	border-radius: 10px;
	position: relative;
	width: 770px;
	max-width: 100%;
	min-height: 480px;
}

.form {
	position: absolute;
	top: 0;
	height: 100%;
}

.login-container {
	left: 0;
	width: 50%;
}

.container2 {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
    background-color: rgb(187, 187, 187);
}


.signup {
	text-align: center;
    padding: 180px 0px;
}

.loginApi {
	margin: 20px 0;
}

.loginApi a {
	border: 1px solid;
	border-radius: 50%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	height: 40px;
	width: 40px;
}
.back{
    font-size: 8px;
    padding-top: 5px;
}


    </style>
  </head>
  
  <body>
      <div class="container">
        <div class="form login-container">
            <form name="frmLogin" action="login.do" method="post">
                <h1>With+ Logo</h1>
                <div class="loginApi">
                    <a href="#"><p>NAVER</p></a>
                    <a href="#"><p>GOOGLE</p></a>
                    <a href="#"><p>KAKAO</p></a>
                </div>
                <input type="text" name="userId" placeholder="User ID">
                <input type="password" name="userPw" placeholder="Password">
                <a href="#">ID/PW 찾기</a>
                <input type="submit" value="Login">
            </form>
        </div>
        <div class="container2">
            <div class="signup">
                <h1>회원 가입</h1>
                <p>test 공동구매는 가입이 필요합니다 tset</p>
                <button onclick="location.href='${pageContext.request.contextPath }/userInsertForm.do' ">SignUp</button>
                <div class ="back">
                    <a href="${pageContext.request.contextPath }/index.jsp">홈으로</a>
                </div>
            </div>
        </div>
	  </div>

  </body>
  <script>


  </script>
  
  
	<c:if test="${sessionID != null }">
		<script>
			alert("이미 로그인 중입니다.");
			location.href = "./index.jsp";
		</script>
	</c:if>
		<c:if test="${ loginResult == -1 || loginResult == 0 }">
		<script>
			alert("아이디 혹은 비밀번호가 틀렸습니다.");
		</script>
	</c:if>
  
  
</html>


