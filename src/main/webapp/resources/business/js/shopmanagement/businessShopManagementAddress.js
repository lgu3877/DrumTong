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
			
			// preivew 지도 생성
			createMap();
		}
		
	}).open();
}


// 지도 생성 > 좌표값에 따라 위치 변경, 중앙 이동, 마커표기, 위치 정보 태그
function createMap() {
	let address = document.getElementById("main-address").value;
	address = address.split("(")[0].trim();
	
	// 주소 > 좌표 (변환)
	const geoCoder = new kakao.maps.services.Geocoder();
	
	geoCoder.addressSearch(address, function (result, status) {
		if (status === kakao.maps.services.Status.OK) {
			// 좌표
			const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			// 좌표값 input value로 설정
			document.getElementById("main-location").value = coords;
			
			// 지도 설정값
			const mapContainer = document.getElementById("preview-map");
			const mapOption = {
				center: coords,
				level: 4	
			}
			
			// 지도 생성
			const map = new kakao.maps.Map(mapContainer, mapOption);
			
			// 마커
			const marker = new kakao.maps.Marker({
				map: map,
				position: coords
			})
			
			// 장소 설명 표시
			const info = new kakao.maps.InfoWindow({
				content: '<div style="width:150px; text-align:center; padding:6px 0;">입력된 위치</div>'
			}).open(map, marker);
			
		}
	})
	
}




// 초기 지도 생성
createMap();