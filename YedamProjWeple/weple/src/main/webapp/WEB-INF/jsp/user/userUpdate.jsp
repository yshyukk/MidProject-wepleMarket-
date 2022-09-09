<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/userUpdate.css"
	rel="stylesheet">
<div id="signUp">
    <h1>회원정보 관리</h1>
    <ul id="signUpList">
        <li><label for="id">아이디</label>
           <input id="id" type="text" autofocus></li>
        <li><label for="pwd">비밀번호</label>
            <Input id="pwd" type="password" ></li>
        <li><label for="pwd2">비밀번호 확인</label>   
            <Input id="pwd2" type="password" ></li>
        <li><label for="id">이름</label>
            <input id="id" type="text"></li>        
        <li><label for="mail">이메일</label>
            <Input id="mail" type="email" placeholder="aksskd@naver.com"></li> 
        <li><label for="addr">주소</label>
            <Input id="addr" type="text"><input type="button" value="검색"></li>  
            <Input id="dAddr" type="text" ></li>
    </ul>
    <ul id="gender">
        <li><label for="gender">성별</label>
            남성<Input id="gender" type="radio"></li>
            여성<Input id="gender" type="radio"></li>
            없음<Input id="gender" type="radio"></li>
    </ul>            
    <ul id="buttons">            
        <li><input id="submit" type="submit" value="수정"></li>
        <li><input id="submit" type="submit" value="탈퇴"></li>                   
    </ul>
</div>