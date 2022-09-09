<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



	<h4 class="mtext-112 cl2 p-b-10">${userId }님, <br>안녕하세요!</h4>
	<h4 class="mtext-50 cl2 p-b-40" style="font-size: 16px;">회원등급 : 
	<c:choose>
		<c:when test="${userVO.grade == 1 }">🌱새싹</c:when>
		<c:when test="${userVO.grade == 2 }">🍀네잎클로버</c:when>
		<c:when test="${userVO.grade == 3 }">🌳나무</c:when>
		<c:otherwise>🍏사과</c:otherwise>
	</c:choose> </h4>

	<ul>
		<li class="bor18"><a href="orderHistoryMain.do?pageNum=1&amount=10"
			class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
				주문내역 </a></li>

		<li class="bor18"><a href="addressUpdateForm.do"
			class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
				배송지 관리 </a></li>

		<li class="bor18"><a href="jjim.do?pageNum=1&amount=10"
			class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
				찜한 상품 </a></li>
		<li class="bor18"><a href="cart.do"
			class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
				장바구니 </a></li>
				
		<li class="bor18"><a href="myQnaListPaging.do?pageNum=1&amount=10"
			class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
				상품 문의 </a></li>
		
		<li class="bor18"><a href="myListPaging.do?pageNum=1&amount=10"
			class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
				마이 리뷰 </a></li>

		<li class="bor18"><a href="userInfoUpdateForm.do"
			class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
				회원정보 수정 </a></li>
				
		<li class="bor18"><a href="userDeleteForm.do"
			class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
				회원탈퇴 </a></li>
				
			
	</ul>


