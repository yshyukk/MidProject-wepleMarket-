<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<style>
section.replyForm {
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
	border: 1px solid #ddd;
}

section.replyForm textarea {
	font-size: 16px;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.replyForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.replyList div.userInfo {
	
}

section.replyList div.userInfo .userName {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: transparent; /* Will override color (regardless of order) */
	text-shadow: 0 0 0 #f0f0f0;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: #fff58c;
}
</style>


<form action="insertReview.do?orderNum=${orderNum }&prodId=${prodId }" method="post" id="insertReview">
	<h3>평점</h3>
	<div class="star-rating space-x-4 mx-auto">
		<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" /> <label for="5-stars" class="star pr-4">⭐</label>
		<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings" /> <label for="4-stars" class="star">⭐</label>
		<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings" /> <label for="3-stars" class="star">⭐</label> 
		<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings" /> <label for="2-stars" class="star">⭐</label>
		<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" /> <label for="1-star" class="star">⭐</label>
	</div>
	<hr>
	<h3>review</h3>
	<div class="bor8 m-b-30">
		<textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25"
			name="boardContent" id="content"
			placeholder="한 번 작성하신 후기는 등록하신 후기는 수정이 불가하니 신중하게 작성해주시기 바랍니다. 사실과 관계없는 단순 비방성 내용은 신고합니다."></textarea>
	</div>
	<button type="submit"
		class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10"
		id="cart-order">등록</button>
</form>

<script>
$('#cart-order').click(function(){
	if( $("#content").val() == '') {
		swal({
			  title: "리뷰내용을 작성하세요.",
			  icon: "info",
			  button: "닫기",
			});
		return false;
	} else {
		$( '#insertReview' ).submit();
	}
});
</script>