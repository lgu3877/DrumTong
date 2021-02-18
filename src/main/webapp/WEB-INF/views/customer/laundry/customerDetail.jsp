<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
 
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>customerDrumtong :: customerDetail</title>
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet" type="text/css">
    <link rel="stylesheet" href="${cpath }/customer/css/customerStyle.css">
    <link rel="stylesheet" href="${cpath }/customer/css/laundry/customerDetail.css">
    <link rel="stylesheet" href="${cpath }/customer/css/membership/customerMembership.css">
	 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
	<script type="text/javascript" src="${cpath }/customer/js/main/customerHeader.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://kit.fontawesome.com/7522a35233.js" crossorigin="anonymous"></script>

   	<!-- Google Chart -->
   	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

   	<!-- AXIOS -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
 	<!-- 스크립트 영역 -->
    <script type="text/javascript" src="${cpath }/customer/js/membership/customerLogin.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail.js"></script>
   	
	<script>
	// 쿠폰을 사용했을 때 couponid 값을 넘기도록 설정해주어야 한다!
		function checkAbleCoupon(currentPrice){
			let result = 0
			if(checkLogin){
				couponcCheckList = document.getElementById('select-coupon');
				
				couponNum = couponcCheckList.children.length;
				selectValue = couponcCheckList.value;
				// 현재 체크되어있는 value 값이 사용할수 없을 땐 첫번째가 선택되있게 변경하기
				for(num = 1; num < couponNum; num++){
					spanCoupon = couponcCheckList.children[num];
					spanCouponIn = spanCoupon.children[0];
					if(currentPrice < spanCouponIn.children[2].innerHTML){ // 사용할 수 없는 쿠폰일 땐 선택 못하게 설정
						spanCoupon.setAttribute('disabled','disabled');
					} else{ // 사용할 수 있는 쿠폰일 땐 선택 할 수 있게 설정
						spanCoupon.removeAttribute('disabled');
					}
					
					// 금액이 바뀌었을 때 선택되어있는 쿠폰이 사용할 수 없는 쿠폰이면 선택 X 로 selected 설정
					if(selectValue === spanCoupon.value){
						if(currentPrice < spanCouponIn.children[2].innerHTML){
							couponcCheckList[0].selected = true;
						} else {
							result = spanCouponIn.children[0].innerHTML;
						}
					}
				}
				
			}
			return result;
		}
		// 로그인이 되어있을 때 첫 번째로 실행, 금액이 바뀔때마다 실행(단, 로그인 여부를 구분해주어야 한다)
	</script>
    <script>
      function submit() {
        selecteds = document.querySelectorAll('.selected-row');

        cnt = 0;

        orderMap = new Array();

        for (i = 0; i < selecteds.length; i++) {
          optionKey = selecteds[i].firstChild.children[0].innerText;
          optionValue = selecteds[i].children[1].value;

          // orderMap.put(optionKey, optionValue);
          order = {
            optionKey: optionKey,
            optionValue: optionValue,
          };
          orderMap.push(order);
          
          cnt++;
        }

        if (cnt !== selecteds.length) return;

        $.ajax({
          url: '${cpath}/payment/',
          type: 'post',
          dataType: 'json',
          data: { orderMap: orderMap },
          success: function (data) {
            console.log('성공');
          },
        });
      } //submit 체크 함수 종료
    </script>

</head>
    
<body>
<%@ include file="../main/customer_Header.jsp"%>
    <!-- 본문 영역 -->
