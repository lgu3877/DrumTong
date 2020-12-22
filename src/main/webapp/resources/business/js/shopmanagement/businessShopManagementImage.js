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


// 이미지 선택시 커버 이미지 출력
function imageShow() {
	const imageInputForm = document.getElementById('shop-image-view');
	const imageViewCon = document.getElementById('main-image-con');
	
	// 이미지 src 입력 > DB에서 이미지 가져오기
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
}

// 매장 사진 슬라이드 인터페이스	>	swipe cover image view > swipeViewImage()
function sliderEvent() {	
	const subImageList = document.getElementsByClassName('shop_picture');
	for (let i = 0; i < subImageList.length; i++) {
		// 슬라이드 사진 클릭
		subImageList[i].children[0].addEventListener('click', function(e) {
			imageInputForm.style.display = 'none';
			imageViewCon.style.display = '';
			img.src = subImageList[i].children[0].src;
			clickedPhoto = subImageList[i].children[0].src;
		
			zoomInPhoto(clickedPhoto);
		});
	
		// 슬라이드 사진 지우기(X 아이콘 클릭)
		subImageList[i].children[1].addEventListener('click', function(e) {
			const result = confirm("사진을 삭제하시겠습니까?");
			if (result) {
				// 선택된 사진 지우기 > 임시로 JS로 처리 > DB 작업 필요
				clickedPhoto = subImageList[i].children[0].src;
				deletePhoto(clickedPhoto);
			}
	});
	}
}

// 이벤트 초기화를 위한 삭제
function removeSliderEvent() {	
	const subImageList = document.getElementsByClassName('shop_picture');
	for (let i = 0; i < subImageList.length; i++) {
		// 슬라이드 사진 클릭
		subImageList[i].children[0].removeEventListener('click', function(e) {
			imageInputForm.style.display = 'none';
			imageViewCon.style.display = '';
			img.src = subImageList[i].children[0].src;
			clickedPhoto = subImageList[i].children[0].src;
		
			zoomInPhoto(clickedPhoto);
		});
	
		// 슬라이드 사진 지우기(X 아이콘 클릭)
		subImageList[i].children[1].removeEventListener('click', function(e) {
			const result = confirm("사진을 삭제하시겠습니까?");
			if (result) {
				// 선택된 사진 지우기 > 임시로 JS로 처리 > DB 작업 필요
				clickedPhoto = subImageList[i].children[0].src;
				deletePhoto(clickedPhoto);
			}
	});
	}
}

// 슬라이드 사진 클릭 > 줌인
function zoomInPhoto(clickedPhoto) {
	const photoSlideCon = document.getElementById("image-preview");
	const photoList = [...document.getElementsByClassName("shop_picture")];
	
	// 줌인
	for (let index = 0; index < photoList.length; index++) {
		if (photoList[index].children[0].src === clickedPhoto) {
			console.log(photoList[index].children[0]);
			photoList[index].children[0].style.transform = "scale(1.08)";
			photoList[index].children[0].style.border = "1px solid black";
			photoList[index].children[0].style.opacity = "1";
		}
		else {
			photoList[index].children[0].style.transform = "scale(1)";
			photoList[index].children[0].style.border = "";			
			photoList[index].children[0].style.opacity = "0.7";
		}
	}
}

// 슬라이드 사진 지우기(X 아이콘 클릭)
function deletePhoto(clickedPhoto) {
	const photoSlideCon = document.getElementById("image-preview");
	let photoList = [...document.getElementsByClassName("shop_picture")];
	
	// 삭제 > DB작업 필요
	for (let index = 0; index < photoList.length; index++) {
		if (photoList[index].children[0].src === clickedPhoto) {
			photoList.splice(index, 1);
			console.log(photoList.length);
			break;
		}
	}
	
	// 리스트 초기화
	photoSlideCon.innerHTML = "";
	
	// 리스트 재구성
	for (let i = 0; i < photoList.length; i++) {
		photoSlideCon.appendChild(photoList[i]);
	}
}


// 이미지 업로드 시 확장자 확인
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

// 초기 실행
sliderEvent();
imageShow();