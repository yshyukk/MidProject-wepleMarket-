<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!--jQuery 불러오기-->
</head>
<body>
	<h3>장바구니</h3>
	<table border="1">
		<thead>
			<tr>
				<th>상품이름</th>
				<th>공동구매</th>
				<th>수량</th>
				<th>총 가격</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<script>
$(function() {

    showOneProd();
    
    var oneProd;
    
  	$.fn.showOneProd() {
        $.ajax({
            url: "../showOneProdInCart.do",
            type: "GET",
            dataType: 'json',
            success: function(req) {
            	var table;
				for (let i = 0; i < req.length; i++) {
					var allTotal;
					if(req[i].isShare == 1) {
						table = "<tr>";
						table += "<td>" + req[i].prodName + "</td>";
						table += "<input type='hidden' id='hidden' value='" + req[i].prodId + "'>";
						table += "<td><input class='prodAmount' type='number' value='" + req[i].prodAmount + "'></td>";
						table += "<td>" + req[i].totalPrice + "</td>";
						table += "<td><input class='deleteBtn' type='button'>삭제</td>";
						table += "</tr>";
						$('#buyShare').append(table);
					}
					else {
						table = "<tr>";
						table += "<td>" + req[i].prodName + "</td>";
						table += "<input type='hidden' id='hidden' value='" + req[i].prodId + "'>";
						table += "<td><input class='prodAmount' type='number' value='" + req[i].prodAmount + "'></td>";
						table += "<td>" + req[i].totalPrice + "</td>";
						table += "<td><input class='deleteBtn' type='button'>삭제</td>";
						table += "</tr>";
						$('#notBuyShare').append(table);
					}
						allTotal += req[i].totalPrice;
				}
				var button = "<input type='button' id='orderBtn'>선택한상품 주문하기";
				var showAllTotal = "<span>" + allTotal
						+ "</span>"
				$('body').append(showAllTotal);
				oneProd = req;
            },
            error: function(er) {
                console.log("실패 원인 :" + er);
            } 
            
                // 데이터 출력해서 보여주는 함수 실행
        })
    }

  
    
    // 수량 입력시 값 업로드되는 함수 만들기
    // prodId 들고가야한다 session에 값 있음
    // success시 showOneprod나 showAllprod실행하자
    
        $(document).on("input", ".prodAmount", function(event) {
            var prodAmount = $(event.target);
            var prodId = prodAmount.parent().parent().children("#hidden").value;
        	$.ajax({
                 url: "../updateCart.do",
                 type: "GET",
                 dataType: 'json',
                 data: {"prodAmount" : prodAmount.value,
                	 	"prodId" : prodId
                		 },
                 success: function(res) {
                     showOneProd();
                 },
                 error : function(er) {
                     console.log("실패원인 :" + er);
                 }
                 })
        })
        
    // 삭제버튼 클릭시 리스트 삭제하는 함수 만들기
    // success시 showOneProd나 showAllProd실행하자
    // prodId 가지고 가야한다.
        $(document).on("click", ".deleteBtn", function(event) {
        	var deleteBtn = $(event.target);
        	var prodId = deleteBtn.parent().children("#hidden").value;
            $.ajax({
                url: "../deleteCart.do",
                type: "GET",
                dataType: 'json',
                data: {"prodId" : prodId},
                success: function(res) {
                    showOneProd();
                },
                error : function(er) {
                    console.log("실패원인 :" + er);
                }
            })
        })
        
     // 선택한 상품 구매하기 클릭시 oneProd들고가서
  	// orderDAO실행해야할듯
        $(document).on("click", "#orderBtn", function() {
        	$.ajax({
        		url: "../orderDataMake.do"
        		type: "GET",
        		contentType: 'application/json; charset=UTF-8'
        		data: {oneProd : JSON.stringify(oneProd)}, 
        		dataType: 'json',
        		success: function(res) {
        			console.log("주문하기화면으로 넘기기 성공")
        		},
        		error : function(er) {
        			console.log("실패원인 :" + er);
        		}
        	})
        })
        
  
})
</script>
</body>
</html>