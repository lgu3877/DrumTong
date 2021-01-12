const contractProcedureMSGS = [
   {
      id: "emptyContract",
      content: "온라인 계약이 진행되지 않았습니다.해당 페이지는 온라인 계약이 모두 완료가 되어야지 접근할 수 있습니다.온라인 계약을 진행하시겠습니까?",
	  agree : "온라인 계약 진행하기",
	  disagree : "진행하지 않기"
//      className: "help_msg_down"
   },
   {
      id: "1stContractSuccess",
      content: "온라인 계약을 아직 다 완료하지 않으셨습니다.해당 페이지는 온라인 계약이 모두 완료가 되어야지 접근할 수 있습니다.2차 온라인 계약을 계속 진행 하시겠습니까?",
 	  agree : "계속 진행하기",
	  disagree : "처음부터 다시 작성하기"
//      className: "help_msg_down"      
   },
   {
      id: "2stContractShopSuccess",
      content: "2차 온라인 계약을 아직 다 완료하지 않으셨습니다.해당 페이지는 온라인 계약이 모두 완료가 되어야지 접근할 수 있습니다.2차 온라인 계약을 계속 진행 하시겠습니까?",
 	  agree : "계속 진행하기",
	  disagree : "처음부터 다시 작성하기"
//      className: "help_msg_top"      
   },
];

const URL = [
	{
		url : '/drumtong/business/mainmanagement/businessShopManagement/',
	},
	{
		url : '/drumtong/business/mainmanagement/businessScheduleManagement/',
	},
	{
		url : '/drumtong/business/mainmanagement/businessScheduleManagement/',
	},
	{
		url : '/drumtong/business/mainmanagement/businessScheduleManagement/',
	},
	{
		url : '/drumtong/business/submanagement/businessCardAccountManagement/',
	},
	{
		url : '/drumtong/business/submanagement/businessStatisticsManagement/',
	},
	{
		url : '/drumtong/business/submanagement/businessOrderStatusManagement/',
	},
];







function accessControl(id){
	
	console.log(id);
	 console.log(document.getElementsByClassName("modal-body"));
   	 
   	 let menuList = document.getElementsByClassName("inner_nav_con")[0];
   	 
   	 console.log('menuList : '  + menuList);
   	 console.log(menuList);
    	
   	 console.log("login : " + login);
   	 console.log("contract : " + contract);
	 
	if( !login || contract === "SUCCESS"){
		if(id === "ShopManagement" || id ==="ScheduleManagement")
			location.href = '/drumtong/business/mainmanagement/business' + id +'/';
		else 
			location.href = '/drumtong/business/submanagement/business' + id +'/';
	}
	else if(login && contract !== "SUCCESS") {
		insertModalHTML(contract);
		modal.style.display = "block";
	}
	
	
}



	
     
//   	 if(contract !== "SUCCESS" ){
//	
//		 console.log('status' + status);
//   		 console.log('실행2');
//   		 
//		 menuList.addEventListener('click', () => {
//			console.log('실행3');
//			menuList.style.backgroundColor = 'blue';
//			
//   	 	});
//   	console.log("change menuList : " + menuList);
//   	console.log(menuList);
//	
//
//	
//	
//	
//	
//	}
	
	
	
	function insertModalHTML(ct){
		console.log(contractProcedureMSGS[1].disagree);
		switch(ct) {
				case "" :
						document.getElementsByClassName("modal-body")[0].innerHTML = contractProcedureMSGS[0].content;
						document.getElementsByClassName("btn_blue")[0].innerHTML = contractProcedureMSGS[0].agree;
						document.getElementsByClassName("btn_red")[0].innerHTML = contractProcedureMSGS[0].disagree;
						break;
				case "FAIL" :
						document.getElementsByClassName("modal-body")[0].innerHTML = contractProcedureMSGS[1].content;
						document.getElementsByClassName("btn_blue")[0].innerHTML = contractProcedureMSGS[1].agree;
						document.getElementsByClassName("btn_red")[0].innerHTML = contractProcedureMSGS[1].disagree;
						break;
				case "PROCESS" :
						document.getElementsByClassName("modal-body")[0].innerHTML = contractProcedureMSGS[2].content;
						document.getElementsByClassName("btn_blue")[0].innerHTML = contractProcedureMSGS[2].agree;
						document.getElementsByClassName("btn_red")[0].innerHTML = contractProcedureMSGS[2].disagree;
						break;
			}
	}
	
	
	const modal = document.getElementById("myModal");
	
	// 링크 버튼 > 매장관리 & 일정관리 연결 필요(EST 값 검사와 함께)
	const span = document.getElementsByClassName("close")[0];
	
	
	
	
	
	
	

	
	
	
	span.onclick = function() {
		modal.style.display = "none";
	}
	
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	
	
	// 		// 여기부터 시작.
//    		let menuList = document.getElementsByClassName("inner_nav_con")[0].children;
   			
//    		for ( i = 0; i < menuList.length; i++){
   			
//    			menuList[i].onclick = null;
//    			// status가 SUCCESS가 아니면 onclick을 없애준다.
//    			menuList[i].onclick = modalInterface();
   		
//    		}
   			

