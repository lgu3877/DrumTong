// ============로그인과 상관없이 실행되는 메서드 목록=================
// 쿠폰 다운로드(사업자 측) 세팅 메서드
function couponSettings(couponList){ 
	modalCouponList = document.getElementById('modal-couponList');
	console.log(couponList);
	
	couponList.forEach(cl => {
		couponOption = document.createElement('option');
		couponOption.setAttribute('value', cl.couponid);
		couponOption.innerHTML = '<span><span>' + cl.discount + '</span><span>원 할인/</span><span>' + cl.minimumprice + '</span><span>원 이상[' + cl.period + ']</span></span>';
		
		modalCouponList.appendChild(couponOption);
	})
	
}
// 메뉴를 선택했을 때 실행하는 메서드(주문리스트에 추가해준다.)
function listUp(event) {
        choose = event.target;
    	 if(choose.className.includes("quick") || choose.className.includes("noQuick") || choose.className.includes("fas") || choose.className.includes("quantity")) return;
        selectedList = document.getElementById('selected-List');
        
        
        optionName = choose.children[0].children[0].innerText;
        optionText = choose.children[0].children[1].innerText;
        quantity = choose.children[1].value;
        price = choose.children[2].innerText;
        quick = choose.children[3];
        quickValue = choose.children[3].children[0].value;
        quickCheck = choose.children[3].children[0].checked;
        quickBoolean = (quickValue != 0);
        
        if(quantity !== '0'){
        	menuDiv_1 = document.createElement('div');
			menuDiv_1.setAttribute("class", "selected-row");
			
			// 1
			menuDiv_2 = document.createElement('div');
			menuDiv_2.setAttribute("class", "selected-text");
			
			menuDiv_2_1 = document.createElement('div');
			menuDiv_2_1.setAttribute("class", "selected-name");
			menuDiv_2_1.innerHTML = optionName;
			
			menuDiv_2_2 = document.createElement('div');
			menuDiv_2_2.setAttribute("class", "selected-context");
			menuDiv_2_2.innerHTML = optionText;
			
			menuDiv_2.appendChild(menuDiv_2_1);
			menuDiv_2.appendChild(menuDiv_2_2);
			
			// 2
			menuInput_3 = document.createElement('input');
			menuInput_3.setAttribute("class", "quantity");
			menuInput_3.setAttribute("type", "number");
			menuInput_3.setAttribute("min", "0");
			menuInput_3.setAttribute("value", quantity);
			
			// 3
			menuDiv_4 = document.createElement('div');
			menuDiv_4.setAttribute("class", "selected-price");
			menuDiv_4.innerHTML = price;
			
			//4
			menuLabel_5 = document.createElement('label');
			menuLabel_5.setAttribute("class", quick.className);
			menuLabel_5.setAttribute("title", quickBoolean ? "빠른서비스" : "퀵불가");
			
			menuInput_5_1 = document.createElement('input');
			menuInput_5_1.setAttribute("class", "quickcheck");
			menuInput_5_1.setAttribute("type", "checkbox");
			menuInput_5_1.checked = quickCheck;
			menuInput_5_1.setAttribute("value", quickValue);
			if(quickBoolean)
				menuInput_5_1.addEventListener('change', quickMark);
			
			menuI_5_2 = document.createElement('i');
			menuI_5_2.setAttribute("class", "fas fa-shipping-fast");
			menuI_5_2.innerHTML = quickBoolean ? (quickValue + "원") : "퀵불가";
			
			menuLabel_5.appendChild(menuInput_5_1);
			menuLabel_5.appendChild(menuI_5_2);
			
			
			// 5
			menuDiv_6 = document.createElement('div');
			
			menuButton_6_1 = document.createElement('button');
			menuButton_6_1.setAttribute("class", "remove-button");
			menuButton_6_1.addEventListener("click", removeOption);
			
			menuI_6_2 = document.createElement('i');
			menuI_6_2.setAttribute("class", "fas fa-times");
			
			menuButton_6_1.appendChild(menuI_6_2);
			menuDiv_6.appendChild(menuButton_6_1);
			
			menuDiv_1.appendChild(menuDiv_2);
			menuDiv_1.appendChild(menuInput_3);
			menuDiv_1.appendChild(menuDiv_4);
			menuDiv_1.appendChild(menuLabel_5);
			menuDiv_1.appendChild(menuDiv_6);
			selectedList.appendChild(menuDiv_1);
			
			calTotal();
			
			reset(choose);
        }
        
}
// 추가된 메뉴의 x 버튼을 누르면 취소시켜주는 메서드
function removeOption(){
        optionRow = event.target.parentNode.parentNode;
		
        optionRow.parentNode.removeChild(optionRow);

        calTotal();
}
// 메뉴를 추가했을 때 개수와 퀵여부를 리셋해주는 메서드(영경)
function reset(chs){
    	chs.children[1].value = 1;

        if(chs.children[3].className === "quick True"){
        	chs.children[3].className = "quick";
        	chs.children[3].children[0].checked = false;
        }
}

