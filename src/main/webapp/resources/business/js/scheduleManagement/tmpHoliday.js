// 초기실행 (뷰 & 인터페이스)
displayTmpHoliday(); // list 출력
hideModiIcons(); // 수정 관련 버튼 숨기기


// 임시 휴무 리스트 출력
function displayTmpHoliday() {
	// container
	const container = document.getElementById("schedule-container");
	

	
	for (let i = 0; i < btempsuspension.length; i++) {
		// temp holiday info
		const data = btempsuspension[i];
		
		// list
		const ul = document.createElement("ul");
		const randomId = generateRandomString(9);
		ul.className = "list_content";
		ul.id = randomId;
		
			// 날짜
			const periodCon = document.createElement("li");
			periodCon.className = "period_con";
				
				// view
				const subCon = document.createElement("div");
				subCon.className = "period_view_default";
					
					// start
					const start = document.createElement("div");
					start.className = "list_start_day";
					start.innerHTML = data.beginday; // data
						
					// ~
					const firstArrow = document.createElement("div");
					firstArrow.className = "arrow";
					firstArrow.innerHTML = "~";
					
					// end
					const end = document.createElement("div");
					end.className = "list_end_day"
					end.innerHTML = data.endday; // data
				
				// input
				const inputCon = document.createElement("div");
				inputCon.className = "period_view_input";
				inputCon.classList.add("hide");
					
					// start input
					const startInput = document.createElement("input"); 
					startInput.className = "period_start";
					startInput.type = "date";
					startInput.name = "updateStartDay";
					startInput.value = data.beginday; // data preview
					
					// ~
					const secondArrow = document.createElement("div");
					secondArrow.className = "arrow";
					secondArrow.innerHTML = "~";
					
					// end input
					const endInput = document.createElement("input");
					endInput.className = "period_end";
					endInput.type = "date";
					endInput.name = "updateEndDay";
					endInput.value = data.endday; // data preview
			
			// 사유
			const reasonCon = document.createElement("li");
			reasonCon.className = "reason_con";
				
				// view
				const reason = document.createElement("div");
				reason.className = "reason_view_default";
				reason.innerHTML = data.reason // data preview
				
				// input
				const reasonInput = document.createElement("input");
				reasonInput.className = "reason_view_input";
				reasonInput.classList.add("hide");
				reasonInput.type = "text";
				reasonInput.name = "updateReason";
				reasonInput.value = data.reason;
				reasonInput.maxlength = "500";
			
			// 아이콘(cancle)
			const cancleIcon = document.createElement("li");
			cancleIcon.className = "cancle_icon";
			cancleIcon.innerHTML = '<i class="fas fa-times" onclick="cancleUpdate(' + randomId + ')"></i>';
			
			// 아이콘(complete)
			const completeIcon = document.createElement("li");
			completeIcon.className = "complete_icon";
			completeIcon.innerHTML = '<i class="fas fa-check-square" onclick="postSchedule(' + randomId + ')"></i>';

			// 아이콘(remove)
			const removeIcon = document.createElement("li");
			removeIcon.className = "remove_icon";
			removeIcon.innerHTML = '<i class="fas fa-trash-alt" onclick="deleteSchedule(' + randomId + ')"></i>';
			
			// 아이콘(update)
			const updateIcon = document.createElement("li");
			updateIcon.className = "update_icon";
			updateIcon.innerHTML = '<i class="fas fa-pen-square" onclick="updateSchedule(' + randomId + ')"></i>';
			
			
		// 추가
		subCon.appendChild(start);
		subCon.appendChild(firstArrow);
		subCon.appendChild(end);
		
		inputCon.appendChild(startInput);
		inputCon.appendChild(secondArrow);
		inputCon.appendChild(endInput);
			
		periodCon.appendChild(subCon);
		periodCon.appendChild(inputCon);
		
		reasonCon.appendChild(reason);
		reasonCon.appendChild(reasonInput);
		
		ul.appendChild(periodCon);
		ul.appendChild(reasonCon);
		
		ul.appendChild(cancleIcon);
		ul.appendChild(completeIcon);
		ul.appendChild(removeIcon);
		ul.appendChild(updateIcon);
		
		container.appendChild(ul);
	}
}


