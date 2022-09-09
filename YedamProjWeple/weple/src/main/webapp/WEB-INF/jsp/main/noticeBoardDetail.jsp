<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

td, th {
	padding: 10px;
}

.td-date {
	width: 80px;
}

.td-cnt {
	width: 70px;
	text-align: right;
}
.td-cnt.head {
	width: 70px;
}

.td-reple.date {
	width: 110px;
}

.updateBtn {
	text-align: right;
}
</style>

<section class="bg0 p-t-23 p-b-140" style="padding-top: 150px;">
	<div class="container">
		<div class="p-b-10" style="padding-bottom: 15px;">
			<h3 class="ltext-103 cl5"
				style="font-weight: 900; font-size: 26px; color: #444;">
				${notice.title }</h3>
		</div>

		<div class="wrap-table-shopping-cart" >
			<table class="table-shopping-cart" id="noticeTable">
				<tr style="background: #222222; color: white;">
					<th class="td-date">작성일자</th>
					<th>${notice.writeDate }</th>
					<th></th>
					<th class="td-cnt head">조회수</th>
					<th class="td-cnt">${notice.CNT }</th>
				</tr>
				<tr>
					<th class="td-date">제목</th>
					<th colspan="4">${notice.title }</th>
				</tr>
				<tbody>
					<tr>
						<td colspan="5">${notice.boardContent }</td>
					</tr>
				</tbody>
				<c:choose>
					<c:when test="${userId != null }">
						<tr>
							<th colspan="3" class="table_head"
								style="padding: 12px 10px; background: #222222; color: white;">댓글</th>
							<th colspan="2" class="table_head"
								style="padding: 12px 10px; background: #222222; color: white;">
								<button class="flex-c-m stext-101 cl1 bg3 bor2 hov-btn3 trans-04 pointer"
										style="padding: 1px 3px;" id="write"
										value="댓글쓰기" type="button">댓글쓰기</button>
							</th>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th colspan="5" class="table_head"
								style="padding: 12px 10px; background: #222222; color: white;">댓글</th>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr style="display: none;" id="writeBox">
					<th class="td-date">작성내용</th>
					<th colspan="2"><input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="reple" placeholder="내용을 입력하세요"></th>
					<th><button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
								style="padding: 5px;" id="insertBtn"
								value="등록" type="button">등록</button></th>
					<th><button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
								style="padding: 5px;" id="closeBtn"
								value="닫기" type="button">닫기</button></th>
				</tr>
				<tr id="repleHead">
					<th class="td-date">작성자</th>
					<th>내용</th>
					<th class="td-reple date" style="text-align: left;">작성일자</th>
					<th>수정</th>
					<th style="text-align: center;">삭제</th>
				</tr>
			</table>
		</div>
	</div>
</section>

