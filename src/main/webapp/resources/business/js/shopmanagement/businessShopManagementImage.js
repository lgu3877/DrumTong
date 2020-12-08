// 가로 스크롤(horizontal scroll movement) > 영역 안에서 세로 스크롤 막음
$("#image-preview").on('mousewheel',function(e) {
	e.preventDefault();
	const wheelDelta = e.originalEvent.wheelDelta;
	if(wheelDelta > 0){
		$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

	}else{
		$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
	}
});


// 이미지 선택시 커버 이미지 출력(displaying cover image section)
// div 영역(input & view)
const imageInputForm = document.getElementById('shop-image-view');
const imageViewCon = document.getElementById('main-image-con');

// 이미지 src 입력 with DB에서 이미지 가져오기(Check whether there's a cover image or not (kick off DB work))
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