function modalInterface() {
	const modal = document.getElementById("myModal");
	// 링크 버튼 > 매장관리 & 일정관리 연결 필요(EST 값 검사와 함께)
 	const btn = document.getElementById("myBtn");
	const span = document.getElementsByClassName("close")[0];
	
	btn.onclick = function() {
		modal.style.display = "block";
	}
	
	span.onclick = function() {
		modal.style.display = "none";
	}
	
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}	
}

modalInterface();