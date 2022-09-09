

function jjimclick(prodId) {
	
	let checkbox = document.getElementById('heart' + prodId);
	let totalspan = document.getElementById('total' + prodId)
	let totaljjim = Number(totalspan.innerText);
	let is_checked;
	checkbox.checked ? is_checked=1 : is_checked=0;
	
	fetch('jjimUpdate.do', {
		method: 'post',
		headers: {'Content-type': 'application/x-www-form-urlencoded'},
		body: 'myjjim='+is_checked+'&prodId='+prodId
	})
	.then(result => result.text())
	.then(function(result){
		if(result =='true') {
			if (checkbox.checked) {
				checkbox.checked = false;
				totalspan.innerText = totaljjim - 1;
				
			} else {
				swal({
				  title: "찜 등록!",
				  icon: "success",
				  button: "닫기",
				});
				checkbox.checked = true;
				totalspan.innerText = totaljjim + 1;
			}
		} else {
			swal({
				  title: "로그인 후 이용 가능합니다.",
				  icon: "info",
				  button: "닫기",
				});
		}
	})
	.catch(err => console.log(err))
}


makeList();

function makeList() {
	let url = window.location.search;
	let param = new URLSearchParams(url);
	let catgId = param.get('catgId');
	let catgLevel = param.get('catgLevel');
	
	fetch('catgProdList.do', {
		method: 'post',
		headers: { 'Content-type': 'application/x-www-form-urlencoded' },
		body: 'catgId=' + catgId + '&catgLevel=' + catgLevel
	})

		.then(result => result.json())
		.then(prodList)
		.catch(err => console.log(err))
		
}


function prodList(result) {
	console.log(result);
	let template = document.querySelector('#prodListTemplate');
	for (let i = 0; i < result.length; i++) {
		let prod_html = `<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="productDetail.do?prodId=${result[i].prodId}"><img
									class="card-img-top" src="${result[i].imgUrl}" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="productDetail.do?prodId=${result[i].prodId}">
											${result[i].prodName}
										</a>
									</h4>
									<h5>${result[i].prodPrice}원</h5>
									<p class="card-text">
										100g당:${Math.ceil(result[i].prodPrice / result[i].weight * 100)}원
									</p>
								</div>
								<div class="card-footer">

								<div id="jjim">`
		/* 찜체크 */
		if (result[i].myjjim == 1) {
			prod_html += `<input id="heart${result[i].prodId}" type="checkbox" checked onClick="return false;" />`
		} else {
			prod_html += `<input id="heart${result[i].prodId}" type="checkbox" onClick="return false;" />`
		}
		/* 찜체크 끝 */
		

		prod_html += `<label for="heart${result[i].prodId}" onclick="jjimclick(${result[i].prodId})" > ❤</label> 
						<span id="total${result[i].prodId}">${result[i].totaljjim}</span>`;
					
		/* 평균별점 */
		if (result[i].avgStar == 99.9) {
			prod_html += `<span style="padding-left: 105px; color: transparent; text-shadow: 0 0 0 #aab8c2;">⭐</span>리뷰없음`;
		} else {
			prod_html += `<span style="padding-left: 140px;">⭐</span>${result[i].avgStar}`;
		}
		/* 평균별점 끝 */
		
		prod_html += `</div></div></div></div>`;
		
		template.innerHTML += prod_html;
	}

}



function catgList(result) {
	console.log(result);
	let url = window.location.search;
	let param = new URLSearchParams(url);
	let catgLevel = param.get('catgLevel');
	
	let keys = Object.keys(result);
	
	let template = documet.querySelector('#catg-list-group');
	let catg_html = '';
	for (let i = 0; i < result.length; i++) {
		let catgId = keys[i];
		catg_html += `<a href="catgDisp.do?catgId=${catgId }&catgLevel=${catgLevel+1}&name=${result[i]}"
		   class="list-group-item">${result[i] }</a>`;
	}
	
	template.innerHTML += catg_html;
}

function changejjim(no) {
	let currentItem = event.target;
	console.log(currentItem);
	
	let currentQty = currentItem.closest('.updown').childNodes[1].value;
	let currentPrice = currentItem.closest('.subdiv').childNodes[1].childNodes[1].value;
	console.log(currentQty, currentPrice);
	
	if (currentItem.classList[2] == 'down') {
		if (parseInt(currentQty) > 1) {
			changeQty = parseInt(currentQty) - 1;
			currentItem.closest('.updown').childNodes[1].value = changeQty;
		} else {
			return;
		}
	} else {
		changeQty = parseInt(currentQty) + 1;
		currentItem.closest('.updown').childNodes[1].value = changeQty;
	}
	
	//ajax
	fetch('../cartUpdate.do', {
		method: 'post',
		headers: {'Content-type': 'application/x-www-form-urlencoded'},
		body: 'no='+no+'&qty='+changeQty
	})
	.then(result => result.text())
	.then(result => console.log(result))
	.catch(err => console.log(err))
}



