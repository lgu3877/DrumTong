async function updateScheduleTime() {
	
	let result = false;
	
	const object = exceptionCheckBScheduleTime();
	console.log(object);
	if(!object)
		return Promise.resolve(false);
		
	const { data } = await axios.post("/drumtong/business/mainmanagement/BScheduleTime/rest/updateBScheduleTime/", object);
	
	if(status === "SUCCESS" &&  data) {
		alert('성공적으로 입력이 완료되었습니다.');
	}
	else if(!data) {
		alert('서버 오류가 발생했습니다.')
	}
	return true;
	
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
	if(exceptionCheckBScheduleDays() === false)
		return false;
	
	let dbFields = ["firstweek", "secondweek", "thridweek", "fourthweek", "fifthweek", "sixthweek"];
	
	
	let keys = Object.keys(bscheduledays);
	
	console.log(keys);
	
	for(let key in bscheduledays){
		dbFields.forEach((el, i) => {
			if(el === key){
				dbFields.splice(i, 1);
				return;
			} 
		});
	}
	
	dbFields.forEach((el, i) => {
		bscheduledays[el] = "-";
	});
	
	
	console.log(bscheduledays);
	
	const { data } = await axios.post("/drumtong/business/mainmanagement/BScheduleDays/rest/updateBScheduleDays/", bscheduledays);

	if (data) {
		bscheduledays = data; // 데이터 덮어씌우기
		delete bscheduledays.estid;
	
		// 정기휴무 뷰 업데이트
		document.getElementById("reg-holiday-schedule").innerHTML = ""; // 정기휴무 리스트 초기화
		displayRegHolidays(); // 정기휴무 리스트 다시 출력

		// selct & checkbox 초기화
		initializeRegInput();
		
		// 캘린더 업데이트
		document.getElementById("calendar-days").innerHTML = ""; 
		document.getElementById("year-value").innerHTML = currentYear; 
		document.getElementById("month-value").innerHTML = currentMonth; 
		loadDays(currentYear, currentMonth, currentDate);
		// renderCalendar();
	}
	
	else {
		alert("잘못된 입력입니다.");
	}
	return true;
	
	
	
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
		beginday : startDate, 
		endday : endDate,
		reason : reason,
	}
	
	const { data } = await axios.post("/drumtong/business/mainmanagement/BTempSuspension/rest/insertBTempSuspension/", object);
	if(data) {
		alert('성공적으로 입력이 완료되었습니다.');
		
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
	else {
		alert('서버 오류가 발생했습니다.')
	}
	
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
		const dateReg = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		
		// 사유
		const reason = list.getElementsByClassName("reason_view_default")[0].innerHTML;
			
		const object = {
			beginday: startDay,
			endday : endDay,
			reason: reason || ""
		}
		
		if (dateReg.test(startDay) && dateReg.test(endDay)) {
			const { data } = await axios.post("/drumtong/business/mainmanagement/BTempSuspension/rest/deleteBTempSuspension/", object);
			
			
			if(data) {
				alert('성공적으로 삭제가 완료되었습니다.');
				
				btempsuspension = data;
			
			
				// view 초기화 > 업데이트(리스트 & 버튼)
				document.getElementById("schedule-container").innerHTML = ""; // 초기화
				displayTmpHoliday(); // list 출력
				hideModiIcons(); // 수정 관련 버튼 숨기기
			
			}
			else {
				alert('서버 오류가 발생했습니다.')
			}
			
			
		}
	}
}



// 임시휴무 단일 업데이트
async function postSchedule(list) {
	// 일자 (시작일 ~ 마지막일)
	console.log(list);
	const startDay= list.getElementsByClassName("list_start_day")[0].innerHTML;
	const endDay= list.getElementsByClassName("list_end_day")[0].innerHTML;
	
	const updatebeginday  = list.getElementsByClassName("period_start")[0].value;
	const updateendday  = list.getElementsByClassName("period_end")[0].value;	
	
	// 동의
	const agree = confirm("수정하신 내용을 반영하시겠습니까?");
	
	if (agree) {
		// 정규식 > validation (잘짜 & 텍스트)
		const dateReg = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		
		// 사유
		const reason = list.getElementsByClassName("reason_view_input")[0].value;
			
			const object = {
				updatebeginday : updatebeginday,
				updateendday : updateendday,
				beginday : startDay, 
				endday : endDay,
				reason : reason,
			}
		
		if (dateReg.test(startDay) && dateReg.test(endDay)) {
			const { data } = await axios.post("/drumtong/business/mainmanagement/BTempSuspension/rest/updateBTempSuspension/", object);
			btempsuspension = data;
			
			console.log(data);
			console.log(btempsuspension);
			
			alert('성공쩍으로 수정되었습니다.');
			
			// view 초기화 > 업데이트(리스트 & 버튼)
			document.getElementById("schedule-container").innerHTML = ""; // 초기화
			displayTmpHoliday(); // list 출력
			hideModiIcons(); // 수정 관련 버튼 숨기기
		}
		else {
			alert("형식에 맞지 않은 데이터입니다..!");
		}
	}
}

async function statusChange(param) {
	console.log(selectESTID);
	const object = {
		estid : selectESTID,
		status : param,
	}
	const { data } = await axios.post("/drumtong/business/mainmanagement/BInformation/rest/changeShopStatus/", object);
	console.log('statusChangeResult : ' , data);
	
	return data;
}