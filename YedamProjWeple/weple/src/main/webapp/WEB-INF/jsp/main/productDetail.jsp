<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>



<!-- Product Detail -->
<section class="sec-product-detail bg0 p-t-65 p-b-60">
	<div class="container" style="margin-top: 60px;">
		<div class="row">
			<div class="col-md-6 col-lg-7 p-b-30">
				<div class="p-l-25 p-r-30 p-lr-0-lg">
					<div class="wrap-pic-w pos-relative">
						<img src="${prodVO.imgUrl}" alt="IMG-PRODUCT">
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-5 p-b-30">
				<div class="p-r-50 p-t-5 p-lr-0-lg">
					<h4 class="mtext-105 cl2 js-name-detail p-b-14"
						style="margin-top: 60px;">${prodVO.prodName }</h4>

					<span class="mtext-106 cl2"> ${prodVO.prodPrice }원 </span>



					<!--  -->
					<div class="p-t-33">
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">배송비</div>
							<div class="size-204 respon6-next">
								<c:choose>

									<c:when test="${userVO.grade == 1 }">3500원</c:when>
									<c:when test="${userVO.grade == 2 }">1800원</c:when>
									<c:when test="${userVO.grade == 3 }">0원</c:when>

									<c:otherwise>멤버십 차등</c:otherwise>
								</c:choose>

							</div>
						</div>
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">중량</div>
							<div class="size-204 respon6-next">${prodVO.weight/1000 }kg
							</div>
						</div>
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">발주처</div>
							<div class="size-204 respon6-next">위플</div>
						</div>
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">판매지역</div>
							<div class="size-204 respon6-next">${regions }</div>
						</div>
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">
								공동구매 <br>혜택가
							</div>
							<div class="size-204 respon6-next">
								${Math.round(prodVO.prodPrice * 0.8)}원</div>
						</div>
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">구매수량</div>
							<div class="size-204 respon6-next">
								<div class="wrap-num-product flex-w m-r-20 m-tb-10">
									<div
										class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-minus"></i>
									</div>

									<input class="mtext-104 cl3 txt-center num-product"
										type="number" name="num-product" value="1">

									<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-plus"></i>
									</div>
								</div>
							</div>
						</div>
						<table>
							<tr>
								<c:choose>
								<c:when test="${userId == undefined }">
								
								
									<td style="padding-right: 30px;">
										<c:if test="${prodVO.isShare == 1 }">
										<button
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
											onclick="addCart(3)">
											공동구매</button>
										</c:if>
									</td>
									<td>
										<button
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
											onclick="addCart(3)">
											일반구매</button>
									</td>
								</c:when>
								<c:otherwise>
									<td style="padding-right: 30px;">
										<c:if test="${prodVO.isShare == 1 }">
											<c:choose>
												<c:when test="${prodVO.participatePeople ge prodVO.sharePeople }">
													<button
														class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
														onclick="addCart(4)">
														공동구매</button>
												</c:when>
												<c:otherwise>
													<button
													class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
													onclick="addCart(1)">
													공동구매</button>
												</c:otherwise>
											</c:choose>
										</c:if>
									</td>
									<td>
										<button
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
											onclick="addCart(0)">
											일반구매</button>
									</td>
								</c:otherwise>
								</c:choose>
							</tr>
						</table>

					</div>

				</div>
			</div>
		</div>

		<div class="bor10 m-t-50 p-t-43 p-b-40">
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item p-b-10"><a class="nav-link active"
						data-toggle="tab" href="#description" role="tab">상세설명</a></li>

					<li class="nav-item p-b-10"><a class="nav-link"
						data-toggle="tab" href="#reviews" role="tab">리뷰
							(${fn:length(reviewList) })</a></li>
					
					<li class="nav-item p-b-10"><a class="nav-link"
						data-toggle="tab" href="#qna" role="tab">문의
							(${fn:length(qnaList) })</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content p-t-43">
					<!-- - -->
					<div class="tab-pane fade show active" id="description"
						role="tabpanel">
						<div class="how-pos2 p-lr-15-md">
							<p class="stext-102 cl6">Aenean sit amet gravida nisi. Nam
								fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in
								blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit
								lectus interdum. Morbi elementum sapien rhoncus pretium maximus.
								Nulla lectus enim, cursus et elementum sed, sodales vitae eros.
								Ut ex quam, porta consequat interdum in, faucibus eu velit.
								Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit
								amet orci nec iaculis. Cras sit amet nulla libero. Curabitur
								dignissim, nunc nec laoreet consequat, purus nunc porta lacus,
								vel efficitur tellus augue in ipsum. Cras in arcu sed metus
								rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</p>
						</div>
					</div>



					<!-- - -->
					<div class="tab-pane fade" id="reviews" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<div class="p-b-30 m-lr-15-sm">
									<!-- Review -->
									<div class="flex-w flex-t p-b-68">
										<div class="size-400">
											<hr>
											<br>
											<c:choose>
												<c:when test="${fn:length(reviewList) > 0 }">
													<c:forEach var="prodReview" items="${reviewList }">
														<span class="mtext-107 cl2 p-r-20">
															<c:if test="${prodReview.cnt > 0 }">
																<c:forEach var="star" items="1,2,3,4,5" begin="0" end="${prodReview.cnt - 1 }">
																	⭐
																</c:forEach>
															</c:if>
														</span>
														<div class="flex-w flex-sb-m p-b-17">
															<span class="mtext-107 cl2 p-r-20">
																${prodReview.writer } </span> <span class="mtext-107 cl2 p-r-20">
																${prodReview.writeDate } </span>
														</div>

														<p class="stext-102 cl6">${prodReview.boardContent }</p>
														<br>
														<hr>
														<br>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<p class="stext-102 cl6">등록된 리뷰가 없습니다.</p>
												</c:otherwise>
											</c:choose>
										</div>
									</div>

									<!-- Add review -->



								</div>
							</div>
						</div>
					</div>
					
					<div class="tab-pane fade" id="qna" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<div class="p-b-30 m-lr-15-sm">
									<!-- 문의하기 폼 -->
									<div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" id="cart-order"
										 onclick="open_box('${userId}')">
										문의하기</div>
									<div method="post" style="padding-top: 30px; display: none;" id="qnaFrm">
										<div class="bor8 m-b-20 how-pos4-parent">
											<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="title" placeholder="제목을 입력하세요">
											<img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
										</div>
				
										<div class="bor8 m-b-30">
											<textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="boardContent"
														placeholder="한 번 작성하신 후기는 등록하신 후기는 수정이 불가하니 신중하게 작성해주시기 바랍니다. 사실과 관계없는 단순 비방성 내용은 신고합니다."></textarea>
										</div>
										
										<table>
										<tr>
										<td style="padding-right: 40px;">
										<button class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer"
												value="닫기" onclick = "close_box()" type="button">
											닫기
										</button>
										</td>
										<td>
										<button class="flex-c-m stext-101 cl2 size-119 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer"
												value="등록" style="color: white;" type="button" onclick="qnaInsert()">
											등록
										</button>
										</td>
										</tr>
										</table>
									</div>
									<!-- 문의 리스트 -->
									<div class="flex-w flex-t p-b-68">
										<div class="size-400">
											<hr>
											<br id="inputQna">
											<c:choose>
												<c:when test="${fn:length(qnaList) > 0 }">
													<c:forEach var="qna" items="${qnaList }">
													 	<div class="flex-w flex-sb-m p-b-17">
															<span class="mtext-107 cl2 p-r-20">
																${qna.writer } </span> 
															<span class="mtext-107 cl2 p-r-20">
																${qna.writeDate } </span>
														</div>
	
														<p class="stext-102 cl6">${qna.title }</p>
														<p class="stext-102 cl6">${qna.boardContent }</p>
														<c:if test="${qna.isHandled == 1 }">
															<p class="stext-102 cl6" style="padding-top: 20px; color: #6c7ae0;">↳답변 : ${qna.repsComment }</p>
														</c:if>
														<br>
														<hr>
														<br>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<div id="noQna">문의 내역이 없습니다.</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>

									<!-- Add review -->



								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</section>


<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/productDetail.js"></script>