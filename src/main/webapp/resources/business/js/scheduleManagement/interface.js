function checkOption(id) {
	const checked = document.getElementById(id).checked;
	checked === false ? 
		document.getElementById(id).checked = true : 
		document.getElementById(id).checked = false;	
	
}

function radioSelect(id) {
	document.getElementById(id).checked = true;
}

function filterCheckbox(checkId, targetClass) {
	const filter = document.getElementById(checkId).checked;
	const targets = document.getElementsByClassName(targetClass);
	
	console.log(filter);
	console.log(targets);
	
	if (filter === "checked") {
		for (let i = 0; i < targets.length; i++) {
			targets[i].removeAttribute("disabled");
		}
	} 
	else {
		for (let i = 0; i < targets.length; i++) {
			targets[i].setAttribute("disabled", "disabled");
		}		
	}
}