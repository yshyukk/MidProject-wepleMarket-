<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="p-b-10">
	<h3 class="ltext-103 cl5"
		style="font-weight: 900; font-size: 20px; margin: 10px; text-align: right; color: #444;">
		나의 리뷰 내역</h3>
</div>
<div class="wrap-table-shopping-cart">
	<table class="table-shopping-cart">
		<tr class="table_head">
			<th style="width: 110px; text-align: center;">상품</th>
			<th style="padding-left: 10px;">작성내용</th>
			<th style="width: 50px; text-align: center;">별점</th>
			<th style="width: 180px; text-align: center;">작성일</th>
			<th style="width: 50px; text-align: center;">삭제</th>
		</tr>
		<c:forEach var="myRevList" items="${pagingList }">
			<tr style="padding:0; margin:0;">
				<td style="padding:10px; margin:0; width: 110px;">
					<a href="productDetail.do?prodId=${myRevList.prodId}">
						<img src="${myRevList.imgUrl }" alt="IMG" style="width: 90px;">
					</a>
				</td>
				<td style="padding:10px; margin:0;">${myRevList.boardContent}</td>
				<td style="padding:10px; margin:0; width: 50px; text-align: center;">${myRevList.cnt}</td>
				<td style="padding:10px; margin:0; width: 180px;">${myRevList.writeDate}</td>
				<td style="padding:10px; margin:0; width: 50px; text-align: center;">
					<a class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"
							href="#" onclick="deleteConfirm(${myRevList.bno})" 
							style="width: 28px; text-align: center;"> X </a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
	<c:if test="${pageInfo.prev }">
		<a class="flex-c-m how-pagination1 trans-04 m-all-7"
			href="myListPaging.do?pageNum=${pageInfo.startPage - 1 }&amount=${pageInfo.cri.amount}">prev</a>
	</c:if>
	<c:forEach var="num" begin="${pageInfo.startPage }"
		end="${pageInfo.endPage }">
		<a class="flex-c-m how-pagination1 trans-04 m-all-7"
			href="myListPaging.do?pageNum=${num}&amount=${pageInfo.cri.amount}">${num }</a>
	</c:forEach>
	<c:if test="${pageInfo.next }">
		<a class="flex-c-m how-pagination1 trans-04 m-all-7"
			href="myListPaging.do?pageNum=${pageInfo.endPage + 1 }&amount=${pageInfo.cri.amount}">next</a>
	</c:if>
</div>


	<script language=javascript>
		
      function deleteConfirm(bno){
    	  
    	let box = event.target.parentElement.parentElement;
    	  
     	let del = confirm("작성한 리뷰를 진짜 삭제 하시겠습니까? 진짜?");
      
      if (del == true){
        alert("진짜 삭제하네..삭제완료!");
   		let urlParams = new URL(location.href).searchParams;
   		let pageNum = urlParams.get('pageNum');
   		let amount = urlParams.get('amount');
        
        fetch('deleteReview.do', {
    		method: 'post',
    		headers: {'Content-type': 'application/x-www-form-urlencoded'},
    		body: 'pageNum='+pageNum +'&amount='+amount +'&bno='+bno
    	})
    	.then(result => result.text())
    	.then(function(){
    		box.remove();
    	})
    	.catch(err => console.log(err))
        //location.href="deleteReview.do?bno=" + bno;
      }
    }
 
  </script>