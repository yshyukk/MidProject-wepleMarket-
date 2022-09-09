<%@page import="com.dev.dao.UserDAO"%>
<%@page import="com.dev.service.user.UserService"%>
<%@page import="com.dev.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
// 세션값 제어
String id = (String) session.getAttribute("userId");

if (id == null) {
	response.sendRedirect("login.jsp");
}

// 해당 회원의 모든정보를 가져와서 화면에 출력

UserDAO mdao = new UserDAO();
UserService service = UserService.getInstance();
User userVO = service.getUserInfo(id);
%>
<div class="p-t-40">
	<h5 class="mtext-113 cl2 p-b-12" style="font-weight: bold;">내 정보
		수정</h5>

	<p class="stext-107 cl6 p-b-40">소중한 내 정보를 최신으로 관리하세요.</p>
<form action="userInfoUpdate.do" id="updateForm" name="updateForm">
	<table style="border: 1px;" class="table-shopping-cart">
		<tr>
			<td style="padding: 20px;">
				아이디
			</td>
			<td style="padding: 20px;">
				<input class="input" type="text" name="id" id="id"
				placeholder="User ID" value="<%=userVO.getUserId()%>"
				style="border: none" readonly>
			</td>
		</tr>
			
		<tr>
			<td style="padding: 20px;">
				비밀번호
			</td>
			<td style="padding: 20px;">
				<input
				class="input" type="password" name="password" id="password"
				placeholder="Password">
			</td>
		</tr>
		
		<tr>
			<td style="padding: 20px;">
				비밀번호 확인
			</td>
			<td style="padding: 20px;">
				<input class="input"
				type="password" name="passwordCheck" id="passwordCheck"
				placeholder="Password Check">
			</td>
		</tr>
		
		<tr>
			<td style="padding: 20px;">
				이메일
			</td>
			<td style="padding: 20px;">
				<input
				id="email-id" type="text" name="mail1"
				value="<%=userVO.getEmail1()%>">
			</td>
			<td style="padding: 20px;">
				@
			</td>
			<td style="padding: 20px;">
				<input id="domain-txt"
				type="text" name="mail2" value="<%=userVO.getEmail2()%>" >
				
			</td>
			<td style="padding: 20px;">
				<select
					id="domain-list" name="domain-list">
					<option value="type">-select-</option>
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="kakao.com">kakao.com</option>
					<option value="type">직접 입력</option>
				</select>
			</td>
			<td style="padding: 20px;">
				<input type="button" value="중복체크" onclick="mailCheck()">
			</td>
		</tr>
		
		<tr>
			<td style="padding: 20px;">
				이름
			</td>
			<td style="padding: 20px;">
				<input class="input" type="text" name="name" placeholder="Name"
				id="name" value="<%=userVO.getUserName()%>">
			</td>
		</tr>
		
		<tr>
			<td style="padding: 20px;">
				주소
			</td>
			<td style="padding: 20px;">
				<div class="adr">
					<input type="text" id="postcode" placeholder="우편번호" name="post"
						value="<%=userVO.getZipCode()%>"> <input type="button"
						onclick="execDaumPostcode()" value="우편번호 찾기"><br> <input
						type="text" id="address" placeholder="주소" name="address1"
						value="<%=userVO.getAddr()%>"><br> <input type="text"
						id="detailAddress" placeholder="상세주소" name="address2"
						value="<%=userVO.getAddr2()%>"> <input type="text"
						id="extraAddress" placeholder="참고주소" name="address3"
						value="<%=userVO.getAddrDetail()%>">
				</div>
			</td>
		</tr>
		
		<tr>
			<td style="padding: 20px;">
				전화번호
			</td>
			<td style="padding: 20px;">
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
			</td>
			<td style="padding: 20px;">
				<input id="phone1" type="text" name="pnum1"
				value="<%=userVO.getPhone1()%>" />
			</td>
			<td style="padding: 20px;">
				<input id="phone2" type="text"
				name="pnum2" value="<%=userVO.getPhone2()%>" />
			</td>
			<td style="padding: 20px;">
				<input id="phone3"
				type="text" name="pnum3" value="<%=userVO.getPhone3()%>" />
			</td>
			<td style="padding: 20px;">
				 <input
				type="button" value="중복체크" onclick="phoneCheck()">
			</td>
		</tr>
		<tr>
			<td style="padding: 20px;">
				생년월일
			</td>
			<td style="padding: 20px;">
				<input class="input" type="date" name="birth" id="bday"
				value="<%=userVO.getBirth()%>">
			</td>
		</tr>
		
		<tr>
			<td style="padding: 20px;">
				성별
			</td>
			<td style="padding: 20px;">
				<input
				class="gender" name="gender" value="<%=userVO.getGender()%>"
				style="border: none" readonly>
			</td>
		</tr>
		<tr>
			<td style="padding: 20px;">
				<button class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04 button"
				onclick="updateCheck()">
									수정하기
								</button>
			</td>
		</tr>
	</table>
</form>
</div>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
        //아이디 중복체크 새창
        function idCheck(){
		  window.open("<%=request.getContextPath()%>/user/idCheckForm.jsp", "idwin", "width=400, height=350");
		}
        
        //메일 중복체크 새창
        function mailCheck(){
        	window.open("<%=request.getContextPath()%>/user/mailCheckForm.jsp", "mlwin", "width=400, height=350");
  		}
        
        //전화 중복체크 새창
        function phoneCheck(){
        	window.open("<%=request.getContextPath()%>/user/phoneCheckForm.jsp", "phwin", "width=400, height=350");
  		}
        
	
    	/////유효성 검사//////
    	function updateCheck() {
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
		  //location.href="userInfoUpdate.do";
		  updateForm.submit();
		  alert("수정완료");
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