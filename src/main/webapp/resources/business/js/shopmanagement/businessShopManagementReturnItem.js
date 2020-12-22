// 수령 방법 수정
const returnModifyBtn =  document.getElementById("modify-return-option");
// 수령 방법 수정 완료
const returnCompleteBtn = document.getElementById("complete-return-option");

// 수령 방법 수정 클릭 이벤트
returnModifyBtn.addEventListener("onclick", function() {
	console.log("modify options");
})

// 수령 방법 수정 완료 클릭 이벤트
returnCompleteBtn.addEventListener("onclick", function() {
	console.log("complete and request to load options");	
})

// 체크 박스 라벨
function checkContent(obj) {
	let checkbox = obj.getElementsByClassName("returnOptions")[0];
	let icon = obj.getElementsByTagName("i")[0];
	let flag = checkbox.checked;
		
	// 체크
	if (flag === false) {
		checkbox.setAttribute("checked", "checked");

		checkbox.parentElement.style.backgroundColor = "navy";
		checkbox.parentElement.style.color = "white";
		icon.className = "fas fa-check-square";
	}
	
	// 체크 해제
	else {
		checkbox.removeAttribute("checked");
	
		checkbox.parentElement.style.backgroundColor = "";
		checkbox.parentElement.style.color = "navy";
		icon.className = "fas fa-window-close";
	}
}
