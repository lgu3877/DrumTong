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
	
	<!-- javascript cpath -->
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		function getContextPath() {
		    return sessionStorage.getItem("contextpath");
		}
	</script>
	
 	<!-- 스크립트 영역 -->
    <script type="text/javascript" src="${cpath }/customer/js/membership/customerLogin.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail/customerDetail-submit.js"></script>
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
            <div class="detailview-address">주소 : ${bInformationVO.mainlocation } ${bInformationVO.detaillocation }</div>
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
            <div class="select-date" id="select-date">
				<a onclick="activeSelectDateArea()"><b>▶</b> 희망 날짜(선택사항)</a>
            </div>
            <div class="select-date-area" id="select-date-area">
            	<article><div>보내는 날짜</div><input type="date">이 영역에 버튼을 만들고 버튼 누르면 달력 모달창이 뜨고 날짜 선택시 이 영역에 선택한 날짜를 띄워줄 예정!input date는 display none으로!</article>
            	<article><div>받는 날짜</div><input type="date">이 영역에 버튼을 만들고 버튼 누르면 달력 모달창이 뜨고 날짜 선택시 이 영역에 선택한 날짜를 띄워줄 예정!input date는 display none으로!</article>
            </div>
            <div class="select-pickup" id="select-pickup"> 수거 방법 : 
            	<input type="radio" name="pickup-check" onclick="calTotal()" value="0"/> 직접 방문
            	<input type="radio" name="pickup-check" id="pickup-check" checked onclick="calTotal()" value="1000"/> 수거 요청(+ 1000 원)
            </div>
            <div class="select-deli" id="select-deli"> 받는 방법 : 
   		         <input type="radio" name="deli-check" onclick="calTotal()" value="0"/> 직접 방문
   		         <input type="radio" name="deli-check" id="deli-check" checked onclick="calTotal()" value="1000"/> 배달 요청(+ 1000 원)
            </div>
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
<!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->

      <div class="modal-content1" id="modal-content1">
        <select class="modal-couponList" id="modal-couponList"></select>
        <button class="modal-addCoupon" id="modal-addCoupon">받기</button>
      </div>

      <div class="modal-content2" id="modal-content2">
        <div class="modal-total">
        <div class="modal-payment-head">
        	약관
       	</div>
          <textarea readonly>
 약관을 읽고 동의해주세요
[Drumtong 결제 약관]
1. 포인트 결제
① 사전에 충전해둔 포인트를 이용해 결제할 수 있습니다.
② 결제한 포인트는 저희 Drumtong 가상계좌에 입금되며, 세탁이 종료되는 시점에 세탁소 측으로 입금됩니다. 
          </textarea>
          <input type="radio" id="agree" value="agree" class="submit-agree">동의합니다.활성화
        </div>
        <div class="modal-payment">
          <div class="modal-payment-head">
            결제
            <div class="close">&times;</div>
          </div>
          <div>수거 요청사항 : <input id="collectionRequests" type="text" placeholder="요청사항"></div>
          <div>세탁 요청사항 : <input id="laundryRequests" type="text" placeholder="요청사항"></div>
          <div>배달 요청사항 : <input id="deliveryRequests" type="text" placeholder="요청사항"></div>
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
            <div class="orderListMsg"><span class="orderList-hide"></span></div>            
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
<!--     희망 날짜 선택 관련 스크립트 -->
	<script>
		function activeSelectDateArea(event){
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
	</script>
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
   	<script type="text/javascript" src="${cpath }/customer/js/main/customerRecentSearchData.js"></script>
    <script>
//     	총 정리
		var estid = '${estid}';
		cLogin = '${cLogin}';
		let memberID = '${cLogin.memberid}';
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
       var modalContent5 = document.getElementById('modal-content5');   // 리뷰 이미지 클릭 화면
	   var modalContent5_exit = document.getElementById('modal-content5-exit');
       
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
			
			// 매장 이미지 세팅하는 메서드
			imgSettings(${bImageVO})
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
    	function isEquals(optionName, optionText, quantity, quickCheck){
    		let selectList = document.querySelectorAll('.selected-row');
    		console.log(selectList);
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
    </script>
<%@ include file="../main/customerFooter.jsp" %>