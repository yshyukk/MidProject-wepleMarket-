<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<!-- Shoping Cart -->

<div class="wrap-table-shopping-cart">
	<table class="table-shopping-cart" id="cartTable">
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

		<tr class="table_row">
			<td class="column-1">
				<div class="how-itemcart1">
					<img src="images/item-cart-04.jpg" alt="IMG">
				</div>
			</td>
			<td class="column-2">Fresh Strawberries</td>
			<td class="column-3">$ 36.00</td>
			<td class="column-4">
				<div class="wrap-num-product flex-w m-l-auto m-r-0">
					<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
						<i class="fs-16 zmdi zmdi-minus"></i>
					</div>

					<input class="mtext-104 cl3 txt-center num-product" type="number"
						name="num-product1" value="5">

					<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
						<i class="fs-16 zmdi zmdi-plus"></i>
					</div>
				</div>
			</td>
			<td class="column-5">$ 36.00</td>
		</tr>

		<tr class="table_row">
			<td class="column-1">
				<div class="how-itemcart1">
					<img src="images/item-cart-05.jpg" alt="IMG">
				</div>
			</td>
			<td class="column-2">Lightweight Jacket</td>
			<td class="column-3">$ 16.00</td>
			<td class="column-4">
				<div class="wrap-num-product flex-w m-l-auto m-r-0">
					<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
						<i class="fs-16 zmdi zmdi-minus"></i>
					</div>

					<input class="mtext-104 cl3 txt-center num-product" type="number"
						name="num-product2" value="1">

					<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
						<i class="fs-16 zmdi zmdi-plus"></i>
					</div>
				</div>
			</td>
			<td class="column-5">$ 16.00</td>
		</tr>

		<tr>
			<th colspan="5" class="table_head"
				style="padding: 12px 50px; background: #222222; color: white;">일반구매</th>
		</tr>
		<tr class="table_head">
			<th class="column-1">상품</th>
			<th class="column-2"></th>
			<th class="column-3">개별가격</th>
			<th class="column-4">수량</th>
			<th class="column-5">금액</th>
		</tr>

		<tr class="table_row">
			<td class="column-1">
				<div class="how-itemcart1">
					<img src="images/item-cart-04.jpg" alt="IMG">
				</div>
			</td>
			<td class="column-2">Fresh Strawberries</td>
			<td class="column-3">$ 36.00</td>
			<td class="column-4">
				<div class="wrap-num-product flex-w m-l-auto m-r-0">
					<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
						<i class="fs-16 zmdi zmdi-minus"></i>
					</div>

					<input class="mtext-104 cl3 txt-center num-product" type="number"
						name="num-product1" value="1">

					<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
						<i class="fs-16 zmdi zmdi-plus"></i>
					</div>
				</div>
			</td>
			<td class="column-5">$ 36.00</td>
		</tr>

		<tr class="table_row">
			<td class="column-1">
				<div class="how-itemcart1">
					<a href="javascript:void(0)" class="abutton"
						onclick="javascript:basket.delItem();"><img
						src="images/item-cart-05.jpg" alt="IMG"></a>
				</div>
			</td>
			<td class="column-2">test중</td>
			<td class="column-3">$ 16.00</td>
			<td class="column-4">
				<div class="num">
					<div class="updown">
						<input type="text" name="p_num1" id="p_num1" size="2"
							maxlength="4" class="p_num" value="2"
							onkeyup="javascript:basket.changePNum(1);"> <span
							onclick="javascript:basket.changePNum(1);"> <i
							class="fas fa-arrow-alt-circle-up up"></i>
						</span> <span onclick="javascript:basket.changePNum(1);"> <i
							class="fas fa-arrow-alt-circle-down down"></i>
						</span>
					</div>
				</div>
			</td>
			<td class="column-5">$ 16.00</td>
		</tr>
		<tr>

			<th colspan="5" class="table_head" style="height: 25px;" style="border: none;">
				<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm" style="border: none;">

					<div class="flex-w flex-m m-r-20 m-tb-5">

						<div
							class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
							장바구니 비우기</div>
					</div>

					<div class="flex-w flex-m m-r-20 m-tb-5">

						<div
							class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
							수량 수정</div>
					</div>

					<div
						class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
						주문하기</div>
				</div>
			</th>
		</tr>
	</table>
