async function updateScheduleTime() {
	
	
	const timeRange = document.getElementsByClassName('time_range');
	let object = {
		weekday : '-',
		saturday : '-',
		sunday : '-',
	};
	
	// 영업시간 설정 [월~금] [토] [일] 을 순차적으로 검색해준다.
 	for(let i = 0; i < timeRange.length; i++) {
		
		
		
		let shopSchedule = "-";
		let scheduleTime = 0;
		let datafield = ["weekday", "saturday", "sunday"];
		
		let extraTimeA = 0;
		let extraTimeB = 0;
		
		console.log('display' , timeRange[i].style.display);
		
		
		// display가 활성화 되어있는 것만 검사해준다.
		if(timeRange[i].style.display === "") {
			
			// 시간 인풋 텍스트 모음
			const timeInputs = timeRange[i].querySelectorAll('.time_input');
			
			
			// 오전 오후 버튼 모음
			const timeZoneCons = timeRange[i].querySelectorAll('.time_zone_con');
			
			console.log(timeZoneCons);
			
			
			// 오전 오후 체크 상태 예외 검사
			for(let k = 0; k < timeZoneCons.length; k++) {
				const timeZoneRadioAM = timeZoneCons[k].children[0].children[0];	
				const timeZoneRadioPM = timeZoneCons[k].children[1].children[0];
				
				console.log(timeZoneRadioAM);
				console.log(timeZoneRadioPM);
				
				console.log(timeZoneRadioAM.checked);
				console.log(timeZoneRadioPM.checked);
				// 
				if(!timeZoneRadioAM.checked && !timeZoneRadioPM.checked) {
					alert("체크가 안되어있습니다.");
					return false;
				}
				else if(k === 0 && timeZoneRadioPM.checked) {
					console.log("+12실행 첫번째");
					extraTimeA = 12;
				} else if(k === 1 && timeZoneRadioPM.checked ) {
					console.log("+12실행 두번째");
					extraTimeB = 12;
				}
			}
			
			
			
			// Input text 빈값 예외 검사
			for(let j = 0; j < timeInputs.length; j++) {
				if(timeInputs[j].value === ""){
					alert("빈 값이 존재합니다");
					return false;
				}
				
				switch(j) {
					case 0 :
						scheduleTime = (timeInputs[j].value === "12" && extraTimeA === 12 ) ? (timeInputs[j].value * 1)  :  (timeInputs[j].value * 1) + extraTimeA;
						if(scheduleTime < 10)
							scheduleTime = "0" + scheduleTime;
						else if(scheduleTime === 12 && extraTimeA !== 12)
							scheduleTime = "00";
						else if(shopSchedule === 24)
							scheduleTime = "12";
						
						
						
						
						
						shopSchedule = "" + scheduleTime + ":";
						
						console.log(scheduleTime);
						
						break;
					
					case 1 :
					console.log("@@@@@@@@@@@@@@@@@",timeInputs[j].value);
						shopSchedule +=  (timeInputs[j].value  === "00") ? "0" : "";
						shopSchedule += ((timeInputs[j].value !== "00" && timeInputs[j].value < 10) ?  "0" + (timeInputs[j].value * 1) : (timeInputs[j].value * 1))   + " ~ ";
						
						
						
						console.log(shopSchedule);
						break;
					
					case 2 :
						scheduleTime = (timeInputs[j].value === "12" && extraTimeB === 12 ) ? (timeInputs[j].value * 1)  :  (timeInputs[j].value * 1) + extraTimeB;
						console.log(scheduleTime );
						if(scheduleTime < 10)
							scheduleTime = "0" + scheduleTime;
						else if(scheduleTime === 12 && extraTimeB !== 12)
							scheduleTime = "00";
						else if(shopSchedule === 24)
							scheduleTime = "12";
						
						
						shopSchedule += scheduleTime + ":";
						break;
					
					case 3 :
					console.log("@@@@@@@@@@@@@@@@@",timeInputs[j].value);
						shopSchedule +=  (timeInputs[j].value  === "00") ? "0" : "";
						shopSchedule += ((timeInputs[j].value !== "00" && timeInputs[j].value < 10) ?  "0" + (timeInputs[j].value * 1) : (timeInputs[j].value * 1)) + "";
						break;
				}
				
			}
			
			
		}
		
		
		if(!checkTimeWrongFormat(shopSchedule))
		 	return false;
		
		object[datafield[i]] = shopSchedule; 
		
		console.log('object@@', object);
	}
	
	
	const { data } = await axios.post("/drumtong/business/mainmanagement/BScheduleTime/rest/updateBScheduleTime/", object);
	
	if(data) {
		alert('성공적으로 입력이 완료되었습니다.');
	}
	else {
		alert('서버 오류가 발생했습니다.')
	}
	
}

function checkTimeWrongFormat(timeData) {
	if(timeData === "-")
		return true;
		
	let splitData = timeData.split("~");
		console.log('@@@@@111', splitData);
	let leftTimeData = splitData[0].split(":");
	
	console.log('@@@@@222', leftTimeData);
	
	let rightTimeData = splitData[1].split(":"); 
	
	console.log('@@@@@3333', rightTimeData);
	
	if(leftTimeData[0] * 1 > rightTimeData[0] * 1){
		alert('영업시작 시간보다 영업종료 시간이 더 빠릅니다. 다시 입력해주세요.');
		return false;
	}
	else if(leftTimeData[1] * 1 > rightTimeData[1] * 1){
		alert('영업시작 시간보다 영업종료 시간이 더 빠릅니다. 다시 입력해주세요.');
		return false;
	}
	if((leftTimeData[0] * 1 === rightTimeData[0] * 1) && (leftTimeData[1] * 1 === rightTimeData[1] * 1) ){
		alert('영업시작 시간과 영업종료 시간이 같습니다. 다시 입력해주세요.');
		return false;
	}
	
	console.log(leftTimeData[0] );
	console.log(leftTimeData[1] );
	console.log( rightTimeData[0]);
	console.log( rightTimeData[1]);
	
	
	console.log(leftTimeData[0] * 1);
	console.log(leftTimeData[1] * 1);
	console.log( rightTimeData[0] * 1);
	console.log( rightTimeData[1] * 1);
	
	
	return true;
	
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