async function updateScheduleTime() {
	
	const timeRange = document.getElementsByClassName('time_range');
	
	for(let i = 0; i < timeRange.length; i++) {
		
		console.log('display' , timeRange[i].style.display);
		
		if(timeRange[i].style.display === "") {
			const timeInputs = timeRange[i].querySelectorAll('.time_input');
			
			const timeZoneCons = timeRange[i].querySelectorAll('.time_zone_con');
			
			
			for(let j = 0; j < timeInputs.length; j++) {
				 if(timeInputs[j].value === ""){
					alert("빈 값이 존재합니다");
					return false;
				} 
				
			}
			
			for(let k = 0; k < timeZoneCons.length; k++) {
				const timeZoneRadioAM = timeZoneCons[k].children[0].children[0];
				const timeZoneRadioPM = timeZoneCons[k].children[1].children[0];
				
				// 
				if(!timeZoneRadioAM.checked && !timeZoneRadioPM) {
					alert("빈 값이 존재합니다");
					return false;
				}
			}
			
		}
		
	}
	
	console.log('');
	
	
	
}


// 배열 속 중복값 제거 (정렬 필수)
function removeRepeatValue(array) {
	array.sort();
	
	for (let i = 0; i < array.length - 1; i++) {
		if (array[i] === array[i + 1]) {
			array.splice(i + 1, 1);
		} 
	}
	
	return array;
}

// 정기 휴무 등록
async function updateRegHoliday() {
	// axios
	const { data } = await axios.post("/drumtong/business/mainmanagement/BScheduleDays/rest/insertBScheduleDays/", bscheduledays);

	if (data) {
		bscheduledays = data; // 데이터 덮어씌우기

		// 정기휴무 뷰 업데이트
		document.getElementById("reg-holiday-schedule").innerHTML = ""; // 정기휴무 리스트 초기화
		displayRegHolidays(); // 정기휴무 리스트 다시 출력

		// selct & checkbox 초기화
		initializeRegInput();
		
		// 캘린더 업데이트
		document.getElementById("calander").innerHTML = ""; 
		renderCalendar();
	}
	
	else {
		alert("잘못된 입력입니다.");
	}
	
	
	
}


// 임시휴무 등록
async function updateTmpHoliday() {
	const startDate = document.getElementById("startDay").value;
	const endDate = document.getElementById("endDay").value;
	const reason = document.getElementById("tmp-holiday-text").value;
	
	// validation (시작일 > 종료일 & null 체크)
	if (startDate > endDate || startDate === "" || endDate === "" || reason.value === "")
		return alert("잘못된 날짜입력 입니다.");
	
	// request object 생성
	const object = {
		start : startDate, 
		end : endDate,
		reason : reason
	}
	
	const { data } = axios.post("/drumtong/business/mainmanagement/BTempHoliday/rest/deleteBTempHoliday/", object);
	btempsuspension = data;
	
	// form 초기화
	document.getElementById("startDay").value = "";
	document.getElementById("endDay").value = "";
	document.getElementById("tmp-holiday-text").value = "";
	
	// list 초기화 > 업데이트
	document.getElementById("schedule-container").innerHTML = ""; // 초기화
	displayTmpHoliday(); // list 출력
	hideModiIcons(); // 수정 관련 버튼 숨기기
}



// 임시휴무 단일 삭제
async function deleteSchedule(list) {
	// 일자 (시작일 ~ 마지막일)
	const startDay = list.getElementsByClassName("list_start_day")[0].innerHTML;
	const endDay = list.getElementsByClassName("list_end_day")[0].innerHTML;	
	
	// 동의
	const agree = confirm(`${startDay} ~ ${endDay}의 휴무 일정을 삭제하시겠습니까?`);
	
	if (agree) {
		// 정규식 > validation (잘짜 & 텍스트)
		const dateReg = "/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/";
		
		// 사유
		const reason = list.getElementsByClassName("reason_view_default")[0].innerHTML;
			
		const object = {
			start: startDay,
			end: endDay,
			reason: reason || ""
		}
		
		if (dateReg.test(startDay) && dateReg.test(endDay)) {
			const { data } = await axios.post("/drumtong/business/mainmanagement/BTempSuspension/rest/deleteBTempSuspension/", object);
			btempsuspension = data;
			
			// view 초기화 > 업데이트(리스트 & 버튼)
			document.getElementById("schedule-container").innerHTML = ""; // 초기화
			displayTmpHoliday(); // list 출력
			hideModiIcons(); // 수정 관련 버튼 숨기기
		}
	}
}



// 임시휴무 단일 업데이트
async function postSchedule(list) {
	// 일자 (시작일 ~ 마지막일)
	const startDay = list.getElementsByClassName("period_start")[0].value;
	const endDay = list.getElementsByClassName("period_end")[0].value;	
	
	// 동의
	const agree = confirm("수정하신 내용을 반영하시겠습니까?");
	
	if (agree) {
		// 정규식 > validation (잘짜 & 텍스트)
		const dateReg = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		
		// 사유
		const reason = list.getElementsByClassName("reason_view_input")[0].value;
			
		const object = {
			start: startDay,
			end: endDay,
			reason: reason || ""
		}
		
		if (dateReg.test(startDay) && dateReg.test(endDay)) {
			const { data } = await axios.post("/drumtong/business/mainmanagement/BTempSuspension/rest/deleteBTempSuspension/", object);
			btempsuspension = data;
			
			// view 초기화 > 업데이트(리스트 & 버튼)
			document.getElementById("schedule-container").innerHTML = ""; // 초기화
			displayTmpHoliday(); // list 출력
			hideModiIcons(); // 수정 관련 버튼 숨기기
		}
	}
}