</div>



<%-- <html>

  <head>
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
      integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css" />
    <script type="text/javascript" src="./10-11.js"></script>
  </head>
  <body>
  <div id="container">
    <form name="orderform" id="orderform" method="post" class="orderform" action="/Page">

        <input type="hidden" name="cmd" value="order">
        <div class="basketdiv" id="basket">

            <div class="row head">
                <div class="subdiv">
                    <div class="check">선택</div>
                    <div class="img">이미지</div>
                    <div class="pname">상품명</div>
                </div>
                <div class="subdiv">
                    <div class="basketprice">가격</div>
                    <div class="num">수량</div>
                    <div class="sum">합계</div>
                </div>
                <div class="subdiv">
                    <div class="basketcmd">삭제</div>
                </div>
                <div class="split"></div>
            </div>

            <div class="row data" data-id="0">
                <div class="subdiv">
                    <div class="check"><input type="checkbox" name="buy" value="260" checked="">&nbsp;</div>
                    <div class="img"><img src="./img/basket1.jpg" width="60"></div>
                    <div class="pname"> <span>찜마마(XJ-92214/3)</span> </div>
                </div>
                <div class="subdiv">
                    <div class="basketprice">
                        <input type="hidden" name="p_price" id="p_price1" class="p_price" value="20000">20,000원
                    </div>
                    <div class="num">
                        <div class="updown">
                            <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="2"
                                onkeyup="javascript:basket.changePNum(1);">
                            <span onclick="javascript:basket.changePNum(1);">
                                <i class="fas fa-arrow-alt-circle-up up"></i> </span>
                            <span onclick="javascript:basket.changePNum(1);">
                                <i class="fas fa-arrow-alt-circle-down down"></i> </span>
                        </div>
                    </div>
                    <div class="sum">40,000원</div>
                </div>
                <div class="subdiv">
                    <div class="basketcmd">
                        <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a>
                    </div>
                </div>
            </div>


        </div>

        <div class="right-align basketrowcmd">
            <a href="#" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
            <a href="#" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
        </div>

        <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: <span>4</span>개</div>
        <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: <span>74,200</span>원</div>

        <div id="goorder" class="">
            <div class="clear"></div>
            <div class="buttongroup center-align cmd">

                <a href="javascript:void(0);" onclick="orderDataSubmit()">선택한 상품 주문</a>

            </div>
        </div>
    </form>

    <div id="template" style="display: none;">
        <div class="row data">
            <div class="subdiv">
                <div class="check">
                    <input class="checkbox" type="checkbox" name="buy" value="260" checked="">&nbsp;
                </div>
                <div class="img"><img src="./img/basket1.jpg" width="60"></div>
                <div class="pname">
                    <span>찜마마(XJ-92214/3)</span>
                </div>
            </div>
            <div class="subdiv">
                <div class="basketprice">
                    <input type="hidden" name="p_price" id="p_price1" class="p_price" value="20000">20,000원</div>
                <div class="num">
                    <div class="updown">
                        <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="2"
                            onkeyup="javascript:basket.changePNum(1);">
                        <span onclick="javascript:basket.changePNum(1);">
                            <i class="fas fa-arrow-alt-circle-up up"></i></span>
                        <span onclick="javascript:basket.changePNum(1);">
                            <i class="fas fa-arrow-alt-circle-down down"></i></span>
                    </div>
                </div>
                <div class="sum">40,000원</div>
            </div>
            <div class="subdiv">
                <div class="basketcmd">
                    <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem(event);">삭제</a>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
  </div>
  </body>
</html> --%>
