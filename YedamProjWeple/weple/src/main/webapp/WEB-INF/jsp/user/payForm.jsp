<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="orderInfo">
	<form action="insertOrder.do" role="form" method="post"
		autocomplete="off" id="insertOrder">
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
			<c:forEach var="cartList" items="${cartList }">
				<c:if test="${cartList.isShare == 1}">
					<tr class="table_row">
						<td class="column-1">
							<div class="hidden" style="display: none;">${cartList.prodId }</div>
							<div class="hiddenIsShare" style="display: none;">1</div> <img
							src="${cartList.imgUrl }" alt="IMG" style="width: 60px;">
						</td>
						<td class="column-2" style="padding-right: 20px;"><a
							class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
								${cartList.prodName }</a></td>
						<td class="column-3">${cartList.prodPrice }원</td>
						<td class="column-4">${cartList.buyAmount }</td>
						<td class="column-5">${cartList.totalPrice }원</td>
					</tr>
				</c:if>
			</c:forEach>
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
			<c:forEach var="cartList" items="${cartList }">
				<c:if test="${cartList.isShare == 0}">
					<tr class="table_row">
						<td class="column-1">
							<div class="hidden" style="display: none;">${cartList.prodId }</div>
							<div class="hiddenIsShare" style="display: none;">0</div>
							<div class="how-itemcart1">
								<img src="${cartList.imgUrl }" alt="IMG" style="width: 60px;">
							</div>
						</td>
						<td class="column-2" style="padding-right: 20px;">${cartList.prodName }</td>
						<td class="column-3">${cartList.prodPrice }원</td>
						<td class="column-4">${cartList.buyAmount }</td>
						<td class="column-5">${cartList.totalPrice }원</td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<th colspan="5" class="table_head"
					style="padding: 12px 50px; background: #222222; color: white;">결제
					정보</th>
			</tr>
			<tr class="table_head">
				<td class="column-1" style="padding: 15px; padding-left: 50px;">총
					구매 품목 :</td>
				<td class="column-1" style="padding: 15px;">${totalProdAmount }개</td>
			</tr>
			<tr class="table_head">
				<td class="column-1" style="padding: 15px; padding-left: 50px;">총
					구매 수량 :</td>
				<td class="column-1" style="padding: 15px;">${totalBuyAmount }개</td>
			</tr>
			<tr class="table_head">
				<td class="column-1"
					style="padding: 15px; padding-left: 50px; font-weight: bold;">총
					주문 금액 :</td>
				<td class="column-1" style="padding: 15px; font-weight: bold;">${totalPrice }원</td>
			</tr>
			<tr class="table_head">
				<td class="column-1"
					style="padding: 15px; padding-left: 50px; font-weight: bold;">(+)
					배송비 :</td>
				<td class="column-1" style="padding: 15px; font-weight: bold;">
					<c:choose>
						<c:when test="${userVO.grade == 1 }">3500원</c:when>
						<c:when test="${userVO.grade == 2 }">1800원</c:when>
						<c:when test="${userVO.grade == 3 }">0원</c:when>
						<c:otherwise>3500원</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr class="table_head">
				<td class="column-1"
					style="padding: 15px; padding-left: 50px; font-weight: bold;">(=)
					결제 금액 :</td>
				<td class="column-1" style="padding: 15px; font-weight: bold;">
					<c:choose>
						<c:when test="${userVO.grade == 1 }">${totalPrice + 3500 }원</c:when>
						<c:when test="${userVO.grade == 2 }">${totalPrice + 1800 }원</c:when>
						<c:when test="${userVO.grade == 3 }">${totalPrice }원</c:when>
						<c:otherwise>${totalPrice + 3500 }원</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr class="table_head">
				<td class="column-1" style="padding: 15px; padding-left: 50px;">결제
					방법</td>
				<td style="padding: 15px;"><input type="radio" name="orderInfo"
					value="noBankbook" /> 무통장입금</td>
				<td style="padding: 15px;"><input type="radio" name="orderInfo"
					value="creditCard" /> 카드결제</td>
			</tr>

			<tr>
				<th colspan="5" class="table_head"
					style="padding: 12px 50px; background: #222222; color: white;">배송
					정보</th>
			</tr>
			<tr class="table_head">
				<td class="column-1" style="padding: 15px; padding-left: 50px;">
					<input type="radio" name="addr" value="default" checked>기본배송지
				</td>
				<td class="column-1" style="padding: 15px;"><input type="radio"
					name="addr" value="newAddr">직접입력</td>
			</tr>
			<tr class="table_head">
				<td class="column-1" style="padding: 15px; padding-left: 50px;">우편번호</td>
				<td class="column-1" style="padding: 15px;"><input type="text"
					name="zipCode" id="zipCode" required="required" /></td>
				<td class="column-1" style="padding: 15px;" id="searchAddr">
					<input type="button"
						onclick="execDaumPostcode()" value="주소찾기"></td>
			</tr>
			<tr class="table_head">
				<td class="column-1" style="padding: 15px; padding-left: 50px;">주소</td>
				<td class="column-1" style="padding: 15px;"><input type="text"
					name="addr" id="addr" required="required" /></td>
			</tr>
			<tr class="table_head">
				<td class="column-1" style="padding: 15px; padding-left: 50px;">상세주소</td>
				<td class="column-1" style="padding: 15px;"><input type="text"
					name="addrDetail" id="addrDetail" required="required" /></td>
			</tr>
			<tr class="table_head">
				<td class="column-1" style="padding: 15px; padding-left: 50px;">번지
					정보</td>
				<td class="column-1" style="padding: 15px;"><input type="text"
					name="addr2" id="addr2" required="required" /></td>
			</tr>
			<tr class="table-head">
				<th class="column-1" colspan="2">
					<button type="submit"
						class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10"
						id="cart-order">결제하기</button>
				</th>
			</tr>

		</table>
	</form>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	writeAddr();
	
	// 기본배송지 onclick시 배송지 데이터 ajax로 받아오고(fetch then)쓰자
	// 받아온 배송지 정보 가공해서 value로 집어넣고 출력물을 보자
	
	// controller
	
	function writeAddr() {
		let ck = $('input:radio[name=addr]:checked').val();
		console.log(ck);
		if(ck=='default') {
			$('#searchAddr').attr('style', "display:none;");
			fetch('showDefaultAddr.do', {
				method: 'post',
				hearders : {'Content-type': 'application/x-www-form-urlencoded'},
				body: ''
			})
			.then(result => result.json())
			.then(result => {
				console.log(result);
				$("#zipCode").val(result.zipCode);
				$("#zipCode").attr('readonly', true);
				$("#addr").val(result.addr);
				$("#addr").attr('readonly', true);
				$("#addr2").val(result.addr2);
				$("#addr2").attr('readonly', true);
				$("#addrDetail").val(result.addrDetail);
				$("#addrDetail").attr('readonly', true);
			})
			.catch(err => console.log(err))
		} else {
			$('#searchAddr').attr('style', "display:;");
			$("#zipCode").val('');
			$("#zipCode").attr('readonly', false);
			$("#addr").val('');
			$("#addr").attr('readonly', false);
			$("#addr2").val('');
			$("#addr2").attr('readonly', false);
			$("#addrDetail").val('');
			$("#addrDetail").attr('readonly', false);
			
		}
		
	}
	
	$("input[name='addr']").change(writeAddr);
	
	
	
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
                    document.getElementById("addr2").value = extraAddr;

                } else {
                    document.getElementById("addr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addrDetail").focus();
            }
        }).open();
    }
	
	$('#cart-order').click(function(){
		if($('input:radio[name=orderInfo]:checked').val() == undefined) {
			swal({
				  title: "결제방법을 입력하세요.",
				  icon: "info",
				  button: "닫기",
				});
			return false;
		} else if($("#zipCode").val() == '') {
			swal({
				  title: "정확한 주소를 입력하세요.",
				  icon: "info",
				  button: "닫기",
				});
			return false;
		} else if($("#addr").val() == '') {
			swal({
				  title: "정확한 주소를 입력하세요.",
				  icon: "info",
				  button: "닫기",
				});
			return false;
		} else if($("#addrDetail").val() == '') {
			swal({
				  title: "정확한 주소를 입력하세요.",
				  icon: "info",
				  button: "닫기",
				});
			return false;
		} else {
			$( '#insertOrder' ).submit();
		}
	});
</script>
