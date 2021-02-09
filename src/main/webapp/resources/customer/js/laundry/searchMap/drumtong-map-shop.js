	// 레벨 1~3 마커 관련 전역변수
		var markersContainer = new Array();	// 생성된 마커를 지워주기 위한 전역변수 저장공간
	 	var markersOverLays = new Array();	// 생성된 마커와 연계되는 커스텀 오버레이를 담아두는 전역공간
		
	
		
	
	function shopLevel() {	// 상점을 보여주는 레벨		: 1 ~ 3
		$('.erase').parent().remove();
		shopAxios();
	}
	
	function shopAxios() {		// 상점 레벨 비동기
		const axiosPath = '/drumtong/customer/laundry/customerMap/rest/selectBInformationCoord/';
		const axPost = async() => {
		    await axios.post(axiosPath)
		    // 정상
				.then( (response) => {
		    const data = response.data;
		    let shopCenter = data;			// 반환 결과 불러오기
		    console.log('상점 지도 불러오기');
		    console.log(shopCenter);
		    
		    var markerImageSrc = '/drumtong/customer/img2/laundry_marker.JPG';
			
			let bounds = map.getBounds();
			let swLatLng = bounds.getSouthWest();		// 남서
			let neLatLng = bounds.getNorthEast();		// 북동
			
		    for(i = 0; i < shopCenter.length; i++) {
		    	
		    	if(swLatLng.getLat() < shopCenter[i].latitude && swLatLng.getLng() < shopCenter[i].longitude) {
		    		if(neLatLng.getLat() > shopCenter[i].latitude && neLatLng.getLng() > shopCenter[i].longitude) {
		    	
				        let imageSize = new kakao.maps.Size(64, 69),
			            imageOptions = {   
			        		offset: new kakao.maps.Point(27, 69)
	        		    };
				        
				        console.log('마커 이벤트 : ' + shopCenter[i].brandnaming);
				        let markerContent = '<div class="customoverlay">' +
				        '    <span class="title">' + shopCenter[i].brandnaming + '</span>' +
				        '</div>';
	     
				        // 마커이미지와 마커를 생성합니다
	    			    let markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions);
	           			let shopmarker = createMarker(shopCenter[i].latitude, shopCenter[i].longitude , markerImage, markerContent);  
	           			shopmarker.setMap(map);
	          		 	markersContainer.push(shopmarker);	// 생성된 마커를 지워주기 위해서 전역변수로 선언된 객체에 저장함
	          		 	
	          		 	console.log('콘텐츠 : ' + shopmarker);
	          		 	
	          			let overposition = new kakao.maps.LatLng(shopCenter[i].latitude, shopCenter[i].longitude);
	        			// 커스텀 오버레이를 생성합니다
	        		 	var customOverlay = new kakao.maps.CustomOverlay({
	        		 	    map: map,
	        		 	    position: overposition,
	        		 	    content: markerContent,
	        		 	    yAnchor: 1,
	        		 	});
	        			
	        		 	markersOverLays.push(customOverlay);
	          		 	
	        		 	customOverlay.setVisible(false);
	        			
 	          		    kakao.maps.event.addListener(shopmarker, 'click', ClickListener(map, shopmarker, customOverlay));
// 	          		    kakao.maps.event.addListener(shopmarker, 'mouseover', makeOverListener(map, shopmarker, customOverlay));
// 	          		    kakao.maps.event.addListener(shopmarker, 'mouseout', makeOutListener(customOverlay));
		    		}
		    	}
		    }
		     })
		}
		return axPost();
	}
	
		function ClickListener(map, marker, overlay) {
		return function() {
			console.log('가시화상태 : ' + overlay.getVisible());
			if(overlay.getVisible() === true)
				overlay.setVisible(false);
			else 
				overlay.setVisible(true);
	    };
	}
	
		function deleteShopMarkers() {
		for (i = 0; i < markersContainer.length; i++) {	
			markersContainer[i].setMap(null);
		}
		markersContainer.length = 0;	// 전역변수에 저장된 마커저장 객체 초기화
		
		for(j = 0; j < markersOverLays.length; j++) {
			markersOverLays[j].setMap(null);	
		}
		
		markersOverLays.length = 0;
	}
	
	// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
	function createMarkerImage(src, size, options) {
	    var markerImage = new kakao.maps.MarkerImage(src, size, options);
	    return markerImage;            
	}

	// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
	function createMarker(latitude, longitude, image, content) {
		
		let position = new kakao.maps.LatLng(latitude, longitude);
	    var marker = new kakao.maps.Marker({
	        position: position,
	        image: image
	    });
	    
	    return marker;  
	}   
	