<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<section class="bg0 p-t-23 p-b-140" style="padding-top: 120px;">
		<div class="container">
			<div class="p-b-10">
				<h3 class="ltext-103 cl5" style="font-weight: 900; font-size: 26px; color: #444;">
					신상품
				</h3>
			</div>

			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						전체 상품
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".95739">
						과일
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".95740">
						채소
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".95498">
						쌀/잡곡/견과
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".95499">
						정육/계란류
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".95500">
						수산물/건해산
					</button>
					
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".95501">
						우유/유제품/유아식
					</button>
				</div>

				
			</div>

			<div class="row isotope-grid">
			
				<c:forEach var="prod" items="${newProdList }" begin="0" end="99">
					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${prod.catgLevel1 }" >
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src=${prod.imgUrl } alt="IMG-PRODUCT">
	
							</div>
	
							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="productDetail.do?prodId=${prod.prodId}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										${prod.prodName }
									</a>
	
									<span class="stext-105 cl3">
										${prod.prodPrice }원
									</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<script>
	 $(window).on("load", function () {
		    function fade() {
		      let animation_height = $(window).innerHeight() * 0.5;
		      let ratio = Math.round((1 / animation_height) * 10000) / 10000;
		      $(".fade").each(function () {
		        let objectTop = $(this).offset().top;
		        let windowBottom = $(window).scrollTop() + $(window).innerHeight();
		        if (objectTop < windowBottom) {
		          if (objectTop < windowBottom - animation_height) {
		            $(this).css({
		              transition: "opacity 0.1s linear",
		              transition: "left 0.1s linear",
		              opacity: 1,
		              left: "0px",
		            });
		          } else {
		            $(this).css({
		              transition: "opacity 0.5s linear",
		              opacity: (windowBottom - objectTop) * ratio,
		              transition: "left 0.5s linear",
		              left: `${200 * (1 - (windowBottom - objectTop) * ratio)}px`,
		            });
		          }
		        } else {
		          $(this).css({
		            opacity: 0,
		            left: "200px",
		          });
		        }
		      });
		    }
		    $(".fade").css({
		      opacity: 0,
		      left: "200px",
		    });
		    fade();

		    $(window).scroll(function () {
		      fade();
		    });
		  });
	</script>