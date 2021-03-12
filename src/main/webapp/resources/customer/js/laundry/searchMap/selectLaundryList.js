var paramAddress = '';			// ■ 현재 지도 가져오는 데이터를 저장해두는 전역변수! 레벨이 바뀔 때 갱신 됨!, 단순 페이지만 이동할 때 쓰기위해 전역으로 둠

// 자식까지 함께 복사하려면 cloneNode() 안에 true도 입력하여야 한다
//var common_clone = document.querySelector('.laundryList_common').cloneNode(true);
var common_clone = document.querySelector('.common_list').cloneNode(true);


// 지도가 변화할 때 함수를 불러오기!	// 남서 북동
function useCoordinates(swLatLng, neLatLng) {			// ■ 남서, 북동쪽 좌표를 보내주어 데이터를 가져올 때 쓰는 함수
//	console.log('[test코드]swLatLng :', swLatLng);
//	console.log('[test코드]neLatLng :', neLatLng);
	let bottom_ = swLatLng.getLat();
	let left_ = swLatLng.getLng();
	let top_ = neLatLng.getLat();
	let right_ = neLatLng.getLng();

	paramAddress = 'coordinate/' + left_ + '/' + right_ + '/' + top_ + '/' + bottom_ + '/';
//	console.log('paramAddress :', paramAddress);

	selectLaundry(1);		// 1 페이지 기준
}
function useEmdcode(emdcode) {							// ■ 읍면동 코드를 이용해 데이터를 가져올 때 쓰는 함수
//	console.log('[test코드]emdcode :', emdcode);

	paramAddress = 'emdcode/' + emdcode + '/';
//	console.log('paramAddress :', paramAddress);

	selectLaundry(1);		// 1 페이지 기준
}
async function selectLaundry(page) {
	// ■ 페이지만 변경할 땐 이 함수를 바로 호출!, 레벨이 바뀌거나 지도를 이동했을 땐 useCoordinates 나 useEmdcode 함수 내부에서 호출 된다.
	let filter1 = document.getElementById('filter1').value;
	let filter2 = document.getElementById('filter2').value;
	let filter3 = document.getElementById('filter3').value;
	let filter4 = document.getElementById('filter4').value;

	filterAddress = filter1 + '/' + filter2 + '/' + filter3 + '/' + filter4 + '/';
	pageAddress = page + '/';
//	console.log('paramAddress :', paramAddress);
//	console.log('filter :', filterAddress);
//	console.log('pageAddress :', pageAddress);

	const { data } = await axios.get(getContextPath() + '/customer/laundry/customerSearch/rest/selectLaundry/' + paramAddress + filterAddress + pageAddress);
	const premiumList = data[0];
	const generalList = data[1];
	const resultNum = data[2];
//	console.log('data[3] : ' + data[3]);
//
//	console.log('select_premiumList : ', premiumList);
//	console.log('select_generalList : ', generalList);
//	console.log('resultNum : ', resultNum);
	document.getElementById('total-laundry').innerHTML = resultNum;
	insertLaundryList(premiumList, generalList);
}

// ■ 세탁소 리스트를 생성해주는 부분!
function insertLaundryList(premiumList, generalList) {
//	console.log('premiumList :', premiumList);
//	console.log('generalList :', generalList);

	createPremium(premiumList);
	deleteGeneral(generalList);
	
	if(generalList.length != 0)
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
		
//			console.log('i : ' + i);
		
			primium_childs[i].style.display = '';
			
			primium_childs[i].querySelector('.mainimg').setAttribute('src',  'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/' + premiumList[i].mainimg);
			
			const img_path = 'location.href = "' + getContextPath() + '/customer/laundry/customerDetail/' + premiumList[i].estid + '/"'
			primium_childs[i].querySelector('.mainimg').setAttribute('onclick', img_path);
			
			primium_childs[i].querySelector('.brandnaming').innerHTML = premiumList[i].brandnaming +
				'<span class="reviewnum">(' + premiumList[i].reviewnum + ')</span>';
			primium_childs[i].querySelector('.gpa').innerHTML = premiumList[i].gpa.toFixed(1);
			primium_childs[i].querySelector('.mainlocation').innerHTML = premiumList[i].mainlocation;
			primium_childs[i].querySelector('.mainlocation').setAttribute('title', premiumList[i].mainlocation);
			
			// 이전에 img 태그를 넣었던 div(className = 'childs_image_1_1')는 새로 함수가 시작될때마다 삭제하도록 한다
			// 그렇지 않으면 div 내부의 이미지가 계속 늘어나게 된다
			let primium_info = primium_childs[i].querySelector('.childs_info_1_1');
			primium_info.removeChild(primium_info.querySelector('.childs_image_1_1'));	
			
			let primium_image = document.createElement('div');
			primium_image.className = 'childs_image_1_1';
						
			// 명품류, 하의, 상의 등 이미지 넣기
			const defaultcategory = premiumList[i].defaultcategory.split('/');
			for (let j = 0; j < defaultcategory.length - 1; j++) {
				let img_div = document.createElement('img');
				img_div.setAttribute('src', 'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/business/img/category/' + defaultcategory[j] + '.jpg');
				primium_image.append(img_div);
			}
			
			primium_info.append(primium_image);	// 생성한 이미지 div 태그를 넣어준다
			
		}
		
		// 만약 리스트가 한개면 두번째 div 는 숨기기
		if (premiumList.length == 1)
			primium_childs[1].style.display = 'none';
	}
}

