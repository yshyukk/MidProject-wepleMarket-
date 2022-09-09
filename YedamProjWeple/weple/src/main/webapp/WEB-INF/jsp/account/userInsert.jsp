<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
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
    padding-top:15px;
    width: 500px;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.137);
}   
.headline h1{
    text-align: right;
    color: #6c7ae0;
    margin-top : 0px;
    margin-bottom: 5px;
    letter-spacing:13px
}
.headline2 h1{
    color: #6c7ae0;
}
.headline{
    text-align: center;
    color: #ffffff;
    margin-top : 0px;
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
    padding: 8px 0;
    font-size: 10px;
    color: #fff;
    margin-bottom: 20px;
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
    margin-bottom: 25px;
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
    top: 10%;
    left: 50%;
}
.gohome{
    text-decoration: none;
    color: #6c7ae0;
    font-weight: 700;
}
#domain-list{
	color:rgb(255, 255, 255);
	background-color:rgba(160, 160, 160, 0.459);
  border: none;
}
#phone-list{
	color:rgb(255, 255, 255);
	background-color:rgba(160, 160, 160, 0.459);
  border: none;
}
#gender{
	color:rgb(255, 255, 255);
	background-color:rgba(160, 160, 160, 0.459);
  border: none;
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

                    </div>
    
                    <div class="form_con">
                        <div class="log_form">
                            
                           <form action="${pageContext.request.contextPath }/userInsert.do" method="post" name="signupForm" id="signupForm">
                                <div class="input-box">
                                    <input class="input" type="text" name="id" id="id">
                                    <label>User ID</label>
                                    <input type="button" value="중복체크" onclick="idCheck()" style="border:1px solid white;">
									<input type="hidden" name="idDuplication" value="idUncheck">
                                </div>
                                <div class="input-box">
                                    <input class="input" type="password" name="password" id="password">
                                    <label>Password</label>
                                </div>
                                <div class="input-box">
                                    <input class="input" type="password" name="passwordCheck" id="passwordCheck">
                                    <label>Password Check</label>
                                </div>
                                
                                <div class="input-box">
                                 	<input id="email-id" type="text" name="mail1" style="width: 100px" />
                                 	<span style="color:white">@</span>
									<input id="domain-txt" type="text" name="mail2" style="width: 100px" />
								<label>Email</label>
								<select id="domain-list" name="domain-list">
									<option value="type">-select-</option>
									<option value="naver.com">naver.com</option>
									<option value="google.com">google.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="kakao.com">kakao.com</option>
									<option value="type">직접 입력</option>
								</select>
								<input type="button" value="중복체크" onclick="mailCheck()" style="border:1px solid white;">
                                </div>

                                <div class="input-box">
                                    <input class="input" type="text" name="name" id="name">
                                    <label>Name</label>
                                </div>

                                <div class="input-box">
                                    <label>Address</label>
                                    <br>
					   				<div class="adr">
										<input type="text" id="postcode" placeholder="우편번호" name="post" style="width: 60px">
										<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width: 60px"><br>
										<input type="text" id="address" placeholder="주소" name="address1" style="width: 180px">
										<input type="text" id="detailAddress" placeholder="상세주소" name="address2" style="width: 70px">
										<input type="text" id="extraAddress" placeholder="참고주소" name="address3" style="width: 70px">
									</div>
                                </div>


                                <div class="input-box">
                                    <label>Tel</label><br><br>
                                    	<select id="phone-list">
											<option value="select">-select-</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="051">051</option>
											<option value="053">053</option>
											<option value="type2">직접 입력</option>
										</select>
									<input id="phone1" type="text" name="pnum1" style="width: 75px" />
									<span style="color:white">-</span>
									<input id="phone2" type="text" name="pnum2" style="width: 75px" />
									<span style="color:white">-</span>
									<input id="phone3" type="text" name="pnum3" style="width: 75px" />
									<input type="button" value="중복체크" onclick="phoneCheck()" style="border:1px solid white;">
                                </div>
                                
                                <div class="input-box">
                                    <label>Birth</label><br>
                                    <input class="input" type="date" name="birth" id="bday">
                                </div>

                                <div class="input-box">
                                    <label>Gender</label><br><br>
                               		<select id="gender" class="gender" name="gender" style="width:350px">
										<option value="">성별 선택</option>
										<option value="남">남</option>
										<option value="여">여</option>
										<option value="">미등록</option>
									</select>
                                </div>
                                <br>

                                <div class="button">
                                    <button type="button" onclick="SignupCheck();" class="button">
                                    SIGN UP</button><br><br>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>




                <div class="right" >
                    <div class="headline2">
                        <h1>공동 구매 플랫폼 ‘위플 마켓’</h1><br>
                        <span>Welcome to weple market with shopping</span><br><br>
                    </div>
                    
                    <div class="form_con2">
                        <div class="log_form2">
                            <h2></h2>
                                <div class="button2">
                                    <button class="button22" onclick="location.href='loginForm.do' ">LOGIN</button><br><br>
                                    <a class="gohome" href="${pageContext.request.contextPath }/index.jsp">GO TO HOME</a>
                                </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>



	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
		//Singup버튼 아웃풋
		function signupOutput(){
			window.open("userInsertOutput.jsp", "signup", "width=400, height=350")
		}
        //아이디 중복체크 새창
        function idCheck(){
		  window.open("<%= request.getContextPath() %>/user/idCheckForm.jsp", "idwin", "width=400, height=350");
		}
        
        //메일 중복체크 새창
        function mailCheck(){
        	window.open("<%= request.getContextPath() %>/user/mailCheckForm.jsp", "mlwin", "width=400, height=350");
  		}
        
        //전화 중복체크 새창
        function phoneCheck(){
        	window.open("<%= request.getContextPath() %>/user/phoneCheckForm.jsp", "phwin", "width=400, height=350");
  		}
        
	
    	/////유효성 검사//////
    	function SignupCheck() {
		  let id = document.getElementById("id");
		  let pw = document.getElementById("password");
		  let pwc = document.getElementById("passwordCheck");
		  let ml1 = document.getElementById("email-id");
		  let ml2 = document.getElementById("domain-txt");
		  let nm = document.getElementById("name");
		  let pt = document.getElementById("postcode");
		  let ad1 = document.getElementById("address");
		  let ad2 = document.getElementById("detailAddress");
		  let ad3 = document.getElementById("extraAddress");
		  let pn1 = document.getElementById("phone1");
		  let pn2 = document.getElementById("phone2");
		  let pn3 = document.getElementById("phone3");
		  let bd = document.getElementById("bday");
		
		  if (id.value == "") {
		    alert("아이디를 입력하세요.");
		    id.focus();
		    return false;
		  };
		
		  if (pw.value == "") {
		    alert("비밀번호를 입력하세요.");
		    pw.focus();
		    return false;
		  };
		
		  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
		  let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		
		  if (!pwdCheck.test(pw.value)) {
		    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		    pw.value="";
		    pw.focus();
		    return false;
		  };
		
		  if (pwc.value !== pw.value) {
		    alert("비밀번호가 일치하지 않습니다.");
		    pwc.value="";
		    pwc.focus();
		    return false;
		  };
		
		  if (ml1.value == "" || ml2.value == "" ) {
		    alert("이메일 주소를 입력하세요.");
		    ml1.value="";
		    ml1.focus();
		    return false;
		  }
		
		  if (nm.value == "") {
		    alert("이름을 입력하세요.");
		    nm.value="";
		    nm.focus();
		    return false;
		  };
		  
		  let kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
		  if (kor_check.test(nm.value)) {
			  alert("이름은 한글만 입력가능합니다.");
			  nm.value="";
			  nm.focus();
			  return false;
		  }

		  if (ad1.value == ""||ad2.value == ""||ad3.value == "") {
			    alert("주소를 입력하세요.");
			    ad1.value="";
			    ad2.value="";
			    ad3.value="";
			    ad1.focus();
			    return false;
			  };
			  
		  if (pn1.value == ""||pn2.value == ""||pn3.value == "") {
			    alert("전화번호를 입력하세요.");
			    pn1.value="";
			    pn2.value="";
			    pn3.value="";
			    pn1.focus();
			    return false;
			  };
		  
		  let reg = /^[0-9]+/g; //숫자만 입력하는 정규식
		  if (!reg.test(pn1.value)&&!reg.test(pn2.value)&&!reg.test(pn3.value)) {
		    alert("전화번호는 숫자만 입력할 수 있습니다.");
		    pn1.value="";
		    pn2.value="";
		    pn3.value="";
		    pn1.focus();
		    return false;
		  }
		  if (bd.value == "" || bd.value == null) {
			    alert("생년월일을 선택하세요");
			    return false;
			  };
		  
		
		 /* if (!agree.checked) { //체크박스 미체크시
		    alert("약관 동의를 체크하세요.");
		    agree.focus();
		    return false;
		  }*/
		
		  //입력 값 전송
		  document.signupForm.submit();
		  alert("가입완료");
		  //window.open("userInsertOutput.jsp", "signup", "width=400, height=350");
		}
		    	        
        

    	
        //전화번호 선택
        const phoneListEl = document.querySelector('#phone-list')
        const phoneInputEl = document.querySelector('#phone1')

        phoneListEl.addEventListener('change', (event) => {

            if (event.target.value !== "type2") {
                phoneInputEl.value = event.target.value
                //phoneInputEl.disabled = true
            } else { // 직접 입력 시
                phoneInputEl.value = ""
                //phoneInputEl.disabled = false
            }
        })


        //이메일 선택
        // 도메인 직접 입력 or domain option 선택
        const domainListEl = document.querySelector('#domain-list')
        const domainInputEl = document.querySelector('#domain-txt')
        // select 옵션 변경 시
        domainListEl.addEventListener('change', (event) => {
            // option에 있는 도메인 선택 시
            if (event.target.value !== "type") {
                // 선택한 도메인을 input에 입력하고 disabled
                domainInputEl.value = event.target.value
                //domainInputEl.disabled = true
            } else { // 직접 입력 시
                // input 내용 초기화 & 입력 가능하도록 변경
                domainInputEl.value = ""
                //domainInputEl.disabled = false
            }
        })

        //우편번호 주소 api
        
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data
                                .buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
    </script>

</body>

</html>