// 메뉴가 변경되었을 때, 금액을 계산해주는 메서드
function calTotal() {
        orders = document.querySelectorAll('.selected-row');
        quickText = document.getElementById('select-quick').children[0];	// 퀵 요금
        totalText = document.getElementById('select-total').children[0];	// 토탈 요금
        priceText = document.getElementById('modal-price').children[0]; // 모달창 결제 금액

        deliCheck = document.getElementById('deli-check');

        deli = 2000;

        if (!deliCheck.checked) {
          deli = 0;
        }

        quickPrice = 0;
        totalPrice = 0 + deli;

        for (i = 0; i < orders.length; i++) {
          quantity = orders[i].children[1].value;
          price = orders[i].children[2].innerText.split(' ')[0];
          quick = 0;

          if (orders[i].children[3].children[0].checked)
            quick = orders[i].children[3].children[0].value;

          quickCal = parseInt(quantity) * parseInt(quick);

          quickPrice += quickCal;

          totalPrice += parseInt(quantity) * parseInt(price) + quickCal;
        }
      
        quickText.innerText = quickPrice;
        console.log('계산 전', totalPrice);
        totalPrice -= checkAbleCoupon(totalPrice - deli);
        console.log('계산 후', totalPrice);
        totalText.innerText = totalPrice;
        priceText.innerText = totalPrice;
        
        ;
}
// 퀵 마크를 체크 또는 체크 해제 해주는 메서드
  function quickMark(){
    check = event.target;
    row = check.parentNode;
    row.className = check.checked ? "quick True" : "quick"; 
  }