// ■ 일반리스트를 삭제해주는 함수 -> 페이지 기능을 위해서 만듬
function deleteGeneral(generalList) {

	let common_lists = document.querySelectorAll('.common_list');
	
	if(generalList.length == 0) {
		common_lists[0].style.display = 'none';
	}
	else
		common_lists[0].style.display = '';
	
	for(let i = 1; i < common_lists.length; i++) {
		document.querySelector('.laundryList_common').removeChild(common_lists[i]);
	}
}

// ■ 일반리스트를 만들어주는 함수
function createGeneral(generalList) {
//	let laundryList = document.querySelector('.laundryList_child_list');
	let laundryList = document.querySelector('.laundryList_common');
	const half_length = Math.round(generalList.length / 2) - 1;
	
	for(let i = 0; i < half_length; i++) {
		laundryList.append(common_clone);
	}
	
	let common_childs = document.querySelectorAll('.common_list');


	// 일반리스트는 10개를 가지며 최대 5개의 class="laundryList_common"의 div 태그를 가진다
	// class="laundryList_common" 를 지닌 div는 한줄마다 class="common_list"를 지닌 div 태그가 공간을 차지한다
	// 
	for(let j = 0; j < common_childs.length; j++) {
			
			let count = Number(2 * j);		// 다섯번 반복하므로 한번 반복 때마다 두개의 common_childs애 입력하고자 count 변수를 만듬 
			
			common_childs[j].querySelectorAll('.mainimg')[0].setAttribute('src', 
				'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/' + generalList[count].mainimg);
			
			const img_path0 = 'location.href = "' + getContextPath() + '/customer/laundry/customerDetail/' + generalList[count].estid + '/"'
			common_childs[j].querySelectorAll('.mainimg')[0].setAttribute('onclick', img_path0);
			common_childs[j].querySelectorAll('.brandnaming')[0].innerHTML = generalList[count].brandnaming +
				'<span class="reviewnum">(' + generalList[count].reviewnum + ')</span>';
			common_childs[j].querySelectorAll('.gpa')[0].innerHTML = generalList[count].gpa.toFixed(1);
			common_childs[j].querySelectorAll('.mainlocation')[0].innerHTML = generalList[count].mainlocation;
			common_childs[j].querySelectorAll('.mainlocation')[0].setAttribute('title', generalList[count].mainlocation);
			
			
			// 이전에 img 태그를 넣었던 div(className = 'childs_image_1_1')는 새로 함수가 시작될때마다 삭제하도록 한다
			// 그렇지 않으면 div 내부의 이미지가 계속 늘어나게 된다
			let common_info_0 = common_childs[j].querySelectorAll('.childs_info_1_1')[0];
			common_info_0.removeChild(common_info_0.querySelector('.childs_image_1_1'));	
			
			let common_image_0 = document.createElement('div');
			common_image_0.className = 'childs_image_1_1';
						
			// 명품류, 하의, 상의 등 이미지 넣기
			const defaultcategory0 = generalList[count].defaultcategory.split('/');
			for (let n = 0; n < defaultcategory0.length - 1; n++) {
				let img_div0 = document.createElement('img');
				img_div0.setAttribute('src', 'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/business/img/category/' + defaultcategory0[n] + '.jpg');
				common_image_0.append(img_div0);
			}
			
			common_info_0.append(common_image_0);	
			
			// 예를 들어 일반리스트가 5개라면??
			// 3번째 반복문 돌릴 때, generalList.length = 5 이고, count = 4가 된다
			// 그러면 5 - 4 == 1 이라는 조건문을 통해서 뒤의 class="common_childs"를 숨기면 된다
			// generalList.length = 2, 4, 6, 8, 10 처럼 짝수인 경우는 고려하지 않아도 된다
			// 왜냐하면... 
			if(generalList.length - count == 1) {
				common_childs[j].querySelectorAll('.common_childs')[1].style.display = 'none';
				break;
			}
			else {
				common_childs[j].querySelectorAll('.common_childs')[1].style.display = '';
				common_childs[j].querySelectorAll('.mainimg')[1].setAttribute('src', 
						'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/' + generalList[Number(count + 1)].mainimg);
			
				const img_path1 = 'location.href = "' + getContextPath() + '/customer/laundry/customerDetail/' + generalList[Number(count + 1)].estid + '/"'
				common_childs[j].querySelectorAll('.mainimg')[1].setAttribute('onclick', img_path1);
				common_childs[j].querySelectorAll('.brandnaming')[1].innerHTML = generalList[Number(count + 1)].brandnaming +
					'<span class="reviewnum">(' + generalList[Number(count + 1)].reviewnum + ')</span>';
				common_childs[j].querySelectorAll('.gpa')[1].innerHTML = generalList[Number(count + 1)].gpa.toFixed(1);
				common_childs[j].querySelectorAll('.mainlocation')[1].innerHTML = generalList[Number(count + 1)].mainlocation;
				common_childs[j].querySelectorAll('.mainlocation')[1].setAttribute('title', generalList[Number(count + 1)].mainlocation);
			
			
				let common_info_1 = common_childs[j].querySelectorAll('.childs_info_1_1')[1];
				common_info_1.removeChild(common_info_1.querySelector('.childs_image_1_1'));	
			
				let common_image_1 = document.createElement('div');
				common_image_1.className = 'childs_image_1_1';
						
			
				// 명품류, 하의, 상의 등 이미지 넣기
				const defaultcategory1 = generalList[Number(count + 1)].defaultcategory.split('/');
				for (let m = 0; m < defaultcategory1.length - 1; m++) {
					let img_div1 = document.createElement('img');
					img_div1.setAttribute('src', 'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/business/img/category/' + defaultcategory1[m] + '.jpg');
					common_image_1.append(img_div1);
				}
				
				common_info_1.append(common_image_1);
			}
	}
}



//useEmdcode('26350105');	// ■ 테스트 코드! 나중에 지워야 한다!