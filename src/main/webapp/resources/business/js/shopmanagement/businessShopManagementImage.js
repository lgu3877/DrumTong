// 업로드로 추가된 사진 > 업로드 할 파일 임시 저장
const uploadPhotoList = {
	originalCover: document.getElementById("cover-image") ? document.getElementById("cover-image").src : "",
	uploadCover: "",
	uploadPhoto: [],
}

// 업로드 과정 중 삭제된 사진 이름 배열 > DB에서 이름 비교 후 저장 권장
const deletedUploadFileNames = [];

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
   const postedMainImage = document.getElementById("cover-image").src;
   let img = document.getElementById('main-image');
   
   // 대표사진이 있을 경우 > 해당 사진 미리보기
   if (postedMainImage && !img.src) {
      imageInputForm.style.display = 'none';
      imageViewCon.style.display = '';
      
      img.src = postedMainImage;
      zoomInPhoto(img.src);
   }
   // 없을 경우 > default
   else {
      imageInputForm.style.display = '';
      imageViewCon.style.display = 'none';
   }   
}

// 매장 사진 슬라이드 인터페이스   >   swipe cover image view > swipeViewImage()
function sliderEvent() {   
   const subImageList = document.getElementsByClassName('shop_picture');
   for (let i = 0; i < subImageList.length; i++) {
      const clickedPhoto = subImageList[i].children[0].src
            
      // 슬라이드 사진 클릭
      subImageList[i].children[0].addEventListener('click', () => zoomInPhoto(clickedPhoto));
   
      // 슬라이드 사진 지우기(X 아이콘 클릭)
      subImageList[i].children[1].addEventListener('click', () => deletePhoto(clickedPhoto));      
   }
}