<!--     <header>헤더셈</header> -->
    <section class="section-SangJae">
      <div class="detailview-wrap">
        <div class="detailview-top">
          <div class="detailview-imgBlock" id="detailview-imgBlock">
            <div class="detailview-imgBlock-main">
              <img src="" />
            </div>
            <div class="detailview-imgBlock-subRow">
              <img src="" id="imgBox1" class="select exist"/>
              <img src="" id="imgBox2" />
              <img src="" id="imgBox3" />
              <img src="" id="imgBox4" />
              <img src="" id="imgBox5" />
              <img src="" id="imgBox6" />
            </div>
          </div>
          <div class="detailview-companyIntro">
            <div class="detailview-intro-headline">
              <h1>${bInformationVO.brandnaming}</h1>
              <i id="bookMarker"></i>
            </div>
            <textarea readonly>${bManagementVO.introduction }</textarea>
          </div>
        </div>

        <div class="detailview-bottom">
          <div class="detailview-options">
            <button class="add-coupon" id="add-coupon" value="1000">쿠폰 받기</button>

           	<div class="detailview-mainCate" id="mainCate">
           	</div>
           	<hr>
           	<div class="detailview-subCate" id="subCate">
           	</div>
           	<br>
            <div class="detailview-selectOptions" id="detailview-selectOptions">
            </div>
          </div>

          <div class="detailview-select">
            <div class="select-head">
              My Selection
            </div>
            <div class="select-list" id="selected-List"></div>

            <div class="select-coupon">
              내 쿠폰
              <select id="select-coupon">
                       <option value="noCoupon">선택 X</option>
                       <option id="noLogin" disabled>로그인 후 이용가능</option>
              </select>
            </div>
            <div class="select-deli" id="select-deli"><input type="checkbox" id="deli-check" checked onclick="calTotal()" /> 배달 (+ 2000 원)</div>
            <div class="select-quick" id="select-quick">
              Quick 요금 : <span>0</span> 원
            </div>
            <div class="select-total" id="select-total">
              Total : <span>2000</span> 원
            </div>
            <button class="order-submit" id="order-submit">결제하기</button>
          </div>
        </div>

       <div class="googlechart-div">
       		<div class="leftchartdiv">
	          <div id="columnchart_values"></div>
       		</div>
       		<div class="rightchartdiv">
	        	<div class="rightinner">
	         		<div class="cscore" id="cscore"></div>
	         		<div class="backstars">
	         			<i class="fas fa-star"></i>
	         			<i class="fas fa-star"></i>
	         			<i class="fas fa-star"></i>
	         			<i class="fas fa-star"></i>
	         			<i class="fas fa-star"></i>
	         			<div class="frontstars" id="frontstars">
	         				<i class="fas fa-star"></i>
	         				<i class="fas fa-star"></i>
	         				<i class="fas fa-star"></i>
	         				<i class="fas fa-star"></i>
	         				<i class="fas fa-star"></i>
	         			</div>
	         		</div>
	          	</div>
	          	<div id="donut_single" style="height: 70%; position: relative;">
	          	
	          		<div class="outer-more">
	          			<div class="review-more" id="review-more">
	          				<p>리뷰<br>더보기</p>
	          			</div>	          		
	          		</div>
    	        </div>
       		</div>
        </div>
      </div>
    </section>

<!-- 	영경 스크립트, 메뉴판 출력! -->
	<script>
// 		imgList = ${bImageVO};
// 		i = 0;
// 		imgBoxs = document.querySelectorAll('detailview-imgBlock');
		
// 		imgList.forEach(img =>{
// 			imgBoxs[i++].src = 'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/' + img.storeimg;
// 		})
		var menuList = ${menuList};
		mainCtList = Object.keys(menuList.menuList);
		mainCategory = document.getElementById('mainCate');
		subCategory = document.getElementById('subCate');
		menuCategory = document.getElementById('detailview-selectOptions');
		
		// 0번째 메인 메뉴
		selectMainKey =Object.keys(menuList.menuList)[0];
		// 0번째 서브 메뉴
		selectSubKey = '';
		// 메인 카테고리 버튼 넣는 부분
		mainCategory.innerHTML="";
		mainCtList.forEach(mct => {
			mainDiv = document.createElement('div');
			mainDiv.innerHTML = mct;
			mainDiv.setAttribute("class", "mainButton");
			mainDiv.setAttribute("id", "main_" + mct);
			mainDiv.addEventListener('click', event => afterMainClik(mct));
			mainCategory.appendChild(mainDiv);
		})
		afterMainClik(selectMainKey);
		
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
		
		function afterSubClick(checksct){
			selectSubKey = checksct;
			subCtList.forEach(mct => {
				document.getElementById("sub_"+mct).className = (mct === selectSubKey ? "subButton_select" : "subButton");
				})
			menuCtList = menuList.menuList[selectMainKey][selectSubKey];
			menuCategory.innerHTML="";
			createMenu(menuCtList);
		}
		
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
	</script>

