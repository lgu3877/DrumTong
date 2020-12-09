// checkbox 체크 옵션
function checkOption(id) {
	const checked = document.getElementById(id).checked;
	checked === false ? 
		document.getElementById(id).checked = true : 
		document.getElementById(id).checked = false;	
	
}


// radio 체크 옵션
function radioSelect(id) {
	document.getElementById(id).checked = true;
}


// radio 버튼 이벤트 생성	>	checkbox disabled 속성 변경
const radioBtns = document.getElementsByClassName("radioBtn");

for (let i = 0; i < radioBtns.length; i++) {
	radioBtns[i].addEventListener('click', () => {
		
		const filter = document.getElementById('weekend-also').checked;
		const checkboxs = document.getElementsByClassName("checkBtn");
		
		console.log(filter);
		console.log(checkboxs);
		
		if (filter === true) {
			for (let i = 0; i < checkboxs.length; i++) {
				checkboxs[i].removeAttribute("disabled");
			}
		} 
		else {
			for (let i = 0; i < checkboxs.length; i++) {
				checkboxs[i].setAttribute("disabled", "disabled");
				console.log("123")
			}		
		}
	});
}
