

function jjimclick(prodId) {
	let checkbox = document.getElementById('heart' + prodId);
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
				swal({
				  title: "찜 취소 ㅠㅠ",
				  icon: "info",
				  button: "닫기",
				});
				checkbox.checked = false;
				
			} else {
				swal({
				  title: "찜 등록!",
				  icon: "success",
				  button: "닫기",
				});
				checkbox.checked = true;
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





