let hourInputs = document.getElementsByClassName("hour");


// 시간 Input 텍스트에 onblur 익명함수를 걸어준다.
for(let i =0; i< hourInputs.length; i++) {
	hourInputs[i].onblur = function (e) {
		let hourValue = e.target.value;
		
		let radioAM = e.target.previousSibling.previousSibling.querySelectorAll('.time_zone_input')[0];
		let radioPM = e.target.previousSibling.previousSibling.querySelectorAll('.time_zone_input')[1];
		
		let buttonAM = e.target.previousSibling.previousSibling.querySelectorAll('.time_zone_btn')[0];
		let buttonPM = e.target.previousSibling.previousSibling.querySelectorAll('.time_zone_btn')[1];
		
		
		 
		const timeZoneBtn = document.getElementsByClassName("time_zone_btn");
		// 시간이 13부터는 해당 텍스트의 오전/오후를 오후로 바꾸어주며 
		// 해당 시간에서 -12를 해준다.
		
		
		// 시간에 24를 입력했을 시에  오후 11시 59분으로 교체해줍니다.
		if (hourValue === "24") {
			e.target.value = hourValue-13;
			e.target.nextSibling.nextSibling.value = 59;
			
			radioPM.checked = true;
			buttonAM.style.backgroundColor = "#95e1d3";
			buttonPM.style.backgroundColor = "navy";
		
		// 입력한 값이 12시보다 크면 버튼을 오후로 변경시켜주고 입력한 시간에 -12를 해준다.
		} else if(hourValue > 12) {
			e.target.value = hourValue-12;
			radioPM.checked = true;
			buttonAM.style.backgroundColor = "#95e1d3";
			buttonPM.style.backgroundColor = "navy";
		
		// 오후버튼이 체크되어있지 않은 상태에서 12보다 작은 값이 입력되면  오전버튼을 체크해준다. 
		} else if (!radioPM.checked && hourValue < 12){
			radioAM.checked = true;
			buttonAM.style.backgroundColor = "navy";
			buttonPM.style.backgroundColor = "#95e1d3";
			
		// 오전버튼이 체크되어있지 않고 오후 버튼이 체크되어있지 않은 상태에서 12값이 입력되면 오후버튼을 체크해준다.
		// 이렇게 하는 이유는 통상적으로 12를 입력했을 때 오전보다는 오후12시를 입력할려는 고객의 빈도가 높을 것이라고 예상하기 때문이다.
		} else if(!radioAM.checked && !radioPM.checked && hourValue === "12") {
			e.target.nextSibling.nextSibling.value = "00";
			radioPM.checked = true;
			buttonAM.style.backgroundColor = "#95e1d3";
			buttonPM.style.backgroundColor = "navy";
		} 
		console.log(radioAM.checked);
		console.log(radioPM.checked);
	
		
	};
	
	
}



// 전에 있는 버튼을 저장하는 값입니다. checkBtn의 색깔을 바꿀 때 사용합니다.
// var를 사용해서 전에 있는 버튼 값을 저장해주는 역할을 해줍니다.
var previousButton = document.getElementById("weekendBoth-btn");


// checkbox 체크 옵션  [건욱]
function checkOption(id) {	
	
	// 전에 있던 버튼의 색깔은 원래 색깔로 돌려줍니다.
	previousButton.style.backgroundColor = "#f38181";
	
	const checkbox = document.getElementById(id);
	const button = document.getElementById(id + "-btn");
	
	// 클릭한 버튼의 색깔을 navy색깔로 변경해주고 input radio의 체크를 true로 바꾸어줍니다.
	button.style.backgroundColor = "navy";
	checkbox.checked = true;
	
	
	// id 값에 따라 보여주는 뷰를 변경해줍니다.	
	configurationScheduleTimeViewDependingOnDays(id);
	
	// 지금의 버튼 값을 이전 버튼 값에 저장해주어서 다음에 불러올 때  이 버튼의 색상을 변경해줍니다.
	previousButton = button;
		
}

