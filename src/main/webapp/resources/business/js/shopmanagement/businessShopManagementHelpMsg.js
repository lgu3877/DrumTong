
const helpMessages = [
   {
      id: "photo-help",
      content: "매장 관련 사진을 등록할 수 있습니다. 메인 화면에 보일 커버 사진과 매장을 소개할 수 있는 사진을 업로드해보세요.",
      className: "help_msg_down"
   },
   {
      id: "intro-help",
      content: "사장님 세탁소에 대한 소개글을 작성해주세요. 아래 '작성하기' 버튼을 통해 매장을 소개해보세요.",
      className: "help_msg_down"      
   },
   {
      id: "post-help",
      content: "새로운 서비스를 등록합니다. 상품 유형 및 타입을 설정하시고 관련된 세부 사항들을 기입하시면 됩니다. '배달 서비스' 버튼을 통해 배달 가격 설정을 따로 설정할 수 있습니다.",
      className: "help_msg_down"      
   },
   {
      id: "return-help",
      content: "자체적으로 배달 서비스를 제공하고 있는지, 혹은 퀵을 통한 배송이 가능한지 체크할 수 있습니다. 복수 선택 역시 가능합니다.",
      className: "help_msg_down"      
   },
   {
      id: "update-help",
      content: "등록하셨던 세탁 서비스 항목들을 수정할 수 있습니다. '수정하기' 버튼을 클릭하시고 내용을 입력합니다.",
      className: "help_msg_down"      
   },
   {
	   id: "address-help",
	   content: "등록하셨던 매장주소를 수정합니다. '주소찾기'를 통해 바뀐 주소지를 입력하시고 '변경완료'버튼을 클릭해주세요.",
	   className: "help_msg_down"      
   },   
   {
	   id: "delivery-help",
	   content: "배달 가능 지역을 설정합니다. 서비스 가능 지역을 선택 옵션에서 체크하시면 배달 서비스 지역이 업데이트됩니다.",
	   className: "help_msg_down"      
   },
   {
	   id: "quick-help",
	   content: "고객은 추가요금을 지불하고, 더 빠른 세탁 서비스를 제공받을 수 있습니다. 버튼을 클릭하면 서비스를 확설화 시킬 수 있습니다.",
	   className: "quick_help_msg"   
   },
];

// 초기 실행
helpMsg(helpMessages);

// 마우스 호버링 > 안내 메세지 출력
function helpMsg(idArray) {
   helpMessages.forEach((element) => {
	   try {
		   // 마우스 이벤트 영역설정
		      document.getElementById(element.id).style.width = "150px";
		      document.getElementById(element.id).style.padding = "15px 0";
		      
		      // 도움말 보임
		      document.getElementById(element.id).addEventListener("mouseenter", () => {
		         document.getElementById(`${element.id}-msg`).classList.add(element.className);
		         document.getElementById(`${element.id}-msg`).innerHTML = `<p>${element.content}</p>`;
		      });   
		      
		      // 도움말 사라짐
		      document.getElementById(element.id).addEventListener("mouseleave", () => {
		         document.getElementById(`${element.id}-msg`).classList.remove(element.className);
		         document.getElementById(`${element.id}-msg`).innerHTML = "";
		      });	
	   } catch (e) {
//		   console.log(e);
	   }
     }
   );
}