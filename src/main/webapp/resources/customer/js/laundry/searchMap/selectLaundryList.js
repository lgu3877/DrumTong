var paramAddress = '';			// ■ 현재 지도 가져오는 데이터를 저장해두는 전역변수! 레벨이 바뀔 때 갱신 됨!, 단순 페이지만 이동할 때 쓰기위해 전역으로 둠

// 자식까지 함께 복사하려면 cloneNode() 안에 true도 입력하여야 한다
var common_clone = document.querySelector('.laundryList_common').cloneNode(true);


// 지도가 변화할 때 함수를 불러오기!	// 남서 북동
function useCoordinates(swLatLng, neLatLng) {			// ■ 남서, 북동쪽 좌표를 보내주어 데이터를 가져올 때 쓰는 함수
	console.log('[test코드]swLatLng :', swLatLng);
	console.log('[test코드]neLatLng :', neLatLng);
	let bottom_ = swLatLng.getLat();
	let left_ = swLatLng.getLng();
	let top_ = neLatLng.getLat();
	let right_ = neLatLng.getLng();

	paramAddress = 'coordinate/' + left_ + '/' + right_ + '/' + top_ + '/' + bottom_ + '/';
	console.log('paramAddress :', paramAddress);

	selectLaundry(1);		// 1 페이지 기준
}
function useEmdcode(emdcode) {							// ■ 읍면동 코드를 이용해 데이터를 가져올 때 쓰는 함수
	console.log('[test코드]emdcode :', emdcode);

	paramAddress = 'emdcode/' + emdcode + '/';
	console.log('paramAddress :', paramAddress);

	selectLaundry(1);		// 1 페이지 기준
}
async function selectLaundry(page) {
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

	const { data } = await axios.get('/drumtong/customer/laundry/customerSearch/rest/selectLaundry/' + paramAddress + filterAddress + pageAddress);
	const premiumList = data[0];
	const generalList = data[1];

	console.log('premiumList : ', premiumList);
	console.log('generalList : ', generalList);

	insertLaundryList(premiumList, generalList);
}

// ■ 세탁소 리스트를 생성해주는 부분!
function insertLaundryList(premiumList, generalList) {
	console.log('premiumList :', premiumList);
	console.log('generalList :', generalList);

	createPremium(premiumList);
	createGeneral(generalList);
}

// ■ 프리미엄 리스트를 생성하는 함수
function createPremium(premiumList) {
	let laundryList_premium = document.querySelector('#laundryList_premium');
	let primium_childs = laundryList_premium.querySelectorAll('.premium_childs');
	const p_length = premiumList.length;


	// 프리미엄 리스트 부분 생성하는 조건문 시작지점
	if (p_length == 0) {
		primium_childs[0].style.display = 'none';
		primium_childs[1].style.display = 'none';
	}
	else if (p_length > 0) {
		for (let i = 0; i < premiumList.length; i++) {
			primium_childs[i].style.display = '';
			
			console.log(typeof premiumList[i].mainimg);
			primium_childs[i].querySelector('.mainimg').setAttribute('src',  'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/' + premiumList[i].mainimg);
			
			const img_path = 'location.href = "' + getContextPath() + '/customer/laundry/customerDetail/' + premiumList[i].estid + '/"'
			primium_childs[i].querySelector('.mainimg').setAttribute('onclick', img_path);
			
			primium_childs[i].querySelector('.brandnaming').innerHTML = premiumList[i].brandnaming +
				'<span class="reviewnum">(' + premiumList[i].reviewnum + ')</span>';
			primium_childs[i].querySelector('.gpa').innerHTML = premiumList[i].gpa.toFixed(1);
			primium_childs[i].querySelector('.mainlocation').innerHTML = premiumList[i].mainlocation;
			primium_childs[i].querySelector('.mainlocation').setAttribute('title', premiumList[i].mainlocation);
			
						
			// 명품류, 하의, 상의 등 이미지 넣기
			const defaultcategory = premiumList[i].defaultcategory.split('/');
			for (let j = 0; j < defaultcategory.length - 1; j++) {
				let img_div = document.createElement('img');
				img_div.setAttribute('src', getContextPath() + '/resources/business/img/category/' + defaultcategory[j] + '.jpg');
				primium_childs[i].querySelector('.childs_image_1_1').append(img_div);
			}
		}
		
		// 만약 리스트가 한개면 두번째 div 는 숨기기
		if (premiumList.length == 1)
			primium_childs[1].style.display = 'none';
	}
}


function createGeneral(generalList) {
//	document.querySelector('.laundryList_child_list').append(common_clone);
	let laundryList = document.querySelector('.laundryList_child_list');
	const half_length = Math.round(generalList.length / 2) - 1;
	
	console.log('half_length : ' + half_length);
	
	for(let i = 0; i < half_length; i++) {
		laundryList.append(common_clone);
	}
	

}

useEmdcode('26350105');	// ■ 테스트 코드! 나중에 지워야 한다!