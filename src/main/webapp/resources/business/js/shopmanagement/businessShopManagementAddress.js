// Daum Map 주소찾기 열기
function openAddressSearch() {
	
	new daum.Postcode({
		
		oncomplete : (data) => {
			const fullRoadAddr = data.roadAddress;
			const extraRoadAddr = '';
			
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
			
			document.getElementById('').value = fullRoadAddr;
		}
		
	}).open();
}