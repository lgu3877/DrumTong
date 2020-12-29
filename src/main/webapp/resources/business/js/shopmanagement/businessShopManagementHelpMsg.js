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
		id: "update-help",
		content: "등록하셨던 세탁 서비스 항목들을 수정할 수 있습니다. '수정하기' 버튼을 클릭하시고 내용을 입력합니다.",
		className: "help_msg_top"		
	},
	{
		id: "post-help",
		content: "새로운 서비스를 등록합니다. 상품 유형 및 타입을 설정하시고 관련된 세부 사항들을 기입하시면 됩니다. '배달 서비스' 버튼을 통해 배달 가격 설정을 따로 설정할 수 있습니다.",
		className: "help_msg_top"		
	},
	{
		id: "return-help",
		content: "자체적으로 배달 서비스를 제공하고 있는지, 혹은 퀵을 통한 배송이 가능한지 체크할 수 있습니다. 복수 선택 역시 가능합니다.",
		className: "help_msg_top"		
	},
];

function helpMsg(idArray) {
	helpMessages.forEach((element) => {
		// 도움말 보임
		document.getElementById(element.id).addEventListener("mouseover", () => {
			document.getElementById(`${element.id}-msg`).classList.add(element.className);
			document.getElementById(`${element.id}-msg`).innerHTML = `<p>${element.content}</p>`;
		});	
		
		// 도움말 사라짐
		document.getElementById(element.id).addEventListener("mouseout", () => {
			document.getElementById(`${element.id}-msg`).classList.remove(element.className);
			document.getElementById(`${element.id}-msg`).innerHTML = "";
		});
	}
	);
	
}

helpMsg(helpMessages);