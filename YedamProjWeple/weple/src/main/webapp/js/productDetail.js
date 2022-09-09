/**
 * 상품 상세설명 화면
 */
 
 
 /*공동구매 버튼을 눌렀을 때*/
 function addCart(num) {
	console.log(num);
	if (num == 3) {
		swal({
		  title: "로그인 후 이용 가능합니다.",
		  icon: "info",
		  button: "닫기",
		});
		return false;
	} else if(num == 4) {
		swal({
		  title: "공동 구매가 마감되었습니다.",
		  icon: "info",
		  button: "닫기",
		});
		return false;
	} else {
		let amount = document.querySelector('.mtext-104.cl3.txt-center.num-product').value;
		let buyType = num;
		console.log(num);
		fetch('insertCart.do', {
			method: 'post',
			headers: {'Content-type': 'application/x-www-form-urlencoded'},
			body: 'amount='+amount+'&isShare='+buyType
		})
		.then(result => result.text())
		.then(function() {
			swal({
			  title: "장바구니 추가 완료!",
			  icon: "success",
			  button: "닫기",
			});
		})
		return false;
	}
	
}

function open_box(userId) {
	if (userId == '') {
		swal({
		  title: "로그인 후 이용 가능합니다.",
		  icon: "info",
		  button: "닫기",
		});
	} else {
		document.querySelector('#qnaFrm').style.display = "block";
	}
	
}

function close_box() {
   document.querySelector('#qnaFrm').style.display = "none";
}

function qnaInsert() {
	let title = document.querySelector('.stext-111.cl2.plh3.size-116.p-l-62.p-r-30').value;
	let content = document.querySelector('.stext-111.cl2.plh3.size-120.p-lr-28.p-tb-25').value;
	
	fetch('insertQna.do', {
				method: 'post',
				headers: {'Content-type': 'application/x-www-form-urlencoded'},
				body: 'title='+title+'&content='+content

				})
				.then(result => result.json())
				.then(insert)
				.catch(err => console.log(err));
}

function insert(result) {
	swal({
	  title: "문의 등록!",
	  icon: "success",
	  button: "닫기",
	});
	
	if (document.querySelector('#noQna').innerText == '문의 내역이 없습니다.') {
		document.querySelector('#noQna').innerText = '';
	}
	
	let temp_html = `<div class="flex-w flex-sb-m p-b-17">
					<span class="mtext-107 cl2 p-r-20">
						${result.writer} </span> 
					<span class="mtext-107 cl2 p-r-20">
						${result.writeDate } </span>
				</div>

				<p class="stext-102 cl6">${result.title }</p>
				<p class="stext-102 cl6">${result.boardContent }</p>
				<br>
				<hr>
				<br>`;

	
	document.querySelector('.stext-111.cl2.plh3.size-116.p-l-62.p-r-30').value='';
	document.querySelector('.stext-111.cl2.plh3.size-120.p-lr-28.p-tb-25').value='';
	document.querySelector('#inputQna').insertAdjacentHTML('afterend',  temp_html );
	close_box();
}