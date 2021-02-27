// viewer container
const container = document.getElementById("viewer-container");
const viewers = document.getElementsByClassName("viewer");
const viewerCount = document.getElementsByClassName("viewer").length;

let view = 0;
const execution = 100;


// scroll event
container.onmousewheel = (e) => {
	const wheel = e.wheelDelta; // scroll movement value
	console.log(wheel);
	
	// wheel up
	if (wheel > 0) {
		if (view === 0) return ;
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