// [건욱] 주말 설정에 대한 유동적으로 뷰를 변경할 수 있는 함수입니다 [건욱]
function configurationScheduleTimeViewDependingOnDays (id) {
	
	switch(id) {
		case "weekendBoth" :
			loopHideAndViewScheduleTimeDiv(0, 3, false);
			break;
		case "weekendSat" :
			hideAndViewScheduleTimeDiv(true, 2);
			hideAndViewScheduleTimeDiv(false, 1);
			break;
		case "weekendSun" :
			hideAndViewScheduleTimeDiv(true, 1);
			hideAndViewScheduleTimeDiv(false, 2);
			break;
	}
	
}

// display 함수에 대한 배열 함수입니다. [건욱]
// startNum은 시작하고자하는 시작 숫자이고 looptime은 반복횟수 boolean은 보여주냐 안보여주냐에 대한 불린 여부입니다.
function loopHideAndViewScheduleTimeDiv(startNum, loopTime, boolean) {
	for(let lt = startNum; lt < loopTime; lt ++)
		hideAndViewScheduleTimeDiv(boolean, lt);
}


// 고객의 설정에 따라서 display를 보여주거나 안보여주게 해주는 함수입니다. [건욱]
function hideAndViewScheduleTimeDiv(boolean, index) {
	
	if(boolean){
		document.getElementsByClassName('time_range')[index].style.display = 'none';
		document.getElementsByClassName('day_range')[index].style.display = 'none';
	}
	else {
		document.getElementsByClassName('time_range')[index].style.display = '';
		document.getElementsByClassName('day_range')[index].style.display = '';
	}
	
}


// radio 체크 옵션
// [건욱] 버튼의 옵션에 따라서 사용자에게 보여지는 View를 달리 보여줍니다.
function radioSelect(id) {
	document.getElementById(id).checked = true;

	switch(id) {
	case "week-only":
		document.getElementById(id + "-btn").style.backgroundColor = "navy";
		document.getElementById("weekend-also-btn").style.backgroundColor = "#f38181";	
		hideAndViewScheduleTimeDiv(true, 1);
		hideAndViewScheduleTimeDiv(true, 2);
		break;
	case "weekend-also":
		document.getElementById(id + "-btn").style.backgroundColor = "navy";
		document.getElementById("week-only-btn").style.backgroundColor = "#f38181";
		document.getElementById("weekendBoth-btn").style.backgroundColor = "navy";
		hideAndViewScheduleTimeDiv(false, 1);
		hideAndViewScheduleTimeDiv(false, 2);
		break;
	}
}


// radio 버튼 이벤트 생성	>	checkbox disabled 속성 변경
const radioBtns = document.getElementsByClassName("radioBtn");

for (let i = 0; i < radioBtns.length; i++) {
	radioBtns[i].addEventListener('click', () => {
	
		const filter = document.getElementById('weekend-also').checked;
		const checkboxs = document.getElementsByClassName("checkBtn");
		const checkboxInput = document.getElementsByClassName("checkbox_con")[0].getElementsByTagName("input");
		const container = document.getElementsByClassName("checkbox_con")[0];
		
		if (filter === true) {
			container.style.height = "30px";
			for (let i = 0; i < checkboxs.length; i++) {
				checkboxs[i].removeAttribute("disabled");
				checkboxs[i].style.backgroundColor = "#f38181";
			}
			document.getElementById('weekendBoth-btn').style.backgroundColor = "navy";
			document.getElementById('weekendBoth').checked = true;
		} 
		else {
			container.style.height = "";
			for (let i = 0; i < checkboxs.length; i++) {
				checkboxs[i].setAttribute("disabled", "disabled");
				checkboxInput[i].checked = false;
				checkboxs[i].style.backgroundColor = "inherit";
			}		
		}
	 
	
	});
}

