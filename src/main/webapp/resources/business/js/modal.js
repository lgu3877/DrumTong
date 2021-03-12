const contractProcedureMSGS = [
   {
      content: "온라인 계약이 진행되지 않았습니다.해당 페이지는 온라인 계약이 모두 완료가 되어야지 접근할 수 있습니다.온라인 계약을 진행하시겠습니까?",
	  agree : "온라인 계약 진행하기",
	  disagree : "진행하지 않기"
   },
   {
      content: "온라인 계약을 아직 다 완료하지 않으셨습니다. 매장 관리 등록을 계속 진행 하시겠습니까?",
 	  agree : "매장 관리 등록으로 이동",
	  disagree : "나중에 진행하기"
   },
   {
      content: "2차 온라인 계약을 아직 다 완료하지 않으셨습니다. 일정 관리 등록을 계속 진행 하시겠습니까?",
 	  agree : "일정 관리 등록으로 이동",
	  disagree : "매장 관리 등록 수정하기"
   },
];

	function insertModalHTML(ct){
		modal.style.display = "block";
		if(ct === 'isNotContract') ct = 0;
		else if(ct === 'FAIL') ct = 1;
		else if(ct === 'PROCESS') ct = 2;
		
		document.getElementsByClassName("modal-body")[0].innerHTML = contractProcedureMSGS[ct].content;
		document.getElementsByClassName("btn_blue")[0].innerHTML = contractProcedureMSGS[ct].agree;
		document.getElementsByClassName("btn_red")[0].innerHTML = contractProcedureMSGS[ct].disagree;
		
		document.getElementsByClassName("btn_blue")[0].onclick = function() {location.href= getContextPath() + '/business/' + preLink;}
		if(ct == 2)
			document.getElementsByClassName("btn_red")[0].onclick = function() {location.href= getContextPath() + '/business/mainmanagement/businessShopManagement/';}
		else
			document.getElementsByClassName("btn_red")[0].onclick = function() {modal.style.display = "none";}
	}
	
	
	const modal = document.getElementById("myModal");
	
	// 링크 버튼 > 매장관리 & 일정관리 연결 필요(EST 값 검사와 함께)
	const span = document.getElementsByClassName("close")[0];
	
	document.querySelectorAll('.inner_nav').forEach(nav => {nav.addEventListener('click', ModalFunc)});
	
	function ModalFunc(){
		ModalOpen(this.id);
	 }
	
	function ModalOpen(id){
		switch (preStatus) {
		case 'isNotLogin':
		case 'SUCCESS':
			option = (id === "ShopManagement" || id ==="ScheduleManagement") ? 'main' : 'sub';
			location.href = getContextPath() + '/business/' + option + 'management/business' + id +'/';
			break;
		case 'PROCESS':
		case 'FAIL':
		case 'isNotContract':
			insertModalHTML(preStatus);
			break;
		}
	}
	
	if(ModalCheck !== null && ModalCheck !== ''){
  			ModalOpen(ModalCheck);
  		 }
	
	
	span.onclick = function() {
		modal.style.display = "none";
	}
	
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	
