// Menu Name List
const mainCtList = Object.keys(menuList.menuList); // 메뉴 이름 리스트

// Get Tags (메인 카테고리, 서브 카테고리, 리뷰 셀렉터)
const mainCategory = document.getElementById('mainCate');
const subCategory = document.getElementById('subCate');
const menuCategory = document.getElementById('detailview-selectOptions');

// Keys (Main & Sub)
let selectMainKey = Object.keys(menuList.menuList)[0]; // main-key
let selectSubKey = ''; // sub-key
	
// Open Modal
const modal = document.getElementById('myModal');

// Modal Content 1 ~ 5 (쿠폰받기, 결제화면, 로그인, 리뷰 화면, 리뷰)
const modalContent1 = document.getElementById('modal-content1');   // 쿠폰 받기
const modalContent2 = document.getElementById('modal-content2');   // 결제 화면
const modalContent3 = document.getElementById('modal-content3');   // 로그인
const modalContent4 = document.getElementById('modal-content4');   // 리뷰 화면
const modalContent5 = document.getElementById('modal-content5');   // 리뷰

// 클릭 화면
const modalContent5_exit = document.getElementById('modal-content5-exit');

// Set Modal-Open Button
var btn1 = document.getElementById('add-coupon');
var btn2 = document.getElementById('order-submit');
var btn3 = document.getElementById('review-more');
var btn4 = document.getElementById('modal-submit');
var btn5 = document.getElementById('modal-addCoupon');// 모달에서 쿠폰받기 누르면
var btn6 = document.getElementById('bookMarker'); // 북마크 버튼
	
// Set Modal-Close Button
var span = document.getElementsByClassName('close')[0];
		
			
		
//Execution 
initPage(checkLogin);
			
			
// 로그인 스테이터스 확인 (Check Login Status)
function checkLoginSettings(checkLoginBoolean, CouponList, myPoint, Bookmark) {
	// 로그인 확인
	checkLogin = checkLoginBoolean;
	
	// 모달 닫기
	closeAllModal();
	
	// When the user clicks on the button, open the modal
	btn1.onclick = function () { 
		openModal(checkLogin ? modalContent1 : modalContent3 , 'flex');
	};
	
	btn2.onclick = function () {
		if(document.getElementById('selected-List').children.length == 0)
			alert('주문 목록이 비었습니다.');
		else
			openModal(checkLogin ? modalContent2 : modalContent3, 'flex'); };
			
			btn3.onclick = function () { openModal(modalContent4, ''); reviewMore(); };
			
			btn4.onclick = function () { modal.style.display = 'block'; submit(); };
			
			
			btn5.onclick = async function(){
				if(checkLogin){
					selectedCouponID = document.getElementById('modal-couponList').value;
					if(!selectedCouponID.includes('CouponID_')){
						alert('발급 가능한 쿠폰이 없습니다.');
						return;
					}
					ob={
							'couponid' : selectedCouponID,
					};
					const {data} = await axios.post(getContextPath() + '/customer/laundry/customerDetail/rest/addCoupon/', ob);
					alert(data ? '발급 성공' : '이미 발급받은 쿠폰입니다.');
					if(data){
						let listCoupon = document.getElementById('modal-couponList');
						
						for(check = 0; check < listCoupon.length; check++){
							if(listCoupon.children[check].value === selectedCouponID){
								val1 = listCoupon.children[check].children[0].children[0].innerHTML;
								val2 = listCoupon.children[check].children[0].children[2].innerHTML;
								val3 = listCoupon.children[check].children[0].children[4].innerHTML;
								oneCouponSettings(val1, val2, val3, selectedCouponID);
								calTotal();
							}
						}
					}
					closeModal(modalContent1);
				}
			}
			btn6.onclick = function(){
				if(checkLoginBoolean){
					addBookmark(estid);
				} else {
					openModal(modalContent3 , 'flex');
				}
			}
			bookMarker = document.getElementById('bookMarker');
			checkBM = Bookmark === 'y' ? true : false;
			bookMarker.setAttribute('class', 'fas fa-star ' + (checkBM ? 'add': 'remove'));
			if(checkLogin){
				// 로그인 되어있을 때
				myCouponSettings(CouponList); // 고객 쿠폰 다운로드
				
				document.getElementById('my-point').children[0].innerHTML = myPoint; // 현재
				// 포인트
				
				// 사용할 수 있는 쿠폰을 체크하도록
				calTotal();
			}
			else{
				document.getElementById('loginSubmit').addEventListener('click', function(){ logiinSubmit('asynchronous'); });
			}
} 
			
	
		

// Activate Date Area
function activeSelectDateArea(event) {
	let buttonShape = document.querySelector(".select-date b");
	let area = document.getElementById('select-date-area');
	
	switch(buttonShape.innerHTML){
	case '▶':
		buttonShape.innerHTML = '▼';
		area.style.display = 'flex';
		break;
	case '▼':
		buttonShape.innerHTML = '▶';
		area.style.display = 'none';
		break;
	}
}
		


// Check if data is 'Equal'
function isEquals(optionName, optionText, quantity, quickCheck) {
	let selectList = document.querySelectorAll('.selected-row');
	
	for(let i = 0; i < selectList.length; i++){
		let select = selectList[i];
		
		if(select.querySelector('.selected-text .selected-name').innerText === optionName
				&& select.querySelector('.selected-text .selected-context').innerText === optionText
				&& select.querySelector('.quickcheck').checked === quickCheck){
			console.log('같은 데이터다!');
			select.querySelector('.quantity').value = parseInt(select.querySelector('.quantity').value) + parseInt(quantity);
			return false;
		}
	}
	return true;
}



//페이지 로드 (Initialize Page)
function initPage(checkLogin) {
	console.log("실행(checkLogin 확인)", checkLogin)
	
	// 수량 바뀌는 이벤트 리스너를 이곳에서 삽입
	document.getElementById('selected-List').addEventListener('change', calTotal);
	document.getElementById('select-coupon').addEventListener('change', calTotal);
	
	// 메인 카테고리 버튼 넣는 부분
	mainCtList.forEach(mct => {
		mainDiv = document.createElement('div');
		mainDiv.innerHTML = mct;
		mainDiv.setAttribute("class", "mainButton");
		mainDiv.setAttribute("id", "main_" + mct);
		mainDiv.addEventListener('click', event => afterMainClik(mct));
		mainCategory.appendChild(mainDiv);
	})
	afterMainClik(selectMainKey);
	
	// 수량 바뀌는 이벤트 리스너를 이곳에서 삽입
	document.getElementById('selected-List').addEventListener('change', calTotal);
	
	// 로그인 여부에 따라 나뉘는 메서드들
	checkLoginSettings(checkLogin, (checkLogin ? couponList : ''), '${myPoint }', '${Bookmark}');
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function () { closeAllModal(); };
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function (event) { if (event.target == modal) closeAllModal(); };
	
	
	
	// 매장의 쿠폰 불러오기
	couponSettings(bCouponVO);
	
	// 매장 이미지 불러오기
	imgSettings(bImageVO);
}

