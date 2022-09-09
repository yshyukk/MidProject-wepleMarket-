<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>WEPLE MARKET</title>
    <style>
            @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Noto Sans KR', sans-serif;

}

.accoutn_main{
    position: absolute;
    height: 100%;
    width: 100%;
    z-index: 999;
}

.accoutn_main .video{
    position: absolute;
    z-index: -100;
    height: 100%;
    margin-left: 295px;
}

.form_area{
    position: absolute;
    width: 100%;
    height: 100%;
    background-size: 100% 200%;
    background: radial-gradient(circle at 250% 50%, rgba(255,255,255,0) 0%, rgba(255,255,255,0) 40%, #ffffff 100%);
}
.main_con{
    position: absolute;
    padding: 50px;
    width: 500px;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.137);
}   
.headline h1{
    text-align: right;
    color: #6c7ae0;
    margin-top : 200px;
    margin-bottom: 5px;
    letter-spacing:13px
}
.headline2 h1{
    color: #6c7ae0;
}
.headline{
    text-align: center;
    color: #ffffff;
    margin-top : 200px;
    letter-spacing:10px
}
.headline2{
    text-align: right;
    color: #df973a;
    margin-top : 200px;
    letter-spacing:10px
}
.button span{
    text-align: center;
    color: #ffffff;
    letter-spacing:10px
}

.form_con{
    position: relative;
    padding: 30px;
    width: 100%;
}

.form_con h2{
    margin: 0 30px;
    padding: 0;
    font-size: 15px;
    color: #fff;
    text-align: center;
    letter-spacing:10px
    
}

.form_con .input-box{
    position: relative;
}

.form_con .input-box input{
    width: 100%;
    padding: 10px 0;
    font-size: 10px;
    color: #fff;
    margin-bottom: 30px;
    border: none;
    border-bottom: 1px solid #fff;
    outline: none;
    background: transparent;
}

.form_con .input-box label{
    position: absolute;
    top: 0;
    left: 0;
    padding: 10px 0;
    font-size: 15px;
    color: #fff;
    pointer-events: none;
    transition: .5s;
}

.form_con .input-box input:focus + label,
.form_con .input-box input:valid + label{
    top: -25px;
    left: 0;
    color: #fff;
    font-size: 15px;
}

.form_con .button{
    text-align: center;
}
.form_con button{
    font-size: 15px;
    padding: 8px 20px;
    background: none;
    border: 2px solid #6c7ae0;
    cursor: pointer;
    color: #6c7ae0;
    text-align: center;
    border-radius: 5px;
    letter-spacing:7px
}

.form_con button:hover{
    background: #DDDDDD;
    color: #ffffff;
    border-radius: 5px;
}



.form_con2{
    position: relative;
    padding: 30px;
    width: 100%;
}

.form_con2 h2{
    margin: 0 30px;
    padding: 0;
    font-size: 15px;
    color: #fff;
    text-align: right;
    letter-spacing:10px
    
}

.form_con2 .input-box{
    position: relative;
}

.form_con2 .input-box input{
    width: 100%;
    padding: 10px 0;
    font-size: 10px;
    color: #fff;
    margin-bottom: 30px;
    border: none;
    border-bottom: 1px solid #fff;
    outline: none;
    background: transparent;
}

.form_con2 .input-box label{
    position: absolute;
    top: 0;
    left: 0;
    padding: 10px 0;
    font-size: 15px;
    color: #fff;
    pointer-events: none;
    transition: .5s;
}

.form_con2 .input-box input:focus + label,
.form_con2 .input-box input:valid + label{
    top: -25px;
    left: 0;
    color: #fff;
    font-size: 15px;
}

.form_con2 .button2{
    text-align: right;
}
.form_con2 button{
    font-size: 15px;
    padding: 15px 80px;
    background: none;
    border: none;
    cursor: pointer;
    background-color: #6c7ae0;
    color: #ffffff;
    text-align: right;
    border-radius: 5px;
    letter-spacing:7px
}

.form_con2 button:hover{
    background: #DDDDDD;
    color: #ffffff;
    border-radius: 5px;
}

.hidden{
    display: none;
}

.text-center{
    text-align: center;
    color: #fff;
    margin: 15px 0;
    cursor: pointer;
}

.right{
    width: 800px;
    position: absolute;
    top: -200px;
    left: 1000px;
}
.gohome{
    text-decoration: none;
    color: #6c7ae0;
    font-weight: 700;
}


    </style>
  </head>
  
  <body>
        <div class="accoutn_main">
            <video muted loop autoplay class="video">
                <source src="images/cart.mp4" type="video/mp4">
            </video>
    
            <div class="form_area">


                <div class="main_con">
                    <div class="headline">
                        <h1>WEPLE MARKET</h1>
                        <span>100% Fresh Product</span>
                    </div>
    
                    <div class="form_con">
                        <div class="log_form">
                            <h2>LOGIN</h2>
                            <form name="frmLogin" action="${pageContext.request.contextPath }/login.do" method="post">
                                <div class="input-box">
                                    <input type="userID" name="userId" required>
                                    <label>User ID</label>
                                </div>
                                <div class="input-box">
                                    <input type="password" name="userPw" required>
                                    <label>Password</label>
                                </div>
                                <div class="button">
                                    <button type="submit" onclick="location.href='userInsertForm.do' ">LOGIN</button><br><br>
                                    <span>with weple</span>
                                </div>
                            </form>
                        </div>
    
                <div class="right" >
                    <div class="headline2">
                        <h1>공동 구매 플랫폼 ‘위플 마켓’</h1><br>
                        <span>지역별 공동구매는 회원가입이 필요합니다</span><br><br>
                    </div>
                    
                    <div class="form_con2">
                        <div class="log_form2">
                            <h2></h2>
                            
                                <div class="button2">
                                    <button onclick="location.href='${pageContext.request.contextPath }/userInsertForm.do' ">
                                    SIGN UP</button><br><br>
                                    <a class="gohome" href="${pageContext.request.contextPath }/index.jsp">GO TO HOME</a>
                                </div>
                           
                        </div>
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
			location.href = "home.do";
		</script>
	</c:if>
		<c:if test="${ loginResult == -1 || loginResult == 0 }">
		<script>
			alert("아이디 혹은 비밀번호가 틀렸습니다.");
		</script>
	</c:if>
  
  
</html>


