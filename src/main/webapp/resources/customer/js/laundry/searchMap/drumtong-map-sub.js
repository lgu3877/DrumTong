// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);			
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		// 지도 타입 컨트롤을 지도에 표시합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
			// RIGHT  : 줌 컨트롤을 오른쪽에 생성
			// LEFT   : 줌 컨트롤을 왼쪽에 생성
			// TOP	  : 줌 컨트롤을 위쪽에 생성
			// BOTTOM : 줌 컨트롤을 아래쪽에 생성
			// RIGHT, LEFT - TOP, BOTTOM 을 조합하여 생성 가능함 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		// 중심 좌표나 확대 수준이 변경됐을 때 감지하는 이벤트 : 'idle'
		kakao.maps.event.addListener(map, 'idle', function() {
			    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
//			    console.log('행정동 주소 : ' , $('#centerAddr').html());
			    callAddress();
		});

		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
		}
		
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		function callAddress() {
		  	searchDetailAddrFromCoords(map.getCenter(), function(result, status) {
				// $('#hidden').html(result[0].address.address_name.split(' ')[2]);
				// id="hidden" 태그에 카카오맵에서 받아온 행정동 주소의 '읍면동'의 부분을 삽입한다
		 	})
		}
		
		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
				
		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		            	// 좌측 상단에 행정동 주소 정보를 입력함	ex) 경상남도 김해시 내외동	-> 구주소
		                infoDiv.innerHTML = result[i].address_name;
		            	// id="sido-hidden" 태그에 행정동 시도 정보를 입력함
		            	// 이것을 이용하여 geoJson 을 종류별로 읽어올 수 있도록 한다
		                $('#sido-hidden').html(result[i].address_name.split(' ')[0]);
		                break;
		            }
		        }
		    }    
		}
		
		// 지도 레벨이 바뀔 때마다 이벤트
		kakao.maps.event.addListener(map, 'zoom_changed', getInfo);
		// 지도 움직일 때마다 이벤트
		kakao.maps.event.addListener(map, 'dragend', getInfo);   