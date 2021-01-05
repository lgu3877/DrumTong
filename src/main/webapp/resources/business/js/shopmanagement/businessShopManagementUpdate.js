// 사진 업데이트
async function updatePhoto() {
	const formData = new FormData();
	
	const coverImage = document.getElementById("update-cover");
	const photoInputs = document.getElementsByName("storeimg");
	const fileList = [];
	
	for (let i = 0; i < photoInputs.length; i++) {
		if (photoInputs[i].files[0] !== undefined) {
			fileList.push(formDate.append("storeimg", photoInputs[i].files[0]));
//			fileList.push(photoInputs[i].files[0]);
		}
	}	

//	const object = {
//		"delegatephotoboolean" : coverImage.files[0],
//		"storeimg" : fileList,
//	};
	
	const object = {
		"mainImage" : formDate.append("delegatephotoboolean", coverImage.files[0]),
		"subImage" : fileList,
	};
	
	// result.data (es6 > obejct destructuring)
	const { data } = await axios.post(
		"/drumtong/business/mainmanagement/businessShopManagement/", 
		object, 
		{
			headers: {
				"Content-Type": `multipart/form-data`,
			}, 
		});
	
	console.log(data);
}

//매장 소개글 업데이트
async function updateIntro() {
	const text = document.getElementById("intro-text").innerText;
	
	const { data } = await axios.post("/drumtong/business/mainmanagement/businessShopManagement/", text);
	
	console.log(data);
}


// 서비스 등록 업데이트

function addService() {
	const list = document.getElementsByClassName("single_item_selector");
	const object = [];
	const classPrefix = ["first", "second", "third", "forth", "fifth"]
	
	for (let i = 0; i < list.length; i++) {
		// select (2) & input (3)
		const eachInput = list[i].getElementsByClassName(classPrefix[i] + '_item_prop')[0];
		console.log(eachInput);
		for (let j = 0; j < eachInput.length; j++) {
			const element = {
				
			};
		}
	}
}


// 배달 업데이트
async function updateDelivery() {
	const options = [...document.getElementsByClassName("returnOptions")]
		.filter((input) => input.checked)
		.map((input) => input.name);
	
	console.log(options);
	
	const { data } = await axios.post("/drumtong/business/mainmanagement/businessShopManagement/", options);
	
	console.log(data);
}