// horizontal scroll movement
$("#image-preview").on('mousewheel',function(e) {
	e.preventDefault();
	const wheelDelta = e.originalEvent.wheelDelta;
	if(wheelDelta > 0){
		$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

	}else{
		$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
	}
});


// Cover Photo File-name bar (incomplete)
//function checkFile() {
//	const fileName = document.getElementById('file-name');
//	if (!fileName.value) {
//		fileName.style.display = 'none';
//	} else {
//		fileName.style.display = '';
//	}
//	return true;
//}



// displaying cover image section
// elements for setting display option
const imageInputForm = document.getElementById('shop-image-view');
const imageViewCon = document.getElementById('main-image-con');

// Check whether there's a cover image or not (kick off DB work)
let img = document.getElementById('main-image');
const imgName = '1234.jpg';

// set cover-image here

// Cover image exists > view image
if (img.src) {
	imageInputForm.style.display = 'none';
	imageViewCon.style.display = '';
}
// No cover image > show input from
else {
	imageInputForm.style.display = '';
	imageViewCon.style.display = 'none';
}




// swipe cover image view > swipeViewImage()
const subImageList = document.getElementsByClassName('shop_picture');
for (let i = 0; i < subImageList.length; i++) {
	// swipe view image
	subImageList[i].children[0].addEventListener('click', function(e) {
		imageInputForm.style.display = 'none';
		imageViewCon.style.display = '';
		img.src = subImageList[i].children[0].src;	
	});
	// delete image from list
	subImageList[i].children[1].addEventListener('click', function(e) {
		const result = confirm("사진을 삭제하시겠습니까?");
		if (result) {
			// remove image file from database
			document.getElementById("image-preview").removeChild(subImageList[i]);
			// refresh current page because of `sumImageList` index problem
			window.location.reload(true);
		}
	});
}


// verify whether uploaded file is img(jpg, png, jpeg) or not 
// if it's an image file, execute db registeration
function imageCheck(id) {
	let imageFileName = document.getElementById(id).value;
	const imageType = imageFileName.substr(imageFileName.length - 3, imageFileName.length);
	let isImage = false;

	if (imageType === 'jpg' || imageType === 'png' || imageType === 'jpeg') {
		isImage = true;
	}
	
	if (isImage) {
		const answer = confirm("등록하신 사진을 매장 메인 사진으로 사용하시겠습니까?");
		if (answer) {
			// pass to DB for upload
		}
		else {
			// hang the request
		}
	}	
	else {
		// deny uploading request
		alert("선택하신 파일은 이미지 파일이 아닙니다.\n" +
			  "(jpg, png 형식의 파일을 등록해주세요.)");
		document.getElementById(id).value = '';
	}
}


// Test Introduction Modal
const introModal = document.getElementById('intro-modal');
const introBtn = document.getElementById('intro-modal-btn');
const closeSpan = document.getElementsByClassName('intro_close')[0];                                          

introBtn.addEventListener('click', function(e) {
	introModal.style.display = "block";	
});

closeSpan.onclick = function() {
	introModal.style.display = "none";
}

window.onclick = function(e) {
    if (e.target == introModal) {
    	introModal.style.display = "none";
    }
}


// default text
document.getElementsByClassName('store_intro_input')[0].value
	= document.getElementsByClassName('shop_text_view')[0].innerHTML.trim();


// confirm writing intro
function comfirmIntro() {
	const modalText = document.getElementsByClassName('store_intro_input')[0];
	const mainText = document.getElementsByClassName('shop_text_view')[0];
	const answer = confirm("작성한 메세지를 반영하시겠습니까?");
	if (!answer) {
		modalText.value = '';
	}
	else {
		mainText.innerHTML = modalText.value;
		introModal.style.display = '';	
	}
}


