// viewer container
const container = document.getElementById("viewer-container");

const initializer = document.getElementsByClassName("viewer").length * 100;



// scroll event
container.onmousewheel = (e) => {
	const wheel = e.wheelDelta; // scroll movement value
//	console.log(wheel);
	
	const execution = 100;
	
	// wheel up
	if (wheel > 0) {
		console.log("scroll up");
		
		
		container.style.transform = "translateY(" + execution + "vh)";
	}

	// wheel down
	else {
		
		console.log("scroll down");

		container.style.transform = "translateY(-" + execution + "vh)";
//		container.style.transform = "translateY(-" + indicator + "vh)";
	}
};