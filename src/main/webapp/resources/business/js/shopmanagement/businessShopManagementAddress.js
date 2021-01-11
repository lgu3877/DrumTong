// Daum Map 주소찾기 열기
function openAddressSearch() {
	
	new daum.Postcode({
		
		oncomplete : function (data) {
			let fullRoadAddr = data.roadAddress;
			let extraRoadAddr = '';
			
			if (data.bname !== ''
				&& /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}

			if (data.buildingName !== ''
				&& data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}

			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}

			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}
						
			document.getElementById('main-address').value = fullRoadAddr;
			document.getElementById('detail-address').value = "";
			document.getElementById('detail-address').focus();
			
			// 변환 (주소 > 좌표)
			convertLocation(fullRoadAddr);
		}
		
	}).open();
}

function convertLocation(address) {
	console.log(address);
}