<!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->

      <div class="modal-content1" id="modal-content1">
        <select class="modal-couponList" id="modal-couponList"></select>
        <button class="modal-addCoupon" id="modal-addCoupon">받기</button>
      </div>

      <div class="modal-content2" id="modal-content2">
        <div class="modal-total">
          total
        </div>
        <div class="modal-payment">
          <div class="modal-payment-head">
            결제
            <div class="close">&times;</div>
          </div>
          <textarea readonly>
           약관을 읽고 동의해주세요 
          </textarea>
          <select class="modal-myCardList">
            <option selected>포인트 결제</option>
          </select>
          <div id="modal-price" class="modal-price">결제 금액 : <span></span> 원</div>
          <div id="my-point" class="modal-price">현재 포인트 : <span></span> 원</div>
          <button class="modal-submit" id="modal-submit">결제하기</button>
        </div>
      </div>

      <div class="modal-content3" id="modal-content3">
        <form method="POST" id="loginForm">
          <img src="${cpath }/resources/customer/img/logo4.png" class="login-logo" />
          <div class="login-alert">메세지</div>
          <div class="login-input">
            <input type="text" name="id" placeholder="ID" id="userid" class="login-input-boxs" />
            <input type="password" name="pw" placeholder="PW" id="userpw" class="login-input-boxs" />
         <input type="hidden" name="estid" value="${estid }">
            <div class="login-check">
              <label><input type="checkbox" name="storeid" id="storeid" class="login-storeid" />ID 기억하기</label>
              <a href="#" class="login-idFind">ID/PW 찾기</a>
            </div>

            <div class="login-buttons">
              <input type="button" value="login" id="loginSubmit" class="login-input-buttons" />
              <input type="button" value="Join" id="loginJoin" class="login-input-buttons" />
            </div>
          </div>
        </form>
      </div>

      <div class="modal-content4" id="modal-content4" style="display: none">
      	<div style="background: #35aefd; color: white; height: 60px; display: flex; align-items: center; ">
      		<h2 style="margin: 0; font-size: 13pt;">리뷰게시판</h2>
      	</div>

        <div class="modal-reiview" id="modal-reiview">
          <div class="detailview-review-row">
            <div class="review-head">
              <div class="review-profilePic"><img></div>
              <div class="review-writer">
              	<div class="right-row">
                	<p class="customerName"></p>
            	    <div>
	            	   <p class="mgood"></p>
	             	   <p class="visit"> 방문수 1 · </p>
	               	   <p class="gpa"></p>
	                </div>
                </div>
              </div>
            </div>
            <div style="height: 30px; background: grey; color: white;">추가 확보 공간</div>            
            <div class="review-reviewimg" style="display: none"><img></div>
            <div class="modal-grade"><span></span></div>
            <div class="review-context"></div>
            <div class="owner-review">
            	<h1 class="owner-name"></h1>
            	<p class="owner-content">사장님 댓글 공간입니다</p>
            </div>
          </div>
        </div>
      </div>
      
      <div class="modal-content5" id="modal-content5" style="display: none">
      		<img>
      </div>
      <div id="modal-content5-exit" style="display: none"  onclick="DeactiveModal5()">
      		<i class="fas fa-times fa-4x"></i>
      </div>
    </div>

    <!-- 스크립트 영역 -->
    <script type="text/javascript">	// 승원 작업 - 구글 차트
    
	var reviewList = ${ReviewList};
    
	window.onload = function() {
    	// 구글 부분 스크립트
    	// 이번엔 gson 받아올 때 단순하게  가아니라 .js 에서도 사용될 수 있도록 받아오자
    	google.charts.load("current", {packages:['corechart']});
   	 	google.charts.setOnLoadCallback(drawChart);
	   	calcscore();
	}
    </script>
    
    <script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail/detail-google.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail/detail-modal.js"></script>
    <script>
