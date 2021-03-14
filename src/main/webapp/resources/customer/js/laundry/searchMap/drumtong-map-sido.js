
	

	function sidoLevel() {		// 시도 레벨 지도
		$('.erase').parent().remove();
		sidoAxios();
	}
	
	function sidoAxios() {		// 시도 SQL 비동기
		const axiosPath = getContextPath() + '/customer/laundry/customerMap/rest/sido/';
		const axPost = async () => { // async : 비동기 실행 함수
		    await axios.post(axiosPath)
		    // 정상
				.then( (response) => {
		    const data = response.data;
		    let sidoCenter = data;			// 반환 결과 불러오기

			for(i = 0; i < sidoCenter.length; i++) {
	 		   	    	
	 		    let sido_content = '<div class="erase"><div class="sido" onclick="setLevel9(' + 
	 		    	sidoCenter[i].latitude + ', ' + sidoCenter[i].longitude + ')">' +
	 		    	sidoCenter[i].sidoname +'</div></div>';    	
	 		   	    	
				// 커스텀 오버레이가 표시될 위치입니다 
				let sido_position = new kakao.maps.LatLng(sidoCenter[i].latitude, sidoCenter[i].longitude);  

				// 커스텀 오버레이를 생성합니다
				let sido_Overlay = new kakao.maps.CustomOverlay({
			   	 position: sido_position,
			   	 content: sido_content,
		    		xAnchor: 0.3,
		   			yAnchor: 0.91
				});
			
				// 커스텀 오버레이를 지도에 표시합니다
				sido_Overlay.setMap(map);
	  		  	}
			
		     })
		  }
		return axPost();
	}