// viewer container
const wrapper = document.getElementById("viewr-wrapper");
const container = document.getElementById("viewer-container");
const viewers = document.getElementsByClassName("viewer");
const viewerCount = document.getElementsByClassName("viewer").length;

// viewer mover
const upViewer = document.querySelector(".viewer_up");
const downViewer = document.querySelector(".viewer_down");

// move to top
const topMover = document.querySelector(".move_top");

// slides
const slides = document.querySelectorAll(".h_right_lower_menu");

// variables
let view = 0; // 초기 위치값 (css > translateY 값 기준)
const execution = 100; // 스크롤 이동 값 > translateY (% 단위)


let isRunning = true; // 스크롤 슬라이드 이벤트 딜레이 변수


// scroll event + 시간 딜레이 (1.5초 설정)
container.onmousewheel = (e) => {
	if (isRunning) {
		// 스크롤 이벤트 딜레이
		isRunning = false; // (이벤트 실행불가)
		setTimeout(() => isRunning = true, 1000); // 1초 후 실행가능(true)

		scrollSlide(e); // 슬라이드 이동
		displayHeader(); // 반응형 헤더
		slideHover(); // 슬라이드 버튼 업데이트 (button visibility)
	}
}

// mouse over event > button visibility
container.onmouseenter = () => slideHover();

// mouse over event > button visibility
container.onmouseleave = () => slideOut();

// click event > up/down 이동
upViewer.onclick = (e) => clickSlideButton("up");
downViewer.onclick = (e) => clickSlideButton("down");

// click event > 최상단 이동
topMover.onclick = () => moveToTop();

// menu(slide) click event
clickSlideMenu();


// 스크롤 이동
function scrollSlide(event) {
	// 스크롤 데이터(Y축 이동 거린)
	const wheel = event.wheelDelta; // scroll movement value
	
	// wheel up
	if (wheel > 0) {
		if (view === 0) return;
		
//		view.viewValue(view, "inc");
		view = view + execution;
		
		for (let i = 0; i < viewers.length; i++) {
			const viewer = viewers[i];
			viewer.style.transform = "translateY(" + view + "%)";
		}
	}
	
	// wheel down
	else {
		const limit = (viewerCount - 1) * execution;
		if (view === -limit) return;
		
		view = view - execution;
		
		for (let i = 0; i < viewers.length; i++) {
			const viewer = viewers[i];
			viewer.style.transform = "translateY(" + view + "%)";
		}
	}
};


// 슬라이더에서 마우스가 들어왔을 때 (mouse enter)
function slideHover() {
	// 마지막 슬라이드 위치  > translateY % 값
	const limit = (viewerCount - 1) * execution;
	
	if (view === 0) {
		// down button
		downViewer.className.includes("visible") ?
			null : downViewer.classList.add("visible");
		
		// up button
		upViewer.className.includes("visible") ?
			upViewer.classList.remove("visible") : null;
			
		// move to top button
		topMover.className.includes("invisible") ?
			null : topMover.classList.add("invisible");
	}
	
	else if (view === -limit) {
		// down button
		downViewer.className.includes("visible") ?
			downViewer.classList.remove("visible") : null;
				
		// up button
		upViewer.className.includes("visible") ?
			null : upViewer.classList.add("visible");
		
		// move to top button
		topMover.className.includes("invisible") ?
			topMover.classList.remove("invisible") : null;
	}
	
	else {
		// up button
		downViewer.className.includes("visible") ?
			null : downViewer.classList.add("visible");

		// up button
		upViewer.className.includes("visible") ?
			null : upViewer.classList.add("visible");

		// move to top button
		topMover.className.includes("invisible") ?
			topMover.classList.remove("invisible") : null;
	}
}


// 슬라이더에서 마우스가 나왔을 때(mouse leave)
function slideOut() {
	upViewer.classList.remove("visible");
	downViewer.classList.remove("visible");
}


// 클릭 > 스크롤 위 아래 이동
function clickSlideButton(move) {
	switch(move) {
	case "up":
		if (view === 0) return;
		
		view = view + execution;
		
		for (let i = 0; i < viewers.length; i++) {
			const viewer = viewers[i];
			viewer.style.transform = "translateY(" + view + "%)";
		}
		break;
	case "down":
		const limit = (viewerCount - 1) * execution;
		if (view === -limit) return;
		
		view = view - execution;
		
		for (let i = 0; i < viewers.length; i++) {
			const viewer = viewers[i];
			viewer.style.transform = "translateY(" + view + "%)";
		}
		break;
	}
	
	slideHover();
}


// 최상단 이동
function moveToTop() {
	view = 0;
	
	for (let i = 0; i < viewers.length; i++) {
		const viewer = viewers[i];
		viewer.style.transform = "translateY(" + view + "%)";
	}
}


// 슬라이드 이동 메뉴
function clickSlideMenu() {
	for (let i = 0; i < slides.length; i++) {
		slides[i].onclick = (e) => {
			view = -i * 100;
			
			for (let j = 0; j < viewers.length; j++) {
				viewers[j].style.transform = "translateY(" + view + "%)";
			}
			
			slideHover(); // mouse hover event > 위 & 아래 이동 버튼
		}
	}
}


// 반응형 헤더
function displayHeader() {
	console.log(view);
	// 마지막 슬라이드 위치  > translateY % 값
	const limit = (viewerCount - 1) * execution;
	
	const rightMenu = document.querySelector(".h_right_con");
//	const upperMenu = document.querySelector(".h_right_upper");
//	const lowerMenu = document.querySelector(".h_right_lower");
	
	if (view === 0) {
//		wrapper.className.includes("wide_view") ? 
//			wrapoer.classList.remove("wide_view") : null;
		
		rightMenu.className.includes("pushUp") ? 
			rightMenu.classList.remove("pushUp") : null;	
	}
	
	else if (view === -limit) {
//		wrapper.className.includes("wide_view") ? 
//			null : wrapper.classList.add("wide_view");

		rightMenu.className.includes("pushUp") ? 
			null : rightMenu.classList.add("pushUp");
	}
	
	else {
//		wrapper.className.includes("wide_view") ? 
//			null : wrapper.classList.add("wide_view");

		rightMenu.className.includes("pushUp") ? 
			null : rightMenu.classList.add("pushUp");
	}
}


//const view = {
//get viewValue() {
//	return this._value || 0;
//},
//set viewValue(value, command) {
//	switch(command) {
//	case "inc":
//		this._value = value + execution;
//		break;
//	case "dec":
//		this._value = value - execution;
//		break;
//	}
//	console.log(num); // 이렇게 일괄적으로 디버깅 가능.
//	alert("123");
//}
//};