//     	총 정리
		cLogin = '${cLogin}';
		checkLogin = cLogin !== ''; // 로그인 했을 땐 true, 로그인 안되어있을 땐 false
		
   		// 메뉴 세팅 관련 메서드
   		menuList = ${menuList};
   		mainCtList = Object.keys(menuList.menuList);
   		mainCategory = document.getElementById('mainCate');
   		subCategory = document.getElementById('subCate');
   		menuCategory = document.getElementById('detailview-selectOptions');
   		// 0번째 메인 메뉴
   		selectMainKey =Object.keys(menuList.menuList)[0];
   		// 0번째 서브 메뉴
   		selectSubKey = '';
   		
  	    // Get the modal
       var modal = document.getElementById('myModal');

       var modalContent1 = document.getElementById('modal-content1');   // 쿠폰 받기 화면
       var modalContent2 = document.getElementById('modal-content2');   // 결제 화면
       var modalContent3 = document.getElementById('modal-content3');   // 로그인 화면
       var modalContent4 = document.getElementById('modal-content4');   // 리뷰 화면

       // Get the button that opens the modal
       var btn1 = document.getElementById('add-coupon');
       var btn2 = document.getElementById('order-submit');
       var btn3 = document.getElementById('review-more');
       var btn4 = document.getElementById('modal-submit');
       var btn5 = document.getElementById('modal-addCoupon');// 모달에서 쿠폰받기 누르면
	   var btn6 = document.getElementById('bookMarker'); // 북마크 버튼
       
       // Get the <span> element that closes the modal
       var span = document.getElementsByClassName('close')[0];
   		// 페이지 초기화
    	function initPage(checkLogin){
			// 1. 로그인 여부와 상관없이 초기세팅되어야 하는 메서드들
			// 2. 로그인 여부에 따라 나뉘는 세팅들
    		
   	    	//수량 바뀌는 이벤트 리스너를 이곳에서 삽입
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
    		
            //수량 바뀌는 이벤트 리스너를 이곳에서 삽입
    	    document.getElementById('selected-List').addEventListener('change', calTotal);
    		
    		// 로그인 여부에 따라 나뉘는 메서드들
			checkLoginSettings(checkLogin, (checkLogin ? ${CouponList} : ''), '${myPoint }', '${Bookmark}');
    		
	       

	       // When the user clicks on <span> (x), close the modal
	       span.onclick = function () { closeAllModal(); };

	       // When the user clicks anywhere outside of the modal, close it
	       window.onclick = function (event) { if (event.target == modal) closeAllModal(); };
	       

			couponSettings(${bCouponVO }); // 매장의 쿠폰을 다운
    	}
    	function checkLoginSettings(checkLoginBoolean, CouponList, myPoint, Bookmark){
    		checkLogin = checkLoginBoolean;
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
	 	    		  const {data} = await axios.post('/drumtong/customer/laundry/customerDetail/rest/addCoupon/', ob);
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
	 	    		addBookmark('${estid}');
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
	    		
	    		document.getElementById('my-point').children[0].innerHTML = myPoint; // 현재 포인트
	    		
	    		// 사용할 수 있는 쿠폰을 체크하도록
	     		calTotal();
    		}
    		else{
    			 document.getElementById('loginSubmit').addEventListener('click', function(){ logiinSubmit('asynchronous'); });
    		}
    	} 
    	initPage(checkLogin);
    	
    </script>
<script>
		imgList = ${bImageVO};
		imgBoxs = document.getElementById('detailview-imgBlock');
		subImgNum = 1;
		for(imageNum = 0; imageNum < 6; imageNum++){
			if(imageNum < imgList.length){
				imgBoxs.children[1].children[imageNum].className = 'exist'; 
				if(imgList[imageNum].delegatephotoboolean === 'Y'){
					imgBoxs.children[0].children[0].src = 'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/' + imgList[imageNum].storeimg;
					imgBoxs.children[1].children[0].src = 'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/' + imgList[imageNum].storeimg;
					imgBoxs.children[1].children[0].className = 'select exist'; 
				} else{
					imgBoxs.children[1].children[subImgNum++].src = 'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/' + imgList[imageNum].storeimg;
				}
				document.querySelector('#imgBox' + (imageNum + 1)).addEventListener('click', () => {
					for(let i = 0; i < imgList.length; i++){
						console.log()
						if(event.target.id === imgBoxs.children[1].children[i].id){
							event.target.className = "select exist";
							imgBoxs.children[0].children[0].src = event.target.src;
						} else{
							imgBoxs.children[1].children[i].className = "exist";
// 							document.querySelector('#' + imgBoxs.children[1].children[i].id).style.border = 'none';
						}
					}
				});
			} else {
				imgBoxs.children[1].children[imageNum].src = '/drumtong/resources/business/img/slide/laundry1_02.jpg';
			}
		}
	</script>
<%@ include file="../main/customerFooter.jsp" %>