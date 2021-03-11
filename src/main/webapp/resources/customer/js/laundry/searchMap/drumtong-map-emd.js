	// 읍면동 레벨 전역변수들 -> 필요없는 거 삭제바람
		polygonoverlay = new kakao.maps.CustomOverlay({}),		// 읍면동_폴리곤의 오버레이
		emdinfowindow = new kakao.maps.InfoWindow({removable: true});
		var polygons = []; 		// 단일 읍면동 폴리곤을 담고 있는 전역변수 -> 이것을 이용해서 읍면동 폴리곤을 제거할 것이다

		
			// 읍면동 레벨 - 오픈마켓에서 다운받아 좌표변환(WGS 84 : EPGS 4326) 시킨 폴리곤을 나타내줌
 	function emdLevel() {
	  $('.erase').parent().remove();
		 emdAxios();		
	}
	
	function emdAxios() { // 읍면동 지도 비동기
		
		const axiosPath = getContextPath() + '/customer/laundry/customerMap/rest/emd/';
		const axPost = async() => {
		    await axios.post(axiosPath)
		    // 정상
				.then( (response) => {
		    const data = response.data;
		    let emdCenter = data;			// 반환 결과 불러오기
		    console.log('읍면동 지도 불러오기');
		    
		    for(i = 0; i < emdCenter.length; i++) {
		 	   		let emd_content = '<div class="erase" onclick="emdPolygon(this)" onmouseover="zindexup(this)" onmouseout="zindexdown(this)">' +
		 	   				'<div class="mark-content"><div class="mark-count">' + 
		    				emdCenter[i].count + '</div><h1 class="emdnametag">' + emdCenter[i].emdname +'</h1></div></div>';
		    		let emd_position = new kakao.maps.LatLng(emdCenter[i].latitude, emdCenter[i].longitude); 
		    	
					// 커스텀 오버레이를 생성합니다
					let customOverlay = new kakao.maps.CustomOverlay({
				   		position: emd_position,
				   	 	content: emd_content,
		    			xAnchor: 0.3,
		   				yAnchor: 0.91
					});
				
					// 커스텀 오버레이를 지도에 표시합니다
					customOverlay.setMap(map);
		    }
		    
			})
		}
		return axPost();
	}
	
	
	function emdPolygon(object) {
		let view_emd_nm = object.querySelector('.emdnametag').innerHTML;
		
			console.log('화면 네임 : ' + view_emd_nm);
			
			// EMD250geoJson 을 경상남도, 경상북도, 서울특별시 등으로 바꾼다면
			// 개별적으로 geoJson을 불러올 수 있을 것이다
			// 해당 지도의 중심 값으로 그 값을 가져오면 유용할듯하다
			$.getJSON("/drumtong/customer/json/emd/" + $('#sido-hidden').html() + ".geojson", function(geojson) {
				let emd_datas = geojson.features;
				let emd_coordinate = [];
				let emd_nm = "";
			
// 				console.log('emd_datas : ', emd_datas);
			
				$.each(emd_datas, function(index, item) {
					emd_coordinates = item.geometry.coordinates;
					emd_nm = item.properties.EMDNAME;
//					if(emd_nm == '명지동') {
//						console.log('index : ' + index);
//					}
					emd_num = item.properties.EMDNUM;		// EMDCODE로 수정
					emddisplayArea(emd_coordinates, emd_nm, emd_num, view_emd_nm, object);
				});
			});
	}
	
	// 읍면동 폴리곤 활성화
	function emddisplayArea(coordinates, name, pknum, viewname, object) {
		let emd_path = [];		// 폴리곤을 구성하는 모든 좌표를 임시로 담아두는 공간
								// 폴리곤을 생성하는 kakao.maps.Polygon 에서 한번에 넣어준다 -> path
				
		if(name != viewname)	// 함수 속조 증가를 위해서 추가함 -> 클릭한 읍면동이 아니면 함수 종료
			return false;
		
		deletePlygons();
		useEmdcode(pknum);		// 좌측 리스트가 나오는 공간에 해당 읍면동의 리스트를 나타냄 
		
		$.each(coordinates[0][0], function(index1, coordinate) { //console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
			emd_path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0])); //new daum.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
		});	  
		
		// 다각형을 생성합니다 
		const emd_polygon = new kakao.maps.Polygon({
				map : map, // 다각형을 표시할 지도 객체
				path : emd_path,
				strokeWeight : 2,
				strokeColor : '#004c80',
				strokeOpacity : 0.8,
				fillColor : '#fff',
				fillOpacity : 0.7
			});
		polygons.push(emd_polygon);					// 나중에 지도의 폴리곤들을 지우기 위해서 전역변수에 폴리곤 정보를 저장함
		
		// 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
		// 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
		kakao.maps.event.addListener(emd_polygon, 'mouseover', function(
				mouseEvent) {
				emd_polygon.setOptions({
				fillColor : '#09f'
			});

			// 	        polygonoverlay.setContent('<div class="area">' + area.name + '</div>');
			polygonoverlay.setContent('<div class="area">' + name
					+ '</div>');

			polygonoverlay.setPosition(mouseEvent.latLng);
			polygonoverlay.setMap(map);
		});

		// 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
		kakao.maps.event.addListener(emd_polygon, 'mousemove', function(
				mouseEvent) {

			polygonoverlay.setPosition(mouseEvent.latLng);
		});

		// 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
		// 커스텀 오버레이를 지도에서 제거합니다 
		kakao.maps.event.addListener(emd_polygon, 'mouseout', function() {
			emd_polygon.setOptions({
				fillColor : '#fff'
			});
			polygonoverlay.setMap(null);
		});

		// 폴리곤 활성화시킨 읍면동을 다시 클릭했을 때 지우는 함수를 부여하고자
		object.setAttribute("onClick", "deletePolygon(this)");
	}
	
	function deleteEmd() {							// 레벨변경이나 화면이동시 폴리곤 삭제하기
		deletePlygons();
		polygonoverlay.setMap(null);
		emdinfowindow.setMap(null);
	}
	
	function deletePlygons() {
		for(i = 0; i < polygons.length; i++) {
			polygons[i].setMap(null);		// 전역변수에 저장해준 읍면동 폴리곤을 삭제
		}
		polygons.length = 0;
	}
	
	function deletePolygon(object) {			// 활성화된 폴리곤을 클릭했을 때 해당 폴리곤 지우기
		deletePlygons();
		polygonoverlay.setMap(null);
		emdinfowindow.setMap(null);
		object.setAttribute("onClick", "emdPolygon(this)");
		
		let emd_bounds = map.getBounds();
		useCoordinates(emd_bounds.getSouthWest(), emd_bounds.getNorthEast());	// 읍면동 선택을 취소했으니 다시 읍면동 범위를 활성화시켜야지
	}
	
	function zindexup(object) {		// 읍면동 마커에 마우스를 올리면 제일 위로 올려줌
		object.parentNode.style.zIndex = '100';
	}

	function zindexdown(object) {	// 읍면동 마커에 마우스를 빼면 원래대로 돌려줌
		object.parentNode.style.zIndex = '0';
	}