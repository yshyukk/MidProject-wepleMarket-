<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<div class="wrap-table-shopping-cart">
	<table class="table-shopping-cart" id="cartTable">

		<!-- 공동구매 -->
		<tr>
			<th colspan="5" class="table_head"
				style="padding: 12px 50px; background: #222222; color: white;">공동구매</th>
		</tr>
		<tr class="table_head">
			<th class="column-1">상품</th>
			<th class="column-2"></th>
			<th class="column-3">개별가격</th>
			<th class="column-4">수량</th>
			<th class="column-5">금액</th>
		</tr>




	</table>
</div>
<script>
	
		/* 장바구니 리스트 불러오기 */
		showAllProd();

		function showAllProd() {
			$.ajax({
				url : "showAllProdInCart.do",
				type : "GET",
				dataType : 'json',
				success : function(req) {
					let table_html = '';
					
					for(let i = 0; i < req.length; i++) {
						if(req[i].isShare == 1){
							table_html = `<tr class="table_row">
												<td class="column-1">
												<div class="hidden" style="display: none;">`;
							table_html += req[i].prodId;
							table_html += `</div>
											<div class="hiddenIsShare" style="display: none;">1</div>
											<div class="how-itemcart1">
											<img src="`;
							table_html += req[i].imgUrl;			
							table_html += `" alt="IMG"></div></td>
											<td class="column-2" style="padding-right: 20px;">
											<a href="productDetail.do?prodId=`;
							table_html += req[i].prodId;
							table_html += `" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">`;
							table_html += req[i].prodName;
							table_html += `</a></td>
											<td class="column-3">`;
							table_html += req[i].prodPrice
							table_html += `원</td><td class="column-4">
												<div class="wrap-num-product flex-w m-l-auto m-r-0">
													<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
														<i class="fs-16 zmdi zmdi-minus"></i>
													</div>
				
													<input class="mtext-104 cl3 txt-center num-product" type="number"
														name="num-product1" value="`;
							table_html += req[i].prodAmount;
							table_html += `">
												<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
														<i class="fs-16 zmdi zmdi-plus"></i>
													</div>
												</div>
											</td>
											<td class="column-5">`;
							table_html += req[i].totalPrice;
							table_html += `원</td></tr>`;
							$('#cartTable').append(table_html);
						}
					};
					
					table_html = `<tr>
										<th colspan="5" class="table_head"
										style="padding: 12px 50px; background: #222222; color: white;">일반구매</th>
								</tr>
								<tr class="table_head">
									<th class="column-1">상품</th>
									<th class="column-2"></th>
									<th class="column-3">개별가격</th>
									<th class="column-4">수량</th>
									<th class="column-5">금액</th>
								</tr>`;
					$('#cartTable').append(table_html);
					
					for(let i = 0; i < req.length; i++) {
						if(req[i].isShare == 0){
							table_html = `<tr class="table_row">
												<td class="column-1">
												<div class="hidden" style="display: none;">`;
							table_html += req[i].prodId;
							table_html += `</div>
											<div class="hiddenIsShare" style="display: none;" >0</div>
											<div class="how-itemcart1">
												<img src="`;
							table_html += req[i].imgUrl;			
							table_html += `" alt="IMG"></div></td>
											<td class="column-2" style="padding-right: 20px;">
											<a href="productDetail.do?prodId=`;
							table_html += req[i].prodId;
							table_html += `" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">`;
							table_html += req[i].prodName;
							table_html += `</a></td>
											<td class="column-3">`;
							table_html += req[i].prodPrice
							table_html += `원</td><td class="column-4">
												<div class="wrap-num-product flex-w m-l-auto m-r-0">
													<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
														<i class="fs-16 zmdi zmdi-minus"></i>
													</div>
				
													<input class="mtext-104 cl3 txt-center num-product" type="number"
														name="num-product1" value="`;
							table_html += req[i].prodAmount;
							table_html += `">
												<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
														<i class="fs-16 zmdi zmdi-plus"></i>
													</div>
												</div>
											</td>
											<td class="column-5">`;
							table_html += req[i].totalPrice;
							table_html += `원</td></tr>`;
							$('#cartTable').append(table_html);
						}
					};
					
					table_html = `<tr>
									<th colspan="5" class="table_head" style="height: 25px;" style="border: none;">
										<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm" style="border: none;">
			
											<div class="flex-w flex-m m-r-20 m-tb-5">
			
												<div
													class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" id="cart-remove-all">
													장바구니 비우기</div>
											</div>
			
											<div class="flex-w flex-m m-r-20 m-tb-5">
			
												<div
													class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" id="cart-update-amount">
													수량 수정</div>
											</div>
			
											<div
												class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" id="cart-order">
												주문하기</div>
										</div>
									</th>
								</tr>`;
					$('#cartTable').append(table_html);
				},
				error : function(er) {
					console.log("실패 원인:" + er);
				}
			});
		}
		
		/* 삭제 버튼 */
		$(document).on("click", ".how-itemcart1", function(event) {
			var deleteBtn = $(event.target);
			var prodId = deleteBtn.parent().children(".hidden").text();
			var share = deleteBtn.parent().children(".hiddenIsShare").text();
			console.log(prodId);
			
			fetch('deleteCart.do', {
				method: 'post',
				headers: {'Content-type': 'application/x-www-form-urlencoded'},
				body: 'prodId='+prodId+'&isShare='+share

				})
				.then(result => result.text())
				.catch(err => console.log(err));
			
			deleteBtn.parent().parent().remove();
			
		})
		
		/* 수량 마이너스 버튼 */
		$(document).on("click", ".fs-16.zmdi.zmdi-minus", function(event) {
			var minusBtn = $(event.target);
			var amountBox = minusBtn.parent().parent().children(".mtext-104.cl3.txt-center.num-product");
			var amount = amountBox.val();
			var price = minusBtn.parent().parent().parent().parent().children(".column-3").text().replace("원","");
			var totalPriceBox = minusBtn.parent().parent().parent().parent().children(".column-5")
			if(amount>1) {
				amountBox.val(amount-1);
				totalPriceBox.text(((amount-1)*price)+"원");
			}
				
		})
		
		/* 수량 플러스 버튼 */
		$(document).on("click", ".fs-16.zmdi.zmdi-plus", function(event) {
			var plusBtn = $(event.target);
			var amountBox = plusBtn.parent().parent().children(".mtext-104.cl3.txt-center.num-product");
			var amount = Number(amountBox.val());
			var price = plusBtn.parent().parent().parent().parent().children(".column-3").text().replace("원","");
			var totalPriceBox = plusBtn.parent().parent().parent().parent().children(".column-5")
			amountBox.val(amount+1);
			totalPriceBox.text(((amount+1)*price)+"원");
		})
		
		
		/* 수량 수정 버튼 */
		${document}.on("click", "#cart-update-amount", function(event) {
			let list = $(".table_row");
			let typeList = $(".hiddenIsShare");
			let amount;
			let prodId;
			let isShare;
			for(let i=0; i < list.length; i++) {
				amount = $(".table_row:eq(" + i +")").children(".column-4").children(".wrap-num-product.flex-w.m-l-auto.m-r-0").children(".mtext-104.cl3.txt-center.num-product").val();;
				prodId = $(".table_row:eq(" + i +")").children(".column-1").children(".hidden").text();
				isShare = $(".hiddenIsShare:eq(" + i + ")").text();
				fetch('updateCart.do', {
						method: 'post',
						headers: {'Content-type': 'application/x-www-form-urlencoded'},
						body: 'prodAmount='+amount+'&prodId='+prodId+'&isShare='+isShare
					})
					.then(result => result.text())
					.catch(err => console.log(err))
			}
			
			
			
			swal({
				  title: "수량이 변경되었습니다.",
				  icon: "success",
				  button: "닫기",
				});
			
		})
		
		
		/* 장바구니 비우기 */
		${document}.on("click", "#cart-remove-all", function(event) {
			fetch('deleteAllCart.do', {
						method: 'post',
						headers: {'Content-type': 'application/x-www-form-urlencoded'},
						body: ''
					})
					.then(result => result.text())
					.catch(err => console.log(err))
			
			window.location.reload();
			
		})
		
		
		// 주문하기버튼 클릭시 payForm으로 이동 
		$(document).on("click", "#cart-order", function() {
			location.href = "showPayForm.do"
		})
			
	</script>