// 아이콘 숨기기 (수정완료, 삭제, 취소)
function hideModiIcons() {
	const cancleIcons = document.getElementsByClassName("cancle_icon");
	const completeIcons = document.getElementsByClassName("complete_icon");
	const removeIcons = document.getElementsByClassName("remove_icon");
	
	for (let i = 0; i < btempsuspension.length; i++) {
		cancleIcons[i].classList.add("hide");
		completeIcons[i].classList.add("hide");
		removeIcons[i].classList.add("hide");
	}
}


// 임시 휴무 리스트 수정 버튼
function updateSchedule(list) {
	// icon display
	const updateIcon = list.getElementsByClassName("update_icon")[0];
	const cancleIcon = list.getElementsByClassName("cancle_icon")[0];
	const completeIcon = list.getElementsByClassName("complete_icon")[0];
	const removeIcon = list.getElementsByClassName("remove_icon")[0];
	
	updateIcon.classList.add("hide"); // add hide
	cancleIcon.classList.remove("hide"); // remove hide
	completeIcon.classList.remove("hide"); // remove hide
	removeIcon.classList.remove("hide"); // remove hide
	
	// input display
	const dateView = list.getElementsByClassName("period_view_default")[0];
	const dateInput = list.getElementsByClassName("period_view_input")[0];
	const reasonView = list.getElementsByClassName("reason_view_default")[0];
	const reasonInput = list.getElementsByClassName("reason_view_input")[0];
	
	dateView.classList.add("hide");
	reasonView.classList.add("hide");
	
	dateInput.classList.remove("hide");
	reasonInput.classList.remove("hide");
}


// 임시 휴무 리스트 수정 취소 버튼
function cancleUpdate(list) {
	const updateIcon = list.getElementsByClassName("update_icon")[0];
	const cancleIcon = list.getElementsByClassName("cancle_icon")[0];
	const completeIcon = list.getElementsByClassName("complete_icon")[0];
	const removeIcon = list.getElementsByClassName("remove_icon")[0];
	
	updateIcon.classList.remove("hide"); // remove hide
	cancleIcon.classList.add("hide"); // add hide
	completeIcon.classList.add("hide"); // add hide
	removeIcon.classList.add("hide"); // add hide
	
	// input display
	const dateView = list.getElementsByClassName("period_view_default")[0];
	const dateInput = list.getElementsByClassName("period_view_input")[0];
	const reasonView = list.getElementsByClassName("reason_view_default")[0];
	const reasonInput = list.getElementsByClassName("reason_view_input")[0];
	
	dateView.classList.remove("hide");
	reasonView.classList.remove("hide");
	
	dateInput.classList.add("hide");
	reasonInput.classList.add("hide");
}





//임시 휴무 기간 선택 input > min & max default 설정
const startDay = document.getElementById("startDay");
const endDay = document.getElementById("endDay");

const thisYear = new Date().getFullYear();
const thisMonth = new Date().getMonth() + 1;
const thisDate = new Date().getDate();

const minDate = `${thisYear}-${thisMonth}-${thisDate}`;
const maxDate = `${thisYear + 3}-${thisMonth}-${thisDate}`;

startDay.setAttribute("min", minDate);
startDay.setAttribute("max", maxDate);

endDay.setAttribute("min", minDate);
endDay.setAttribute("max", maxDate);


//임시 휴무 기간 input 유효성 검사
endDay.addEventListener("change", function(e) {
	if (startDay.value !== null) {		
		const inputDate = e.target.value;
		console.log(inputDate);
		console.log(startDay.value);
		
		inputDate < startDay.value ? 
			document.getElementById("date-error-msg").innerHTML = "시작일보다 전의 일자를 입력하셨습니다. 다시 입력해주세요." :
			null;	

		inputDate >= startDay.value ? 
			document.getElementById("date-error-msg").innerHTML = "" : 
			null;
	}
})