// 슬라이드 사진 클릭 > 줌인
function zoomInPhoto(clickedPhoto) {
   const photoSlideCon = document.getElementById("image-preview");
   const photoList = [...document.getElementsByClassName("shop_picture")];
   
   const imageInputForm = document.getElementById('shop-image-view');
   const imageViewCon = document.getElementById('main-image-con');
   let img = document.getElementById('main-image');
   
   imageInputForm.style.display = 'none';
   imageViewCon.style.display = '';
   img.src = clickedPhoto;
   
   // 줌인
   for (let index = 0; index < photoList.length; index++) {
      if (photoList[index].children[0].src === clickedPhoto) {
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



//이미지 업로드
function imageCheck(e) {
	const input = e.target;
	const imageType = input.value.substr(input.value.length - 3, input.value.length).toLocaleLowerCase();
	
	const isImage = imageType === 'jpg' 
			|| imageType === 'png' 
			|| imageType === 'jpeg' ? true : false
					
// 이미지 확장자 검사 (jpg, png, jpng)
	if (!isImage) {   
		alert("선택하신 파일은 적합한 이미지 파일이 아닙니다.\n" + "(jpg, png, jpng 형식의 파일을 등록해주세요.)");
		e.target.clear; // input value(file) 초기화
		return;
	}
	
// 커버 사진 업로드
	if (isImage && e.target.id === "update-cover") {
		// 미리보기
		const reader = new FileReader();
		// 대표사진이 있을 경우 삭제
		document.getElementById("cover-image-con") ? document.getElementById("cover-image-con").remove() : null;
		
		// 이미지 주입
		reader.onload = (e) => {
			// 태그 생성
			const li = document.createElement("li");
			li.className = "shop_picture";
			li.id = "cover-image-con";
			const icon = document.createElement("i");
			icon.className = "fas fa-times";
			const repIcon = document.createElement("i");
			repIcon.className = "fas fa-star";
			repIcon.innerHTML = "<span>대표사진</span>";
			const img = document.createElement("img");
			img.setAttribute("src", e.target.result);
			img.setAttribute("alt", "");
			img.setAttribute("id", "cover-image");
			
			// 업로드한 '커버'사진 src 저장 > 삭제 시 비교 > value에서 삭제
			uploadPhotoList.uploadCover = e.target.result; // string
			
			// 추가
			li.appendChild(img);
			li.appendChild(icon);
			li.appendChild(repIcon);
			
			// 이벤트 주입
			li.children[0].addEventListener('click', () => zoomInPhoto(e.target.result));
			li.children[1].addEventListener('click', () => deletePhoto(e.target.result));
			
			// 전체 폼 삽입
			document.getElementById("image-preview").prepend(li);
			
			// 미리보기
			const clickedImage = document.getElementById("cover-image").src;
			zoomInPhoto(clickedImage);
		}
		reader.readAsDataURL(e.target.files[0]);
	}
// 일반 사진 업로드
	else {
		let count = 0;
		
		for (let img of e.target.files) {
			// 미리보기
			const reader = new FileReader();
			
			reader.onload = (e) => {
				// 태그 생성
				const li = document.createElement("li");
				li.className = "shop_picture";
				const icon = document.createElement("i");
				icon.className = "fas fa-times";
				const img = document.createElement("img");
				img.setAttribute("src", e.target.result);
				img.setAttribute("alt", "");
				
				// 임시 저장
				obj = {
					id: input.id,
					src: e.target.result,
				}
//				uploadPhotoList.uploadPhoto.push(e.target.result);
				uploadPhotoList.uploadPhoto.push(obj);
				
				
				// 구성
				li.appendChild(img);
				li.appendChild(icon);
				
				// 이벤트 주입
				li.children[0].addEventListener('click', () => zoomInPhoto(e.target.result));
				li.children[1].addEventListener('click', () => deletePhoto(e.target.result));
				
				// 삽입
				document.getElementById("image-preview").appendChild(li);
				
				count++;
				if (count === 1) {
					zoomInPhoto(e.target.result);
				}
			}
			reader.readAsDataURL(img);         
		}
		// label & input 숨기기(display: none) > 새로운 label & input 생성
		hideLabel(e.target.id + "label");
	}
}



// 슬라이드 사진 지우기(X 아이콘 클릭)
function deletePhoto(clickedPhoto) {
   const result = confirm("사진을 삭제하시겠습니까?");
   
   // 선택된 사진 지우기 > 임시로 JS로 처리 > DB 작업 필요
   if (result) {      
      const photoSlideCon = document.getElementById("image-preview");
      let photoList = [...document.getElementsByClassName("shop_picture")];
      
      // 삭제 > DB작업 적용 가능
      for (let index = 0; index < photoList.length; index++) {
         if (photoList[index].children[0].src === clickedPhoto) {
        	
        	// (업로드)커버 사진 삭제 > input value 제거
        	if (clickedPhoto === uploadPhotoList.uploadCover) {
        		// 커버사진 input value 초기화
        		document.getElementById("update-cover").value = "";        		
        	}
            
        	// (업로드)일반 사진 삭제 > input value 제거
        	else if (uploadPhotoList.uploadPhoto.map((obj) => obj.src).includes(clickedPhoto)) {        		
        		const index = uploadPhotoList.uploadPhoto.map((obj) => obj.src).indexOf(clickedPhoto);
        		const id = uploadPhotoList.uploadPhoto[index].id;
        		
        		document.getElementById(id).value = "";  		
        	}
        	
        	// 삭제
        	photoList.splice(index, 1);
        	
        	// 삭제 후 다음 사진 미리보기
        	zoomInPhoto(photoList[index % photoList.length].children[0].src);
        	
            // DB에서 바로 삭제 가능
            // ...
            
            break;
         }
      }
      
      // 리스트 초기화
      photoSlideCon.innerHTML = "";
      
      // 리스트 재구성
      for (let i = 0; i < photoList.length; i++) {
         photoSlideCon.appendChild(photoList[i]);
      }
      
      // 화면 초기화(삭제하는 사진과 메인에 보여지는 미리보기 사진이 동일한 경우)
      if (document.getElementById("main-image").src === clickedPhoto) {
    	  document.getElementById("main-image").removeAttribute("src");
      }
      
   }
}





// 랜덤 String 생성
function generateReandomString(length) {
	let result = "";
	const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
	const charArray = characters.split("");
		
	for (let i = 0; i < length; i++) {
		result += charArray[Math.ceil(Math.random() * characters.length)];
	}
	
	// 동일한 난수가 생성되엇을 경우(로또 맞을 확률)
	if (document.getElementById(result)) {
		alert("축하드립니다. 17,067,655,527,413,216e+89의 확률을 뚫으셨습니다.");
		location.reload();
		return;
	}
	
	return result;
}

// input file & label 생성
function createInputFile() {
	const randomId = generateReandomString(15);
	
	const input = document.createElement("input");
	input.setAttribute("id", randomId);
	input.setAttribute("className", "add_photo_input");
	input.setAttribute("type", "file");
	input.setAttribute("name", "storeimg");
	input.setAttribute("onchange", "imageCheck(event)");
	input.setAttribute("style", "display: none");
	input.setAttribute("accept", ".png, .jpg, .jpeg");
//	input.setAttribute("multiple", "multiple");
	
	document.getElementById("photo-modal-btn").appendChild(input);
	document.getElementById("photo-modal-btn").appendChild(createLabelForInputFile(randomId));

}

// input label 생성
function createLabelForInputFile(inputId) {
	
	const label = document.createElement("label");
	label.setAttribute("id", inputId + "label");
	label.setAttribute("for", inputId);
	label.innerHTML = "<span>새로운 사진 추가하기 <i class='far fa-images'></i>";
		
	return label;
}

function hideLabel(labelId) {	
	document.getElementById(labelId).style.display = "none";
	
	// 새로운 input & label 생성
	createInputFile();
}




// 초기 실행
imageShow();
sliderEvent();
createInputFile();




// 사진 속 input value 확인
//function checkValues() {
//const names = document.getElementsByName("delegatephotoboolean");
//const ids = [];
//
//for (let i = 0; i < names.length; i++) {
//	ids.push(names[i].id);
//}
//console.log(ids);
//
//for (let i = 0; i < ids.length; i++) {
//	console.log(document.getElementById(ids[i]).value);
//}
//
//}

