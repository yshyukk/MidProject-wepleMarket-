<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- Slider -->
<section class="section-slide">
	<div class="wrap-slick1">
		<div class="slick1">
			<div class="item-slick1"
				style="background-image: url(https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/b86a57fb-17cd-4382-af97-5df899b9bf37.jpg); height: 370px;">
				<div class="container h-full"></div>
			</div>

			<div class="item-slick1"
				style="background-image: url(https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/83d193dd-9275-4c12-8fb8-8970b3e383d1.jpg); height: 370px;">
				<div class="container h-full"></div>
			</div>

			<div class="item-slick1"
				style="background-image: url(https://product-image.kurly.com/cdn-cgi/image/format=auto/banner/main/pc/img/18c44233-92b0-4f4c-920c-170bf0fbb329.jpg); height: 370px;">
				<div class="container h-full"></div>
			</div>
		</div>
	</div>
</section>


<!-- Banner -->
<div class="sec-banner bg0 p-t-80 p-b-50">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5"
				style="font-weight: 900; font-size: 26px; margin-bottom: 10px;">
				공동구매 마감임박</h3>
		</div>
		<div class="row">


			<c:forEach var="shareItem" items="${shareProdList }" begin="0"
				end="2">
				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<div class="block1 wrap-pic-w">
						<img src=${shareItem.imgUrl } alt="IMG-BANNER"
							style="padding-top: 140px;"> <a
							href="productDetail.do?prodId=${shareItem.prodId}"
							class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-info stext-102 trans-04">
								<c:forEach var="star" begin="1" end="${shareItem.star }">
									<img src="${pageContext.request.contextPath}/img/icon-basket-active.png"
									style="width: 19px;">
								</c:forEach>
								<c:forEach var="star" begin="${shareItem.star + 1 }" end="5">
									<img src="${pageContext.request.contextPath}/img/icon-basket-none.png"
									style="width: 19px;">
								</c:forEach>
								</span>
								<span class="block1-name ltext-102 trans-04 p-b-8"
									style="font-size: 18px; line-height: 28px;">
									<c:choose>
										<c:when test="${fn: length(shareItem.prodName) gt 20 }">
											<c:out value="${fn:substring(shareItem.prodName, 0, 19)}"></c:out>...
										</c:when>
										<c:otherwise>
											${shareItem.prodName } 
										</c:otherwise>
									</c:choose>
									
								</span> 
								<span class="block1-info stext-102 trans-04">
									${shareItem.prodPrice }원 
								</span>	
							</div>
							

						</a>
					</div>
				</div>
			</c:forEach>

			<c:if test="${fn:length(reviewList) } < 3">
				<c:forEach var="item" items="1,2,3" begin="0"
					end="${2 - fn:length(reviewList) }">
					<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
						<div class="block1 wrap-pic-w" style="height: 248px;">
							<div
								style="text-align: center; display: block; margin: 0 auto; height: 248px; line-height: 248px;">
								<img src="${pageContext.request.contextPath}/images/pngegg.png"
									alt="IMG-BANNER" style="width: 30%;">
							</div>

							<div class="block1-txt-child1 flex-col-l">
								<span style="text-align: center; margin: 0 auto;">진행 중인
									상품이 없습니다.</span>
							</div>


						</div>
					</div>
				</c:forEach>
			</c:if>
			<!-- Block1 -->

		</div>


	</div>
</div>


<!-- Product -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5" style="font-weight: 900; font-size: 26px;">
				상품 미리보기</h3>
		</div>

		<div class="flex-w flex-sb-m p-b-52">
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				<button
					class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1"
					data-filter="*">전체 상품</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
					data-filter=".95739">과일</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
					data-filter=".95740">채소</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
					data-filter=".95498">쌀/잡곡/견과</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
					data-filter=".95499">정육/계란류</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
					data-filter=".95500">수산물/건해산</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
					data-filter=".95501">우유/유제품/유아식</button>
			</div>


		</div>

		<div class="row isotope-grid">

			<c:forEach var="prod" items="${randomProdList }">
				<div
					class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${prod.catgLevel1 }">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src=${prod.imgUrl } alt="IMG-PRODUCT">

						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="productDetail.do?prodId=${prod.prodId}"
									class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									${prod.prodName } </a> <span class="stext-105 cl3">
									${prod.prodPrice }원 </span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/catgDisp.js"></script>