// main 메뉴 클릭 시 서브 메뉴 나타나게 해주는 메서드
function afterMainClik(checkmct){
		selectMainKey = checkmct;
		selectSubKey = '';
		mainCtList.forEach(mct => {
			document.getElementById("main_"+mct).className = (mct === selectMainKey ? "mainButton_select" : "mainButton");
			})
		subCtList = Object.keys(menuList.menuList[selectMainKey]);
		subCategory.innerHTML="";
		menuCategory.innerHTML="";
		subCtList.forEach(sct =>{
			subDiv = document.createElement('div');
			subDiv.innerHTML = sct;
			subDiv.setAttribute("class", selectSubKey !== sct ? "subButton" : "subButton_select");
			subDiv.setAttribute("id", "sub_" + sct);
			subDiv.addEventListener('click', event => afterSubClick(sct));
			subCategory.appendChild(subDiv);
		})
		afterSubClick(subCtList[0]);
}
// 서브 메뉴 클릭 시 하위 메뉴 나타나게 해주는 메서드
function afterSubClick(checksct){
		selectSubKey = checksct;
		subCtList.forEach(mct => {
			document.getElementById("sub_"+mct).className = (mct === selectSubKey ? "subButton_select" : "subButton");
			})
		menuCtList = menuList.menuList[selectMainKey][selectSubKey];
		menuCategory.innerHTML="";
		createMenu(menuCtList);
}
// 하위 메뉴 생성 메서드
function createMenu(list){
	menuCategory.innerHTML="";
	list.forEach(li => {
		quickBoolean = (li.quickprice != 0);
		
		menuDiv_1 = document.createElement('div');
		menuDiv_1.setAttribute("class", "option-row");
		menuDiv_1.addEventListener('click', listUp);
		
		// 1
		menuDiv_2 = document.createElement('div');
		menuDiv_2.setAttribute("class", "option-text");
		
		menuDiv_2_1 = document.createElement('div');
		menuDiv_2_1.setAttribute("class", "option-name");
		menuDiv_2_1.innerHTML = selectMainKey + "/" + selectSubKey;
		
		menuDiv_2_2 = document.createElement('div');
		menuDiv_2_2.setAttribute("class", "option-context");
		menuDiv_2_2.innerHTML = li.name + "/예상시간 " + li.ete + "일";
		
		menuDiv_2.appendChild(menuDiv_2_1);
		menuDiv_2.appendChild(menuDiv_2_2);
		
		// 2
		menuInput_3 = document.createElement('input');
		menuInput_3.setAttribute("class", "quantity");
		menuInput_3.setAttribute("type", "number");
		menuInput_3.setAttribute("min", "0");
		menuInput_3.setAttribute("value", "1");
		
		// 3
		menuDiv_4 = document.createElement('div');
		menuDiv_4.setAttribute("class", "option-price");
		menuDiv_4.innerHTML = li.price + "원";
		
		//4
		menuLabel_5 = document.createElement('label');
		menuLabel_5.setAttribute("class", quickBoolean ? "quick" : "noQuick");
		menuLabel_5.setAttribute("title", quickBoolean ? "빠른서비스" : "퀵불가");
		
		menuInput_5_1 = document.createElement('input');
		menuInput_5_1.setAttribute("class", "quickcheck");
		menuInput_5_1.setAttribute("type", "checkbox");
		menuInput_5_1.checked= false;
		menuInput_5_1.setAttribute("value", li.quickprice);
		if(quickBoolean)
			menuInput_5_1.addEventListener('change', quickMark);
		
		menuI_5_2 = document.createElement('i');
		menuI_5_2.setAttribute("class", "fas fa-shipping-fast");
		menuI_5_2.innerHTML = quickBoolean ? (li.quickprice + "원") : "퀵불가";
		
		menuLabel_5.appendChild(menuInput_5_1);
		menuLabel_5.appendChild(menuI_5_2);
		
		
		menuDiv_1.appendChild(menuDiv_2);
		menuDiv_1.appendChild(menuInput_3);
		menuDiv_1.appendChild(menuDiv_4);
		menuDiv_1.appendChild(menuLabel_5);
		
		menuCategory.appendChild(menuDiv_1);
	})
}
// ---------모달 관련 메서드들------------
// 모달창을 열어주는 메서드
function openModal(currentModal, styleDisplay){
	modal.style.display = 'block';
	currentModal.style.display = styleDisplay;
}
function closeModal(currentModal){
	modal.style.display = 'none';
	currentModal.style.display = 'none';
}
function closeAllModal(){
	const reviewModals = document.querySelector('#modal-reiview').querySelectorAll('.detailview-review-row');
	for(i = reviewModals.length; i > 0; i--) {
    	   if(i == 1)
    		   reviewModals[i - 1].querySelector('.modal-grade').innerHTML = '';
    	   else
	 		   reviewModals[i - 1].remove();
	}

	modal.style.display = 'none';
	modalContent1.style.display = 'none';
	modalContent2.style.display = 'none';
	modalContent3.style.display = 'none';
	modalContent4.style.display = 'none';
}
// ============로그인 했을 때만 실행되는 메서드 목록=================
function oneCouponSettings(minimumprice, discount, period, couponid){ // 내 쿠폰을 현재 결제
	myCouponList = document.getElementById('select-coupon');
	newCoupon = document.createElement('option');
	newCoupon.setAttribute('value', couponid);
	
	newCoupon.innerHTML = '<span><span>' + discount + '</span><span>원 할인/</span><span>' + minimumprice + '</span><span>원 이상[' + period + ']</span></span>';
	
	myCouponList.appendChild(newCoupon);
}
function myCouponSettings (myCoupons){
	document.getElementById('select-coupon').removeChild(document.getElementById('noLogin'));
	myCoupons.forEach(co => {
		oneCouponSettings(co.minimumprice, co.discount, co.period, co.couponid);
	})
}
function addBookmark() {
   bookMarker = document.getElementById('bookMarker');
   className = bookMarker.className;
    if (className.search(/add/) > 0) {
      bookMarker.className = 'fas fa-star remove';
      iconColor = 'white';
    }
    else if (className.search(/remove/) > 0) {
      bookMarker.className = 'fas fa-star add';
      iconColor = 'yellow';
    }
    
    const axPost = async () =>{
       ob={
          'estid' : '${estid}',
          'result' : iconColor,
       };
       await axios.post('/drumtong/customer/laundry/customerDetail/rest/addBookmark/', ob)
       .then ((response) => {
          if(response.data === true){
             console.log("추가함");
          } else {
             console.log("삭제함");
          }
       })
       
    };
    axPost();
    
  }