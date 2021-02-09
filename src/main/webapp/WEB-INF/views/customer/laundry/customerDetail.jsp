<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
	div.detailview-mainCate, div.detailview-subCate{
		width:570px;
	}
	div.mainButton, div.mainButton_select{
		display: inline-flex;
 		width: 140px;
		border-radius: 10px;
		font-size: 20pt;
		margin: 1px;
		cursor: pointer;
	}
	div.mainButton{
		border: 2px solid #35AEFD;
	}
	div.mainButton_select{
		border: 5px solid #35AEFD;
		
	}
	div.mainButton:hover{
		background-color: #35AEFD;
		color:white;
		font-weight: bold;
	}
	div.subButton, div.subButton_select{
		display: inline-flex;
 		width: 140px;
		border-radius: 10px;
		font-size: 20pt;
		margin: 1px;
		cursor: pointer;
	}
	div.subButton{
		border: 2px solid skyblue;
	}
	div.subButton_select{
		border: 5px solid skyblue;
		
	}
	div.subButton:hover{
		background-color: skyblue;
		color:white;
		font-weight: bold;
	}
</style>
 <!-- 스크립트 영역 -->
    <script type="text/javascript" src="${cpath }/customer/js/membership/customerLogin.js"></script>s
    <script>
      function listUp(event) {
        choose = event.target;
   
        optionName = choose.children[0].children[0].innerText;
        optionText = choose.children[0].children[1].innerText;
        quantity = choose.children[1].value;
        price = choose.children[2].innerText;
        quick = choose.children[3];
      
        if(quantity !== '0'){
        
           quickHTML = '<input type="checkbox" id="' + quick.getAttribute("id") + '" class="quickcheck" value="' + quick.value + '" ' + (quick.checked ? 'checked' : '' ) + ' onclick="calTotal()"/>'
           + '<label class="quick" id="checkLabel" for="quick" title="빠른 서비스"><i class="fas fa-shipping-fast"></i>+' + quick.value + '원</label>';
   
           newRow = document.createElement('div');
           newRow.setAttribute('class', 'selected-row');
         
           newRow.innerHTML = '<div class="selected-text"><div class="selected-name" id="selected-name">'
            +optionName+'</div><div class="selected-context">'+optionText
            +'</div></div><input type="number" class="quantity" id="selected-quantity" value="'+quantity+'" min="1" /><div class="selected-price">'
            +price+'</div>' + quickHTML + '<div><button class="remove-button" onclick="removeOption()"><i class="fas fa-times"></i></button></div>';
            
           selectedList = document.getElementById('selected-List');
           selectedList.appendChild(newRow);
   
           //수량 바뀌는 이벤트 리스너를 이곳에서 삽입
           selectedList.addEventListener('change', calTotal);
   
           calTotal();
        }
        
      }
    </script>
    
    <script>
      function calTotal() {
        orders = document.querySelectorAll('.selected-row');
        quickText = document.getElementById('select-quick');
        totalText = document.getElementById('select-total');

        deliCheck = document.getElementById('deli-check');

        deli = 2000;

        if (!deliCheck.checked) {
          deli = 0;
        }

        quickPrice = 0;
        totalPrice = 0 + deli;

        for (i = 0; i < orders.length; i++) {
          quantity = orders[i].children[1].value;
          price = orders[i].children[2].innerText.split(' ');
          quick = 0;

          if (orders[i].children[3].checked) {
            quick = orders[i].children[3].value;
          }

          quickCal = parseInt(quantity) * parseInt(quick);

          quickPrice += quickCal;

          totalPrice += parseInt(quantity) * parseInt(price[0]) + quickCal;
        }
      
        quickText.innerText = 'Quick 요금 : ' +quickPrice +' 원';
        totalText.innerText = 'Total : '+totalPrice+' 원';
      }
    </script>
    
    <script>
      function removeOption(){
        optionRow = event.target.parentNode.parentNode;

        optionRow.parentNode.removeChild(optionRow);

        calTotal();
      }
    </script>

    <script>
      function quickMark(){
    	  event.stopPropagation()
        check = event.target;
        row = check.parentNode;

        if(check.checked){
          row.style.backgroundRepeat = "no-repeat";
          row.style.backgroundPosition = "right";
          row.style.backgroundImage = "url('${cpath }/resources/customer/img/QUICK.png')";
        }
        else{
          row.style.backgroundImage = "none";
        }
      }
    </script>

    <script>
      function addBookmark() {
       if('${cLogin}' == ''){
          LoginModalOpen();
          return;
       }  
         
        icon = event.target;
        className = icon.className;
      
        if (className.search(/add/) > 0) {
          icon.style['-webkit-text-stroke'] = '2px orange';
          icon.style.color = 'yellow';
          icon.className = 'fas fa-star remove';
        }
        else if (className.search(/remove/) > 0) {
          icon.style['-webkit-text-stroke'] = '2px skyblue';
          icon.style.color = '';
          icon.className = 'fas fa-star add';
        }
        
        const axPost = async (memberid) =>{
           ob={
              'memberid' : memberid,
              'estid' : '${estid}',
              'result' : icon.style.color,
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
        
        if('${cLogin}' != null && '${cLogin}' !='' ) { 
           axPost('${cLogin.memberid}'); }
        
      }
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
              <img src="" />
              <img src="" />
              <img src="" />
              <img src="" />
              <img src="" />
            </div>
          </div>
          <div class="detailview-companyIntro">
            <div class="detailview-intro-headline">
              <h1>${bInformationVO.brandnaming}</h1>
              <c:set var="checkBookmark" value="${empty cLogin || Bookmark eq 'n' }" />
              <i class="fas fa-star ${checkBookmark ? 'add': 'remove' }" id="bookMarker" style="-webkit-text-stroke: 2px ${checkBookmark ? 'skyblue': 'orange' };color:${checkBookmark ? '': 'yellow' }" onclick="addBookmark()"></i>
            </div>
            <textarea readonly>${bManagementVO.introduction }</textarea>
          </div>
        </div>

        <div class="detailview-bottom">
          <div class="detailview-options">
            <button class="add-coupon" id="add-coupon" value="1000">쿠폰 받기</button>

           	<div class="detailview-mainCate" id="mainCate">
           	</div>
           	<div class="detailview-subCate" id="subCate">
           	</div>
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
              <select>
                       <option>선택하기</option>
                 <c:choose>
                    <c:when test="${cLogin != null }">
                       <c:forEach items="${CouponList }" var="co">
                         <option value="${co.minimumprice }" disabled="disabled">${co.discount }원 할인/${co.minimumprice }원 이상[${co.period }]</option>
                       </c:forEach>
                    </c:when>
                    <c:otherwise>
                       <option disabled>로그인 후 이용가능</option>
                    </c:otherwise>
                 </c:choose>
              </select>
            </div>
            <div class="select-deli" id="select-deli"><input type="checkbox" id="deli-check" checked onclick="calTotal()" /> 배달 (+ 2000 원)</div>
            <div class="select-quick" id="select-quick">
              Quick 요금 : 0 원
            </div>
            <div class="select-total" id="select-total">
              Total : 2000 원
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
        <select class="modal-couponList" id="modal-couponList">
        <c:forEach items="${bCouponVO }" var="bco">
          <option value="${bco.couponid }">${bco.discount }원 할인/${bco.minimumprice }원 이상[${bco.period }]</option>
        </c:forEach>
        </select>
        <button class="modal-addCoupon" id="modal-addCoupon">받기</button>
      </div>

      <div class="modal-content2" id="modal-content2">
        <div class="modal-total">
          total
        </div>
        <div class="modal-payment">
          <div class="modal-payment-head">
            나의 카드
            <div class="close">&times;</div>
          </div>
          <textarea readonly>
           약관을 읽고 동의해주세요 
          </textarea>
          <select class="modal-myCardList">
            <option>국민 0030 3304 0240 0030</option>
            <option>기업 0030 3304 0240 0030</option>
          </select>
          <div class="modal-check">
            <label><input type="checkbox" />현금영수증 신청하기</label>
          </div>
          <div class="modal-check">
            <label><input type="checkbox" />현금영수증 신청하기</label>
          </div>
          <div class="modal-price">total 10000원</div>
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
              <div class="review-profilePic"></div>
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
            <div class="modal-grade"><span></span></div>
            <div class="review-context"></div>
          </div>
        </div>
      </div>
    </div>

    <!-- 스크립트 영역 -->
    <script type="text/javascript">
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

       // Get the <span> element that closes the modal
       var span = document.getElementsByClassName('close')[0];

       function LoginModalOpen(){
          modal.style.display = 'block';
          modalContent3.style.display = 'flex';
       }
       
       // When the user clicks on the button, open the modal
       btn1.onclick = function () {
            if('${cLogin}' == ''){
               LoginModalOpen();
               return;
            }  
         modal.style.display = 'block';
         modalContent1.style.display = 'flex';
         document.getElementsByClassName('select-coupon').reload;
       };

       btn2.onclick = function () {
         modal.style.display = 'block';
          
        //로그인이 안되있으면 이 문장을 수행
        if('${cLogin}' == ''){
           modalContent3.style.display = 'flex';
        } else{
           //로그인이 되어있다면 submit 기능 수행
            modalContent2.style.display = 'flex';
        }
       };

       btn3.onclick = function () {
         modal.style.display = 'block';
//          modalContent4.style.display = 'flex';
         modalContent4.style.display = '';
         reviewMore();
       };
       
       btn4.onclick = function () {
         modal.style.display = 'block';

         submit();

       };
       

       btn5.onclick = function(){
          selectedCouponID = document.getElementById('modal-couponList').value;
           const axPost = async (memberid) =>{
              ob={
                 'memberid' : memberid,
                 'couponid' : selectedCouponID,
              };
              await axios.post('/drumtong/customer/laundry/customerDetail/rest/addCoupon/', ob)
              .then ((response) => {
                 if(response.data === true){
                    console.log("쿠폰 발급 성공");
                 } else {
                    console.log("쿠폰 발급 실패");
                 }
                 modal.style.display = 'none';
                 modalContent1.style.display = 'none';
              })
              
           };
           if('${cLogin}' != ''   ){
              axPost('${cLogin.memberid}');
           } else{
              console.log("로그인 안되어 있어서 다운못해요~");
           }
          
       }

       // When the user clicks on <span> (x), close the modal
       span.onclick = function () {

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
         
       };

       // When the user clicks anywhere outside of the modal, close it
       window.onclick = function (event) {
         if (event.target == modal) {
           
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
       };
       
         // 수정한 부분(메뉴에 모두 클릭이벤트 적용)★★★★★★
         document.querySelectorAll('.option-row').forEach(function(element){
            element.addEventListener('click', listUp);
         });
         
         document.querySelectorAll('.quickcheck').forEach(function(element){
             element.addEventListener('change', quickMark);
          });

           document.querySelectorAll('.remove-button').forEach(function(element){
             if (element.target !== element.currentTarget) return; 
              element.addEventListener('click', removeOption);
           })
         
         
         document.getElementById('loginSubmit').addEventListener('click', function(){ logiinSubmit('asynchronous');});

      
    </script>
    
    <script type="text/javascript">	// 승원 작업 - 구글 차트
    
	var reviewList = ${ReviewList};
	console.log(reviewList);
    
	window.onload = function() {
    	// 구글 부분 스크립트
    	// 이번엔 gson 받아올 때 단순하게  가아니라 .js 에서도 사용될 수 있도록 받아오자
    	google.charts.load("current", {packages:['corechart']});
   	 	google.charts.setOnLoadCallback(drawChart);
	   	calcscore();
	}
	
    function drawChart() {	// 구글 차트 그려주기

	var data = google.visualization.arrayToDataTable([
        ["score", "number", "total",  { role: 'annotation' }],
        [" ", 0, reviewList.length, ''],
        ["1.0", 0, reviewList.length, ''],
        [" ", 0, reviewList.length, ''],
        ["2.0", 0, reviewList.length, ''],
        [" ", 0, reviewList.length, ''],
        ["3.0", 0, reviewList.length, ''],
        [" ", 0, reviewList.length, ''],
        ["4.0", 0, reviewList.length, ''],
        [" ", 0, reviewList.length, ''],
        ["5.0", 0,  reviewList.length, ''],
      ]);
      
      
      for(i = 0; i < reviewList.length; i++) {		// 구글 차트 그래프에 점수 넣는 기능
		data.setCell((reviewList[i].gpa * 2) - 1, 1, data.getValue((reviewList[i].gpa * 2) - 1, 1) + 1);
		data.setCell((reviewList[i].gpa * 2) - 1, 2, data.getValue((reviewList[i].gpa * 2) - 1, 2) - 1);
      }
      

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
		width:'100%',
  		height: 400,
  		chartArea:{	
  			
  			top: '5%',
  			width:'90%',
  			height: '85%',
  		},
        bar: {groupWidth: "50%",         },	// bar 하나하나의 굵기
        legend: { position: "none" },
        isStacked: true,
        seriesType: 'bars',
        series: {
        	0: {color: 'navy' },
        	1: {color: '#e5e4e2' },
        },
        vAxis: {
            gridlines: {
                color: 'transparent'
            }
	     },
        enableInteractivity: false,		// hover와 관련된 모든 기능 중지
//         tooltip : { trigger: 'none'}	// hover 했을 때 해당열의 정보 띄우는 기능만 중지
      };
// 	  console.log('최고값 : ', data.getColumnRange(1).max);
	  var chart = new google.visualization.ComboChart(document.getElementById("columnchart_values"));
      chart.draw(data, options);
  } 
    
    function calcscore() {
    	let avgcscore = 0;
    	for(i = 0; i < reviewList.length; i++) {
    		avgcscore += reviewList[i].gpa;
    	}
    	let cscore = avgcscore / reviewList.length;
    	
    	$('#cscore').html('고객 평점 : ' + cscore.toFixed(2));
    	$('#frontstars').css('width', (cscore.toFixed(2) * 20) + '%');
    }

    </script>
    
    <script type="text/javascript">	// 승원 작업 - 모달
	
	function reviewMore() {	// 리뷰 더보기를 클릭했을 때
		for(i = 0; i < reviewList.length; i++) {
			if(i == 0) {
				$('.detailview-review-row').attr('id', 'review' + i);
				$('.detailview-review-row').find('.customerName').html(reviewList[i].customerName);
				$('.detailview-review-row').find('.review-context').html(reviewList[i].ccontent);
			}
			else {
				const beforerow = $('#review' + (i - 1));
				beforerow.after('<div class="detailview-review-row">' + beforerow.html() + '</div>');
				beforerow.next().attr('id', 'review' + i);
				beforerow.next().find('.customerName').html(reviewList[i].customerName);
				beforerow.next().find('.review-context').html(reviewList[i].ccontent);
			}
			
			$('#review' + i).find('.modal-grade').html('');	// 평점 안의 내용 초기화
			
			// 별자리를 만들어주는 반복문
			for(j = 0; j < reviewList[i].gpa; j++) {
				switch ((reviewList[i].gpa - j).toFixed(1)) {
				case '0.5':
					const halfstar = document.createElement('i');
					halfstar.className = 'fas fa-star-half-alt fa-2x';
	 				$('#review' + i).find('.modal-grade').append(halfstar);
					break;
				default:
					const star = document.createElement('i');
					star.className = 'fas fa-star fa-2x';
	 				$('#review' + i).find('.modal-grade').append(star);
	 				break;
				}
			}
			
			// 빈별자리를 만들어주는 반복문 -> 0.5 이면 4개의 별은 빈별이어야 한다
			for(k = 5 - (reviewList[i].gpa).toFixed(0); k > 0; k--) {	// 반올림
					const nullstar = document.createElement('i');
					nullstar.className = 'far fa-star fa-2x';
					$('#review' + i).find('.modal-grade').append(nullstar);
			}
			
			// 별자리 옆에 평점 표시			
			const gpaspan = document.createElement('span');
			gpaspan.innerHTML = reviewList[i].gpa;
 	 		$('#review' + i).find('.modal-grade').append(gpaspan);
	 		
 	 		$('#review' + i).find('.mgood').html('좋아요 ' + reviewList[i].mgood + ' ·&nbsp');
 	 		$('#review' + i).find('.gpa').html('&nbsp평점 ' + reviewList[i].gpa);
 	 		
	 		if(reviewList[i].bcontent != '-') {
	 			console.log('사장님 댓글이 달려있습니다.');
	 		}
		}
	}
	
    document.getElementById('review-more').addEventListener('mouseover', function() {
    	this.parentNode.style.background = 'white';
    	this.parentNode.style.border = '3px solid #1564F9';
    	this.style.background = '#1564F9';
    	this.querySelector('p').style.color = 'white';
    });

    document.getElementById('review-more').addEventListener('mouseout', function() {
    	this.parentNode.style.background = '#1564F9';
    	this.style.background = 'white';
    	this.querySelector('p').style.color = '#1564F9';
    });
    
    </script>
<!-- 	영경 스크립트 -->
	<script>
// 		imgList = ${bImageVO};
// 		i = 0;
// 		imgBoxs = document.querySelectorAll('detailview-imgBlock');
		
// 		imgList.forEach(img =>{
// 			imgBoxs[i++].src = 'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/' + img.storeimg;
// 		})
		
		menuList = ${menuList};
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
// 		createMenu(selectMenu);
		
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
				menuDiv_1 = document.createElement('div');
				menuDiv_1.setAttribute("class", "option-row");
				
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
				menuInput_3.setAttribute("min", "0");
				menuInput_3.setAttribute("value", "1");
				
				// 3
				menudiv_4 = document.createElement('div');
				menudiv_4.setAttribute("class", "option-price");
				menudiv_4.innerHTML = li.price + "원";
				
				//4
				menuLabel_5 = document.createElement('label');
				menuLabel_5.setAttribute("class", "quick");
				menuLabel_5.setAttribute("title", "빠른서비스");
				
				menuInput_5_1 = document.createElement('input');
				menuInput_5_1.setAttribute("class", "quickcheck");
				menuInput_5_1.setAttribute("type", "checkbox");
				menuInput_5_1.setAttribute("value", li.quickprice);
				
				menuI_5_2 = document.createElement('i');
				menuI_5_2.setAttribute("class", "fas fa-shipping-fast");
				menuI_5_2.innerHTML = li.quickprice + "원";
				
				menuLabel_5.appendChild(menuInput_5_1);
				menuLabel_5.appendChild(menuI_5_2);
				
				
				menuDiv_1.appendChild(menuDiv_2);
				menuDiv_1.appendChild(menuInput_3);
				menuDiv_1.appendChild(menudiv_4);
				menuDiv_1.appendChild(menuLabel_5);
				
				menuCategory.appendChild(menuDiv_1);
			})
		}
	</script>
<%@ include file="../main/customerFooter.jsp" %>    