// 시간 입력 input > 그림자 & 에니메이션 클래스 속성 부여
const timeInput = document.getElementsByClassName("input_time_con")[0].getElementsByTagName("input");

for (let i = 0; i < timeInput.length; i ++) {
	if(timeInput[i].type === "number") timeInput[i].classList.add("shadow");
}

// 시간(1~12) & 분(0~59)
const hourInput = document.getElementsByName("hour");
const minuteInput = document.getElementsByName("minute");

for (let i = 0; i < hourInput.length; i ++) {
	hourInput[i].addEventListener("keyup", function(e) {
		e.preventDefault();
		if (e.target.value <= 0 || e.target.value > 24) e.target.value = ""; 
	})
	minuteInput[i].addEventListener("keyup", function(e) {
		e.preventDefault();
		if (e.target.value < 0 || e.target.value > 59) e.target.value = ""; 
	})
	
}

// 오전 & 오후 선택 옵션
const allRadio = document.getElementsByClassName("time_zone_input");
const allRadioBtn = document.getElementsByClassName("time_zone_btn");

for (let i = 0; i < allRadioBtn.length; i++) {
	allRadioBtn[i].addEventListener("click", function(e) {
		// button > radio 체크 연결
		const radio = e.target.parentElement.getElementsByTagName("input")[0];
		radio.checked = true;
		
		// 버튼 색 기본값으로 변경
		const buttons = e.target.parentElement.parentElement.getElementsByClassName("time_zone_btn");
		for (let i = 0; i < buttons.length; i++) {
			buttons[i].style.backgroundColor = "#95e1d3";
		}
		e.target.style.backgroundColor = "navy";
	})
}


// 초기화 혹은 24시간 값을 넣어주는 함수입니다.
function clearInputs(obj) {
	
	// 해당 버튼에 id 값을 사용해서 clear를 줄 것인지 fullHour를 줄 것인지 판단한다.
	obj.id === "" ? obj.id = "on" : obj.id = "";
	
	const form = obj.parentNode.parentNode;	
	const inputs = form.getElementsByClassName("time_input");
	const radios = form.getElementsByClassName("time_zone_input");
	const buttons = form.getElementsByClassName("time_zone_btn");
	
	
	if(obj.id === "on" )
		// 24시간 클릭 버튼 이벤트 함수 [건욱]
		fullHours(inputs, buttons,radios);
	else 
		clearScheduleTimeElements(inputs, radios, buttons)
	
	
	
	
	
}

// 스케쥴 타임에 대한 엘리먼츠 값들을 초기화시켜줍니다.
function clearScheduleTimeElements(inputs, radios, buttons) {
	// input 초기화
	for (let i = 0; i < inputs.length; i++) {
		inputs[i].value = "";
	}

	// radio 초기화
	for (let i = 0; i < radios.length; i++) {
		if (radios[i].checked === true) {
			radios[i].checked = false;
		}
	}
	
	// 버튼 색 초기화
	for (let i = 0; i < buttons.length; i++) {
		buttons[i].style.backgroundColor = "#95e1d3";
	}	
}

// 24시간 클릭 버튼 이벤트 함수 [건욱]
function fullHours(inputs, buttons, radios) {
	
   // 24시간 시간배열
   let timeset = ["12", "00", "11", "59"];
   let index = 0;

	// foreach문으로 시간을 넣어줍니다.
	timeset.forEach(function(element){
		inputs[index].value = element;
		index++;
	});
	
	
	// 버튼 색깔을 입혀줍니다.
	for(let i = 0; i < buttons.length; i++) {
		if(i === 0 || i === 3)
			buttons[i].style.backgroundColor = "navy";
		else
			buttons[i].style.backgroundColor = "#95e1d3";
	}
	
	// radio 체크 오전 오후 값의 여부를 입력해줍니다.
	for(let i = 0; i < radios.length; i++) {
		if(i === 0 || i === 3)
			radios[i].checked = true;
	}
}
