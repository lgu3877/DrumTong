// viewer container
const wrapper = document.getElementById("viewr-wrapper");
const container = document.getElementById("viewer-container");
const viewers = document.getElementsByClassName("viewer");
const viewerCount = document.getElementsByClassName("viewer").length;

// viewer mover
const upViewer = document.querySelector(".viewer_up");
const downViewer = document.querySelector(".viewer_down");

let view = 0; // 초기 위치값 (css > translateY 값 기준)
const execution = 100; // 스크롤 이동 값 > translateY (% 단위)

let isRunning = true; // 스크롤 슬라이드 이벤트 딜레이 변수


// scroll event + 시간 딜레이 (1.5초 설정)
container.onmousewheel = (e) => {
	if (isRunning) {
		// 스크롤 이벤트 딜레이
		isRunning = false; // (이벤트 실행불가)
		setTimeout(() => isRunning = true, 1500); // 1초 후 실행가능(true)

		scrollSlide(e);
		slideHover(); // 슬라이드 버튼 업데이트 (button visibility)
	}
}

// mouse over event > button visibility
container.onmouseenter = () => slideHover();

// mouse over event > button visibility
container.onmouseleave = () => slideOut();

// click event > up/down 이동
upViewer.onclick = (e) => clickSlideButton(e.target);
downViewer.onclick = (e) => clickSlideButton(e.target);



// 스크롤 이동
function scrollSlide(event) {
	// 스크롤 데이터(Y축 이동 거린)
	const wheel = event.wheelDelta; // scroll movement value
	
	// wheel up
	if (wheel > 0) {
		if (view === 0) return;
		
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


// 클릭 > 스크롤 위 아래 이동
function slideHover() {
	console.log("123");
	// 마지막 슬라이드 위치  > translateY % 값
	const limit = (viewerCount - 1) * execution;
	
	if (view === 0) {
		// down button
		downViewer.className.includes("visible") ?
			null : downViewer.classList.add("visible");
		
		// up button
		upViewer.className.includes("visible") ?
			upViewer.classList.remove("visible") : null;
	}
	
	else if (view === -limit) {
		// down button
		downViewer.className.includes("visible") ?
			downViewer.classList.remove("visible") : null;
				
		// up button
		upViewer.className.includes("visible") ?
			null : upViewer.classList.add("visible");
	}
	
	else {
		// up button
		downViewer.className.includes("visible") ?
			null : downViewer.classList.add("visible");

		// up button
		upViewer.className.includes("visible") ?
			null : upViewer.classList.add("visible");
	}
}

// 슬라이더에서 마우스가 나왔을 때(mouse leave)
function slideOut() {
	upViewer.classList.remove("visible");
	downViewer.classList.remove("visible");
}

// 클릭 > 스크롤 위 아래 이동
function clickSlideButton(button) {
	console.log(button);
	
	const limit = (viewerCount - 1) * execution;

	if (view === 0) {
		console.log(view);
		
		// class remove
		downViewer.classList.remove("invisible");
		
		// class add
		upViewer.classList.add("invisible");
	}
	
	else if (view === -limit) {
		console.log(view);
		// class remove
		upViewer.classList.remove("invisible");

		// class add
		downViewer.classList.add("invisible");
	}
	
	else {
		console.log(view);
		// class add
		downViewer.classList.remove("invisible");
		upViewer.classList.remove("invisible");
	}
}