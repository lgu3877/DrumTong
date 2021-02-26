

const wrapper = document.getElementById("viewer-wrapper");

wrapper.addEventListener("mousewheel", function(e) {
	console.log(e.wheelDelta);

	const wheel = e.wheelDelta; // scroll movement value
	
	// wheel up
	if (wheel > 0)
		console.log("scroll up");
		
	// wheel down
	else {
		console.log("scroll down");
	}
});