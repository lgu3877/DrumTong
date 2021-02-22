var paramAddress = '';			// ■ 현재 지도 가져오는 데이터를 저장해두는 전역변수! 레벨이 바뀔 때 갱신 됨!, 단순 페이지만 이동할 때 쓰기위해 전역으로 둠

// 지도가 변화할 때 함수를 불러오기!	// 남서 북동
function useCoordinates(swLatLng, neLatLng){			// ■ 남서, 북동쪽 좌표를 보내주어 데이터를 가져올 때 쓰는 함수
	console.log('[test코드]swLatLng :',swLatLng);
	console.log('[test코드]neLatLng :',neLatLng);
	let bottom_ = swLatLng.getLat();
	let left_ = swLatLng.getLng();
	let top_ = neLatLng.getLat();
	let right_ = neLatLng.getLng();

	paramAddress = 'coordinate/' + left_ + '/' + right_ + '/' + top_ + '/' + bottom_ + '/';
	console.log('paramAddress :', paramAddress);
	
	selectLaundry(1);		// 1 페이지 기준
}
function useEmdcode(emdcode){							// ■ 읍면동 코드를 이용해 데이터를 가져올 때 쓰는 함수
	console.log('[test코드]emdcode :',emdcode);
	
	paramAddress = 'emdcode/' +emdcode+'/';
	console.log('paramAddress :', paramAddress);
	
	selectLaundry(1);		// 1 페이지 기준
}
async function selectLaundry(page){	
	// ■ 페이지만 변경할 땐 이 함수를 바로 호출!, 레벨이 바뀌거나 지도를 이동했을 땐 useCoordinates 나 useEmdcode 함수 내부에서 호출 된다.
	let filter1 = document.getElementById('filter1').value;
	let filter2 = document.getElementById('filter2').value;
	let filter3 = document.getElementById('filter3').value;
	let filter4 = document.getElementById('filter4').value;
	let filter5 = document.getElementById('filter5').value;

	filterAddress = filter1 + '/' + filter2 + '/' + filter3 + '/' + filter4 + '/' + filter5 + '/';
	pageAddress = page + '/';
	console.log('paramAddress :', paramAddress);
	console.log('filter :', filterAddress);
	console.log('pageAddress :', pageAddress);
	
	const {data} = await axios.get('/drumtong/customer/laundry/customerSearch/rest/selectLaundry/' + paramAddress + filterAddress + pageAddress);
	const premiumList = data[0];
	
	const generalList = data[1];
	insertLaundryList(premiumList, generalList);
} 
function insertLaundryList(premiumList, generalList){ // ■ 세탁소 리스트를 생성해주는 부분!
	console.log('premiumList :', premiumList);
	console.log('generalList :', generalList);
}

useEmdcode('26350105');	// ■ 테스트 코드! 나중에 지워야 한다!