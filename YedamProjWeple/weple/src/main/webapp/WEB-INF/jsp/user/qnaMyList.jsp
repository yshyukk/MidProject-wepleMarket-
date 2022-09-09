<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="p-b-10">
	<h3 class="ltext-103 cl5"
		style="font-weight: 900; font-size: 20px; margin: 10px; text-align: right; color: #444;">
		나의 문의 내역</h3>
</div>
<div class="wrap-table-shopping-cart">
	<table class="table-shopping-cart">
		<tr class="table_head">
			<th style="width: 110px; text-align: center;">상품</th>
			<th style="padding-left: 10px;">작성제목</th>
			<th style="width: 50px; text-align: center;">답변</th>
			<th style="width: 180px; text-align: center;">작성일</th>
			<th style="width: 50px; text-align: center;">삭제</th>
		</tr>
		<c:forEach var="myQnaList" items="${allMyQnaList }">
			<tr style="padding:0; margin:0;">
				<td style="padding:10px; margin:0; width: 110px;">
					<a href="productDetail.do?prodId=${myQnaList.prodId}">
						<img src="${myQnaList.imgUrl }" alt="IMG" style="width: 90px;">
					</a>
				</td>
				<td style="padding:10px; margin:0;" onclick="open_box()">${myQnaList.title}</td>
				<td style="padding:10px; margin:0; width: 50px; text-align: center;">
					<c:choose>
						<c:when test="${myQnaList.isHandled == 1}">완료</c:when>
						<c:otherwise>대기</c:otherwise>
					</c:choose>
				</td>
				<td style="padding:10px; margin:0; width: 180px;">${myQnaList.writeDate}</td>
				<td style="padding:10px; margin:0; width: 50px; text-align: center;">
					<a class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"
							href="#" onclick="deleteQnaConfirm(${myQnaList.bno})" 
							style="width: 28px; text-align: center;"> X </a>
				</td>
			</tr>
			<tr class="resp" style="display: none; padding:0; margin:0;">
				<td style="padding:10px; margin:0; width: 110px; font-weight: bold">↳ 작성내용</td>
				<td style="padding:10px; margin:0; widht: 728px;">
					${myQnaList.boardContent }
				</td>
				<td style="padding:10px; margin:0; width: 50px; text-align: center;"></td>
				<td style="padding:10px; margin:0; width: 180px;"></td>
				<td style="padding:10px; margin:0; width: 50px; text-align: center;"></td>
			</tr>
			<tr class="resp" style="display: none; padding:0; margin:0;">
				<td style="padding:10px; margin:0; width: 110px; font-weight: bold">↳ 답변</td>
				<td style="padding:10px; margin:0; widht: 728px; color: #6c7ae0;">
					<c:choose>
						<c:when test="${myQnaList.isHandled == 1}">${myQnaList.repsComment }</c:when>
						<c:otherwise>답변 등록이 대기중입니다. 잠시만 기다려주세요!</c:otherwise>
					</c:choose>
				</td>
				<td style="padding:10px; margin:0; width: 50px; text-align: center;"></td>
				<td style="padding:10px; margin:0; width: 180px;"></td>
				<td style="padding:10px; margin:0; width: 50px; text-align: center;"></td>
			</tr>
		</c:forEach>
	</table>
</div>

<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
	<c:if test="${pageInfo.prev }">
		<a class="flex-c-m how-pagination1 trans-04 m-all-7"
			href="myQnaListPaging.do?pageNum=${pageInfo.startPage - 1 }&amount=${pageInfo.cri.amount}">prev</a>
	</c:if>
	<c:forEach var="num" begin="${pageInfo.startPage }"
		end="${pageInfo.endPage }">
		<a class="flex-c-m how-pagination1 trans-04 m-all-7"
			href="myQnaListPaging.do?pageNum=${num}&amount=${pageInfo.cri.amount}">${num }</a>
	</c:forEach>
	<c:if test="${pageInfo.next }">
		<a class="flex-c-m how-pagination1 trans-04 m-all-7"
			href="myQnaListPaging.do?pageNum=${pageInfo.endPage + 1 }&amount=${pageInfo.cri.amount}">next</a>
	</c:if>
</div>



	
<script language=javascript>
	
 function deleteQnaConfirm(bno){
		console.log(bno);
		let box1 = event.target.parentElement.parentElement;
		let box2 = event.target.parentElement.parentElement.nextElementSibling;
		let box3 = event.target.parentElement.parentElement.nextElementSibling.nextElementSibling;
     	let del = confirm("작성한 게시글을 진짜 삭제 하실껍니까!!?");
      
      if (del == true){
        alert("삭제완료!");
   		let urlParams = new URL(location.href).searchParams;
   		let pageNum = urlParams.get('pageNum');
   		let amount = urlParams.get('amount');
        
        fetch('deleteQna.do', {
    		method: 'post',
    		headers: {'Content-type': 'application/x-www-form-urlencoded'},
    		body: 'pageNum='+pageNum +'&amount='+amount +'&bno='+bno
    	})
    	.then(result => result.text())
    	.then(function(result){
    		if(result =='true') {
    			box1.remove();
    			box2.remove();
    			box3.remove();
    		} else {
    			alert('삭제를 실패했습니다.');
    		}
    	})
    	.catch(err => console.log(err))
        //location.href="deleteReview.do?bno=" + bno;
      }
    }	
 function open_box() {
	   event.target.parentElement.nextElementSibling.style.display = "table-row";
	   event.target.parentElement.nextElementSibling.nextElementSibling.style.display = "table-row";
	}

function close_box(bno) {
	   document.getElementById(bno).style.display = "none";
	   
	}

</script>
