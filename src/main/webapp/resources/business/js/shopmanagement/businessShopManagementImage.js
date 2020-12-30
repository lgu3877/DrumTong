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

// 매장 사진 슬라이드 인터페이스   >   swipe cover image view > swipeViewImage()
function sliderEvent() {   
   const subImageList = document.getElementsByClassName('shop_picture');
   for (let i = 0; i < subImageList.length; i++) {
      const clickedPhoto = subImageList[i].children[0].src
            
      // 슬라이드 사진 클릭
      subImageList[i].children[0].addEventListener('click', () => zoomInPhoto(clickedPhoto));
   
      // 슬라이드 사진 지우기(X 아이콘 클릭)
      subImageList[i].children[1].addEventListener('click', () => deletePhoto(clickedPhoto));
      
//      console.log(subImageList[i].children[0].removeEventListener);
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

// 슬라이드 사진 지우기(X 아이콘 클릭)
function deletePhoto(clickedPhoto) {
   const result = confirm("사진을 삭제하시겠습니까?");
   // 선택된 사진 지우기 > 임시로 JS로 처리 > DB 작업 필요
   if (result) {      
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
}


// 이미지 업로드 (feat. ghrw
function imageCheck(e) {
   const input = e.target;
   const imageType = input.value.substr(input.value.length - 3, input.value.length).toLocaleLowerCase();

   let isImage = false;

   // 이미지 확장자 검사 (jpg, png, jpng)
   if (imageType === 'jpg' || imageType === 'png' || imageType === 'jpeg') {
      isImage = true;
   }

   // 커버 사진 업로드
   if (isImage && e.target.id === "update-cover") {
      // 미리보기
      const reader = new FileReader();

      // 대표사진이 있을 경우 삭제
      document.getElementById("cover-image") ? document.getElementById("cover-image").remove() : null;
      
      // 이미지 주입
      reader.onload = (e) => {
         // 태그 생성
         const li = document.createElement("li");
         li.className = "shop_picture";
         li.id = "cover-image";
         const icon = document.createElement("i");
         icon.className = "fas fa-times";
         const repIcon = document.createElement("i");
         repIcon.className = "fas fa-star";
         repIcon.innerHTML = "<span>대표사진</span>";
         const img = document.createElement("img");
         img.setAttribute("src", e.target.result);
         img.setAttribute("alt", "");
            

         // 추가
         li.appendChild(img);
         li.appendChild(icon);
         li.appendChild(repIcon);

         // 이벤트 주입
         li.children[0].addEventListener('click', () => zoomInPhoto(e.target.result));
         li.children[1].addEventListener('click', () => deletePhoto(e.target.result));
         
         // 전체 폼 삽입
         document.getElementById("image-preview").prepend(li);
      
      }
      reader.readAsDataURL(e.target.files[0]);
   }
   // 일반 소개 사진 업로드 (복수 선택 가능)
   else if (isImage && e.target.id === "add-photo") {
      // 복수 사진 업로드 ( 1 ~ 여러장 )
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
            
            // 추가
            li.appendChild(img);
            li.appendChild(icon);

            li.children[0].addEventListener('click', () => zoomInPhoto(e.target.result));
            li.children[1].addEventListener('click', () => deletePhoto(e.target.result));
            
            document.getElementById("image-preview").appendChild(li);
         }
         reader.readAsDataURL(img);         
      }   
   }
   // 잘못된 사진 업로드(확장자)
   else {
      // deny uploading request
      alert("선택하신 파일은 적합한 이미지 파일이 아닙니다.\n" +
           "(jpg, png, jpng 형식의 파일을 등록해주세요.)");
      document.getElementById(id).value = '';
   }
}






// 초기 실행
imageShow();
sliderEvent();