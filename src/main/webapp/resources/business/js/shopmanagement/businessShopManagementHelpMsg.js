const helpMessages = [
	"photo-help",
	"intro-help",
	"intro-help",
	"post-help",
	"return-help"
];

function helpMsg(idArray) {
	helpMessages.forEach((element, index, array) => {
		console.log(element, index, array);
		document.getElementById(element).addEventListener("mouseover", (e) => {
			document.getElementById(`${element}-msg`).classList.add("help_msg");
		});
		document.getElementById(element).addEventListener("mouseout", (e) => {
//			document.getElementById(`${element}-msg`).classList.remove("help_msg");
		});
	});
	
}

helpMsg(helpMessages);