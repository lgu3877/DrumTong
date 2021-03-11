//exceptionCheckBScheduleTime();

function exceptionCheckBScheduleTime() {
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
	
	return object;
}


function exceptionCheckBScheduleDays() {
	const dataLength = document.getElementById('reg-holiday-schedule').children.length;
	
	if(dataLength === 0 ){
		if(confirm("정기 휴무 설정에 데이터가 하나도 들어가있지 않습니다. 이대로 진행하시겠습니까?"))
			return true 
		else {
			warning("해당 영역으로 이동하겠습니다.", "reg-holiday-week", false);
			return false;
		}
			
	}
		
	return true;
}




// 유저에게 잘못된 데이터 형식 혹은 빈 값을 넣었을 때 인지할 수 있게 해주는 함수입니다.
function warning(msg, idName, wantBorder) {
	document.getElementById(idName).style.border = wantBorder ? '4px solid red'  : "";
	alert(msg);
	document.getElementById(idName).scrollIntoView();
}

// 경고 효과를 없애줍니다.
function borderNone(idName) {
	document.getElementById(idName).style.border = '0 none';
}


async function checkExceptionBeforeSubmit() {
		console.log("status : " , status);
		if(!await updateScheduleTime())
			return false;
		if(!await updateRegHoliday())
			return false;
		
		const result = statusChange("SUCCESS");
		console.log("statusChange에 대한 결과 : ", result);
		
		if(result) {
			window.location.assign("http://localhost:8080/drumtong/business/");
			alert("온라인 계약이 성공적으로 마무리되었습니다!");
//			window.location.reload(true);
		}
		
}
window.onbeforeunload = function() { 
    window.setTimeout(function () { 
        window.location = 'AAA.jsp';
    }, 0); 
    window.onbeforeunload = null; // necessary to prevent infinite loop, that kills your browser 
}



