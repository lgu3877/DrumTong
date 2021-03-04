
		var mapContainer = document.getElementById('drumtongMap'), // 지도를 표시할 div

			mapOption = {
		 			center : new kakao.maps.LatLng(37.55102, 126.99023), // 지도의 중심좌표
					level : 11
				// 지도의 확대 레벨
				};
				
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		
		window.onload = function() {
			getInfo();	// 윈도우즈 활성화 될때마다 지도 처음 레벨은 6에 맞는 부분을 활성화시켜줌
			
			const searchText = document.getElementById('searchText').value;
			const text_split = searchText.split(' ');
//			console.log('text_split : ' + text_split.length);
		}
		
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
		// 현재 위치를 기반으로 맵의 중심을 결정한다
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        const currentlat = position.coords.latitude; // 위도
		        const currentlon = position.coords.longitude; // 경도
		        
		        const currentPosition = new kakao.maps.LatLng(currentlat, currentlon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		        map.setCenter(currentPosition);
		    });
		} 
		else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			const currentPosition = new kakao.maps.LatLng(37.55102, 126.99023);
			map.setCenter(currentPosition);
		}
		
		function getInfo() {		// 레벨별로 지도 정보를 가져오는 함수
			// 지도의 현재 중심좌표를 얻어옵니다 
			var center = map.getCenter();
			// 지도의 현재 레벨을 얻어옵니다
			var level = map.getLevel();
			var bounds = map.getBounds();
			
			switch (level) {
			case 1:	case 2:	case 3:	case 4: 
				deleteShopMarkers();
				shopLevel();
				deleteEmd();
				useCoordinates(bounds.getSouthWest(), bounds.getNorthEast());
				break;
			case 5:	case 6:	case 7: 
				emdLevel();
				deleteShopMarkers();
				deleteEmd();
				useCoordinates(bounds.getSouthWest(), bounds.getNorthEast());
				break;
			case 8:	case 9:	
				sigunguLevel();
				deleteEmd();
				useCoordinates(bounds.getSouthWest(), bounds.getNorthEast());
				break;
			case 10: case 11:
  				sidoLevel();
				deleteEmd();
				useCoordinates(bounds.getSouthWest(), bounds.getNorthEast());
				break;
			case 12: case 13: case 14:
				map.setLevel(11);
				break;
			default:
				break;
			}
		}
		
		
	function setLevel9(latitude, longitude) {
	    // 이동할 위도 경도 위치를 생성합니다 
	    // new kakao.maps.LatLng 없이 하면 오류 발생함
    	let moveLatLon = new kakao.maps.LatLng(latitude, longitude);
		map.setCenter(moveLatLon);
		map.setLevel(9);
	}
	
	function setLevel7(latitude, longitude) {
		// 이동할 위도 경도 위치를 생성합니다
		// new kakao.maps.LatLng 없이 하면 오류 발생함
    	let moveLatLon = new kakao.maps.LatLng(latitude, longitude);
		map.setCenter(moveLatLon);
		map.setLevel(7);
	}
	
	    function searchAddress(){
	    	address = document.getElementById('searchText').value;
	    	//주소-좌표 변환 객체를 생성합니다
	    	var geocoder = new kakao.maps.services.Geocoder();
	    	
	    	//주소로 좌표를 검색합니다
	    	geocoder.addressSearch(address, function(result, status) {
	    	
	    	    // 정상적으로 검색이 완료됐으면 
	    	     if (status === kakao.maps.services.Status.OK) {
	    	
	    	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

// 	    			axGet(address, map);
	    	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    	        map.setCenter(coords);
	    	    } else {
	    	    	alert("정확한 주소를 입력해주세요");
	    	    	document.getElementById('searchText').value='';
	    	    }
	    	});    
	    }
	    
 		
		searchAddress();
		
		