<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="p-b-10">
	<h3 class="ltext-103 cl5"
		style="font-weight: 900; font-size: 20px; margin: 10px; text-align: right; color: #444;">
		주문 내역 상세 정보</h3>
	<h3 class="ltext-103 cl5"
		style="font-weight: 900; font-size: 20px; margin: 10px; text-align: right; color: #444;">
		주문번호 : <%=request.getParameter("orderNum") %></h3>
</div>
<div class="wrap-table-shopping-cart">
	<table class="table-shopping-cart" id="cartTable">

		<!-- 공동구매 -->
		<tr>
			<th colspan="6" class="table_head"
				style="padding: 12px 50px; background: #222222; color: white;">공동구매</th>
		</tr>
		<tr class="table_head">
			<th style="padding-left: 20px;">상품</th>
			<th></th>
			<th style="text-align: center;">개별가격</th>
			<th style="text-align: center;">수량</th>
			<th style="text-align: center;">금액</th>
			<th style="text-align: center;">상태</th>
		</tr>
		<c:forEach var="item" items="${orderHisDetailList }">
			<c:if test="${item.isShare eq 1 }">
				<tr>
					<td style="padding: 10px; width: 100px;">
						<img src="${item.imgUrl }" alt="IMG" style="width: 60px;">
					</td>
					<td>
						<a href="productDetail.do?prodId=${item.prodId }" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							${item.prodName }
						</a>
					</td>
					<td style="text-align: center;">${item.prodPrice}원</td>
					<td style="text-align: center;">${item.buyAmount }개</td>
					<td style="text-align: center;">${item.totalPrice }원</td>
					<td style="text-align: center;">
						<c:choose>
							<c:when test="${item.isDelivery == 0 && item.isCompleted == 0 }">배송 준비 중</c:when>
							<c:when test="${item.isDelivery == 1 && item.isCompleted == 0 }">배송 중</c:when>
							<c:when test="${item.isDelivery == 0 && item.isCompleted == 1 && item.isReview == 0 }">
								<a class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"
									href="addReview.do?orderNum=<%=request.getParameter("orderNum") %>&prodId=${item.prodId }">리뷰 작성하기</a>
							</c:when>
							<c:otherwise>
								<a class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"
									href="myProdReview.do?orderNum=<%=request.getParameter("orderNum") %>&prodId=${item.prodId }">리뷰 작성완료</a>
							</c:otherwise>
						</c:choose>
					</td>
					<!--  /reviewForm.jsp(tile로경로설정) -->
				</tr>
			</c:if>
		</c:forEach>
		
		
		<!-- 일반구매 -->
		<tr>
			<th colspan="6" class="table_head"
				style="padding: 12px 50px; background: #222222; color: white;">일반구매</th>
		</tr>
		<tr class="table_head">
			<th style="padding-left: 20px;">상품</th>
			<th></th>
			<th style="text-align: center;">개별가격</th>
			<th style="text-align: center;">수량</th>
			<th style="text-align: center;">금액</th>
			<th style="text-align: center;">상태</th>
		</tr>
		<c:forEach var="item" items="${orderHisDetailList }">
			<c:if test="${item.isShare eq 0 }">
				<tr>
					<td style="padding: 10px; width: 100px;">
						<img src="${item.imgUrl }" alt="IMG" style="width: 60px;">
					</td>
					<td>
						<a href="productDetail.do?prodId=${item.prodId }" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							${item.prodName }
						</a>
					</td>
					<td style="text-align: center;">${item.prodPrice}원</td>
					<td style="text-align: center;">${item.buyAmount }개</td>
					<td style="text-align: center;">${item.totalPrice }원</td>
					<td style="text-align: center;">
						<c:choose>
							<c:when test="${item.isDelivery == 0 && item.isCompleted == 0 }">배송 준비 중</c:when>
							<c:when test="${item.isDelivery == 1 && item.isCompleted == 0 }">배송 중</c:when>
							<c:when test="${item.isDelivery == 0 && item.isCompleted == 1 && item.isReview == 0 }">
								<a class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"
									href="addReview.do?orderNum=<%=request.getParameter("orderNum") %>&prodId=${item.prodId }">리뷰 작성하기</a>
							</c:when>
							<c:otherwise>
								<a class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"
									href="myProdReview.do?orderNum=<%=request.getParameter("orderNum") %>&prodId=${item.prodId }">리뷰 작성완료</a>
							</c:otherwise>
						</c:choose>
					</td>
					<!--  /reviewForm.jsp(tile로경로설정) -->
				</tr>
			</c:if>
		</c:forEach>



	</table>
</div>