<script>
	showAllComment();
	
	function showAllComment() {
		$.ajax({
			url : "showComments.do?bno=${notice.bno}",
			type : "GET",
			dataType : 'json',
			success : function(req) {
				console.log(req);
				let table_html = '';
				
				for(let i = 0; i < req.length; i++) {
					table_html += `<tr>`;
					table_html += `<td class="hidden" style="display: none;">` + req[i].repleNum + `</td>`;
					table_html += `<td>` + req[i].userId + `</td>`;
					
					table_html += `<td>` + req[i].reple + `</td>`;
					table_html += `<td>` + req[i].writeDate + `</td>`;
					if(req[i].userId == "${userId }") {
						table_html += `<td><button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
													style="padding: 5px;" id="updateBtn"
													value="수정" onclick = "return false" type="button">수정</button></td>`;  
						table_html += `<td><button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
													style="padding: 5px;" id="deleteBtn"
													value="삭제" type="button">삭제</button></td>`;  
					}
					table_html += `</tr>`;
				}
				$('#repleHead').after(table_html);
			},
			error : function(er) {
				console.log("실패 원인 : " + er);
			}
		})
	}
	/* 삭제 버튼 */
	$(document).on("click", "#deleteBtn", function(event) {
		var deleteBtn = $(event.target);
		var repleNum = deleteBtn.parent().parent().children(".hidden").text();
		console.log(repleNum);
		
		fetch("deleteComments.do", {
			method: 'post',
			headers: {'Content-type': 'application/x-www-form-urlencoded'},
			body: 'repleNum=' + repleNum + '&bno=${notice.bno}'
			
		})
		.then(result => result.text())
		.then(console.log(${notice.bno}))
		.catch(err => console.log(err));
	
		deleteBtn.parent().parent().remove();
	})
	
	
	/* 댓글쓰기 버튼 */
	$(document).on("click","#write", function(event) {
		$("#writeBox").css('display', 'table-row');
	})
	
	
	/* 닫기 버튼 */
	$(document).on("click","#closeBtn", function(event) {
		$("#writeBox").css('display', 'none');
	})
	
	
	/* 등록 버튼 */
	$(document).on("click","#insertBtn", function(event) {
		let content = $(event.target).parent().prev().children('input[name=reple]').val();
		console.log(content);
		
		if(content == '') {
			swal({
			  title: "작성 내용을 입력하세요.",
			  icon: "info",
			  button: "닫기",
			});
		} else {
			fetch("createComments.do", {
				method: 'post',
				headers: {'Content-type': 'application/x-www-form-urlencoded'},
				body: 'createComment=' + content + '&bno=${notice.bno}'
			})
			.then(result => result.json())
			.then(addReple)
			.catch(err => console.log(err));
		}
	})
	
	
	/* 수정 버튼 */
	$(document).on("click","#updateBtn", function(event) {
		/* 수정 폼으로 바꾸기 */
		let curr = $(event.target).parent().prev().prev().text();
		let update_html = '';
		update_html += `<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="repleUpdate" placeholder="`;
		update_html += curr;
		update_html += `">`;
		$(event.target).parent().prev().prev().html(update_html);
		$(event.target).parent().prev().prev().children().focus();
		/* 수정 폼으로 바꾸기 끝 */
		
		/* 삭제버튼을 취소버튼으로 바꾸기 */
		let delBtnBox = $(event.target).parent().next();
		let cancel_html = `<button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
							style="padding: 5px;" id="cancelBtn"
							value="취소" onclick = "return false" type="button">취소</button>`;
		delBtnBox.html(cancel_html);
		/* 삭제버튼을 취소버튼으로 바꾸기 끝 */
		
		/* 수정버튼을 완료버튼으로 바꾸기 */
		let updateBtnBox = $(event.target).parent();
		let comple_html = `<button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
							style="padding: 5px;" id="compleBtn"
							value="완료" onclick = "return false" type="button">완료</button>`;
		updateBtnBox.html(comple_html);
		/* 수정버튼을 완료버튼으로 바꾸기 끝 */
		
	})
	
	
	/* 취소버튼 */
	$(document).on("click","#cancelBtn", function(event) {
		/* 댓글 창으로 바꾸기 */
		let prev = $(event.target).parent().prev().prev().prev().children().attr('placeholder');
		let repleBox = $(event.target).parent().prev().prev().prev();
		repleBox.html(prev);
		/* 댓글 창으로 바꾸기 끝 */
		
		/* 완료버튼을 수정버튼으로 바꾸기 */
		let compleBtnBox = $(event.target).parent().prev();
		let update_html = `<button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
							style="padding: 5px;" id="updateBtn"
							value="수정" onclick = "return false" type="button">수정</button>`;
		compleBtnBox.html(update_html);
		/* 완료버튼을 수정버튼으로 바꾸기 끝 */
		
		/* 취소버튼을 삭제버튼으로 바꾸기 */
		let cancelBtnBox = $(event.target).parent();
		let delete_html = `<button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
							style="padding: 5px;" id="deleteBtn"
							value="삭제" type="button">삭제</button>`;
		cancelBtnBox.html(delete_html);
		/* 취소버튼을 삭제버튼으로 바꾸기 끝 */
	})
	
	
	/* 완료버튼 */
	$(document).on("click","#compleBtn", function(event) {
		/* 댓글 창으로 바꾸기 */
		let reple = $(event.target).parent().prev().prev().children().val();
		if(reple == '') {
			swal({
			  title: "수정 내용을 입력하세요.",
			  icon: "info",
			  button: "닫기",
			});
			return false;
		} else {
			let repleBox = $(event.target).parent().prev().prev();
			repleBox.html(reple);
		/* 댓글 창으로 바꾸기 끝 */
		
			/* DB연결 */
			let repleNum = $(event.target).parent().prev().prev().prev().prev().text();
			fetch("updateComments.do", {
				method: 'post',
				headers: {'Content-type': 'application/x-www-form-urlencoded'},
				body: 'repleNum=' + repleNum + '&updateComment=' + reple
			})
			.then(result => result.json())
			.then(addReple)
			.catch(err => console.log(err));
			/* DB연결 끝 */
			
			/* 취소버튼을 삭제버튼으로 바꾸기 */
			let cancelBtnBox = $(event.target).parent().next();
			let delete_html = `<button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
								style="padding: 5px;" id="deleteBtn"
								value="삭제" type="button">삭제</button>`;
			cancelBtnBox.html(delete_html);
			/* 취소버튼을 삭제버튼으로 바꾸기 끝 */
			
			/* 완료버튼을 수정버튼으로 바꾸기 */
			let compleBtnBox = $(event.target).parent();
			let update_html = `<button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
								style="padding: 5px;" id="updateBtn"
								value="수정" onclick = "return false" type="button">수정</button>`;
			compleBtnBox.html(update_html);
			/* 완료버튼을 수정버튼으로 바꾸기 끝 */
		}
		
	})
	
	
	
	function addReple(result) {
		let table_html = '';
		
		table_html += `<tr>`;
		table_html += `<td class="hidden" style="display: none;">` + result.repleNum + `</td>`;
		table_html += `<td>` + result.userId + `</td>`;
		
		table_html += `<td>` + result.reple + `</td>`;
		table_html += `<td>` + result.writeDate + `</td>`;
		if(result.userId == "${userId }") {
			table_html += `<td><button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
										style="padding: 5px;" id="updateBtn"
										value="수정" onclick = "return false" type="button">수정</button></td>`;  
			table_html += `<td><button class="flex-c-m stext-101cl2 bg8 bor13 hov-btn3 trans-04 pointer"
										style="padding: 5px;" id="deleteBtn"
										value="삭제" type="button">삭제</button></td>`;  
		}
		table_html += `</tr>`;
		
		$('#repleHead').after(table_html);
		
		$("#writeBox").css('display', 'none');
	}
</script>
