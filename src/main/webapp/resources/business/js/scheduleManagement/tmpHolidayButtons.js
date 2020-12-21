// 임시 휴무 일정 인터페이스

// 임시 휴무 수정 취소 버튼 숨기기
const cancleIcons = document.getElementsByClassName("cancle_icon_con");
const completeIcons = document.getElementsByClassName("complete_icon_con");
for (let i = 0; i < cancleIcons.length; i++) {
	cancleIcons[i].style.display = "none";
	cancleIcons[i].style.color = "red";
	completeIcons[i].style.display = "none";
	completeIcons[i].style.color = "lawngreen";
}

// 임시 휴무 리스트 수정 버튼
function updateSchedule(obj) {
	const list = obj.parentElement.parentElement;
	
	const viewCon = list.getElementsByClassName("period_view_default")[0];
	const updateIcon = list.getElementsByClassName("update_icon_con")[0];
	const viewReasonCon = list.getElementsByClassName("reason_view_default")[0];
		
	const timeInputCon = list.getElementsByClassName("period_view_input")[0];
	const inputReasonCon = list.getElementsByClassName("reason_view_input")[0];
	const cancleIcon = list.getElementsByClassName("cancle_icon_con")[0];
	const completeIcon = list.getElementsByClassName("complete_icon_con")[0]
	
	viewCon.style.display = "none";
	viewReasonCon.style.display = "none"; 
	updateIcon.style.display = "none";

	timeInputCon.style.display = "flex";
	inputReasonCon.style.display = "block";
	cancleIcon.style.display = "block";
	completeIcon.style.display = "block";
}

// 임시 휴무 리스트 수정 취소 버튼
function cancleUpdate(obj) {
	const list = obj.parentElement.parentElement.parentElement;
	
	const viewCon = list.getElementsByClassName("period_view_default")[0];
	const updateIcon = list.getElementsByClassName("update_icon_con")[0];
	const viewReasonCon = list.getElementsByClassName("reason_view_default")[0];
		
	const timeInputCon = list.getElementsByClassName("period_view_input")[0];
	const inputReasonCon = list.getElementsByClassName("reason_view_input")[0];
	const cancleIcon = list.getElementsByClassName("cancle_icon_con")[0];
	const completeIcon = list.getElementsByClassName("complete_icon_con")[0]
	
	viewCon.style.display = "flex";
	updateIcon.style.display = "block";
	viewReasonCon.style.display = "block"; 
	
	inputReasonCon.style.display = "none";	
	timeInputCon.style.display = "none";
	cancleIcon.style.display = "none";
	completeIcon.style.display = "none";
	
	
}

// 임시 휴무 리스트 삭제 버튼
function deleteSchedule(obj) {
	const list = obj.parentElement.parentElement.parentElement;
	const startDay = list.getElementsByClassName("list_start_day")[0].innerHTML;
	const endDay = list.getElementsByClassName("list_end_day")[0].innerHTML;	
	
	const agree = confirm(`${startDay} ~ ${endDay}의 휴무 일정을 삭제하시겠습니까?`);
	if (agree) {
		// DB에서 리스트 삭제 > redirect
		list.remove();
		window.location.reload();
		return;
	}
}

// 임시 휴무 리스트 확인 버튼
function postSchedule(obj) {
	const agree = confirm("수정하신 내용을 반영하시겠습니까?");
	
	if (agree) {
		// DB에 리스트 추가 > rediect
		window.location.reload();
	}
	
}