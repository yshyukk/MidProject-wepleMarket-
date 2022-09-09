<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<section class="bg0 p-t-23 p-b-140" style="padding-top: 120px;">
	<div class="container">
		<div class="p-t-65">
			<h3 class="mtext-112 cl2 p-b-33" style="font-weight: 900; font-size: 26px; color: #444;">
					실시간 상품 후기
			</h3>

			<ul>
				<c:forEach var="rv" items="${realTimePagingList }">
					<li class="flex-w flex-t p-b-30">
						<a href="productDetail.do?prodId=${rv.prodId}" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
							<img src=${rv.imgUrl } alt="PRODUCT" style="width: 90px;">
						</a>
	
						<div class="size-215 flex-col-t p-t-8" style="width: 400px;">
							<a href="productDetail.do?prodId=${rv.prodId}" class="stext-116 cl8 hov-cl1 trans-04">
								${rv.prodName }
							</a>
	
							<span class="stext-116 cl6 p-t-20">
								${rv.prodPrice }원
							</span>
						</div>
						
						<div class="bor16 p-l-29 p-b-9 m-t-22" style="margin-top: 0;">
							<p class="stext-114 cl6 p-r-40 p-b-11">
								<c:if test="${rv.cnt > 0 }">
									<c:forEach var="star" items="1,2,3,4,5" begin="0" end="${rv.cnt - 1 }">
										⭐
									</c:forEach>
								
								</c:if>
							</p>
							<span>
								${rv.boardContent }
							</span>
							<p class="stext-114 cl6 p-r-40 p-b-11">
								${rv.writer }   &nbsp; &nbsp;
								<span class="stext-111 cl8">
									- ${rv.writeDate }
								</span>
							</p>
							
						</div>
					</li>
				</c:forEach>	
			</ul>
		</div>
		<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
			<c:if test="${pageInfo.prev }">
				<a class="flex-c-m how-pagination1 trans-04 m-all-7"
					href="realTimeReview.do?pageNum=${pageInfo.startPage - 1 }&amount=${pageInfo.cri.amount}">prev</a>
			</c:if>
			<c:forEach var="num" begin="${pageInfo.startPage }"
				end="${pageInfo.endPage }">
				<a class="flex-c-m how-pagination1 trans-04 m-all-7"
					href="realTimeReview.do?pageNum=${num}&amount=${pageInfo.cri.amount}">${num }</a>
			</c:forEach>
			<c:if test="${pageInfo.next }">
				<a class="flex-c-m how-pagination1 trans-04 m-all-7"
					href="realTimeReview.do?pageNum=${pageInfo.endPage + 1 }&amount=${pageInfo.cri.amount}">next</a>
			</c:if>
		</div>
	</div>
</section>