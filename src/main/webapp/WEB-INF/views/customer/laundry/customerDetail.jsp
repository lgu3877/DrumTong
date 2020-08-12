<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 <!-- 스크립트 영역 -->
    <script>
      function listUp(event) {
        choose = event.target;
	
        optionName = choose.children[0].children[0].innerText;
        optionText = choose.children[0].children[1].innerText;
        quantity = choose.children[1].value;
        price = choose.children[2].innerText;
        quick = choose.children[3];
		
        // 바꾼부분1 : 주문개수(quantity)가 0일 땐 주문목록에 들어가지 않도록 설정
        if(quantity !== '0'){
        	// 바꾼부분2 : checked 만 빼고 동일한 코드길래 if문 지우고 삼항연산자로 바꿨고, ` 대신 '로 사용, EL태그 지움
	        quickHTML = '<input type="checkbox" class="quick" id="quick" value="' + quick.value + '" ' + (quick.checked ? 'checked' : '' ) + ' onclick="calTotal()"/>';
	
	        newRow = document.createElement('div');
	        newRow.setAttribute('class', 'selected-row');
			
	        // 바꾼부분3 : ` 대신 ' 사용, EL태그 지움
	     	newRow.innerHTML = '<div class="selected-text"><div class="selected-name" id="selected-name">'
				+optionName+'</div><div class="selected-context">'+optionText
				+'</div></div><input type="number" class="quantity" id="selected-quantity" value="'+quantity+'" min="1" /><div class="option-price">'
				+price+'</div>' + quickHTML;
				
	        selectedList = document.getElementById('selected-List');
	        selectedList.appendChild(newRow);
	
	        //수량 바뀌는 이벤트 리스너를 이곳에서 삽입
	        selectedList.addEventListener('change', calTotal);
	
	        calTotal();
        }
        
      }
    </script>

    <script>
      function addQuantity(){
        calTotal();
      }
    </script>
    
    <script>
      function calTotal() {
        orders = document.querySelectorAll('.selected-row');
        console.log(orders);

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
		
        // 바꾼부분4 : ` 대신 ' 사용
        quickText.innerText = 'Quick 요금 : ' +quickPrice +' 원';
        totalText.innerText = 'Total : '+totalPrice+' 원';
      }
    </script>

    <script>
      function addBookmark() {
        icon = event.target;
        className = icon.className;
        console.log(event.target.className.search(/add/));

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
        	console.log(memberid);
        	ob={
        		'memberid' : memberid,
        		'estid' : '${estid}',
        		'result' : icon.style.color,
        	};
        	await axios.post('/drumtong/customer/laundry/customerDetail/rest/addBookmark/', ob)
        	.then ((response) => {
        		console.log('북마크 결과값 받아오기 성공', response.data);
        		if(response.data === true){
        			console.log("추가함");
        		} else {
        			console.log("삭제함");
        		}
        	})
        	
        }
        
        // 로그인 되어있을 때 북마크
        if('${Login}' != null && '${Login}' !='' ) { 
        	axPost('${Login.memberid}'); }
        
      }
    </script>

    <script>
      function submit() {
        console.log('submit작동');
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

        console.log(orderMap);

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
    <section>
      <div class="detailview-wrap">
        <div class="detailview-top">
          <div class="detailview-imgBlock">
            <div class="detailview-imgBlock-main">
              <img src="stampSample.png" />
            </div>
            <div class="detailview-imgBlock-subRow">
              <img src="stampSample.png" />
              <img src="stampSample.png" />
              <img src="stampSample.png" />
              <img src="stampSample.png" />
              <img src="stampSample.png" />
            </div>
          </div>
          <div class="detailview-companyIntro">
            <div class="detailview-intro-headline">
              <h1>${bInformationVO.brandnaming}</h1>
              <i class="fas fa-star ${Login != null ? (Color eq 'orange' ? 'remove' : 'add') : 'add' }" id="bookMarker" style="-webkit-text-stroke: 2px ${Login != null ? Color : 'skyblue'};color:${(Login != null && Color == 'orange') ? '' : 'yellow' }" onclick="addBookmark()"></i>
            </div>
            <textarea readonly>${bManagementVO.introduction }</textarea>
          </div>
        </div>

        <div class="detailview-bottom">
          <div class="detailview-options">
            <button class="add-coupon" id="add-coupon" value="1000">쿠폰 받기 ${bCouponVO }</button>

            <div class="detailview-selectOptions">
            <!-- 수정한 부분 ★★★★★★ -->
        	<c:forEach items="${bMenuVO }" var="menu">
              <div class="option-row" id="choose+${menu.num }" >
                <div class="option-text">
                  <div class="option-name" id="option-name">옵션 ${menu.num }</div>
                  <div class="option-context">${menu.name } / 예상시간 ${menu.ete }일</div>
                </div>
                <input type="number" class="quantity" id="quantity" placeholder="0" min="0" value="0" />
                <div class="option-price">${menu.price } 원</div>
                <input type="checkbox" class="quick" id="quick" value="1000" />+${menu.quickprice } 원
              </div>
			</c:forEach>

            </div>
          </div>

          <div class="detailview-select">
            <div class="select-list" id="selected-List"></div>

            <div class="select-coupon">
              내 쿠폰
              <select>
              	<c:if test="${Login != null }">
              			<option>선택하기</option>
              		<c:forEach items="${CouponList }" var="co">
	                	<option value="${co.minimumprice }" disabled="disabled">${co.discount }원 할인/${co.minimumprice }원 이상[${co.period }]</option>
              		</c:forEach>
              	</c:if>
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

       <div class="detailview-review">
          <div class="detailview-review-list">
            <div class="detailview-review-row">
              <div class="review-head">
                <div class="review-writer">작성자 : 김상재</div>
                <div class="review-date">작성일 : 2020-08-04</div>
              </div>
              <div class="review-context">this laundrry shop is sooooo awesome!!!</div>
            </div>

            <div class="detailview-review-row">
              <div class="review-head">
                <div class="review-writer">작성자 : 김상재</div>
                <div class="review-date">작성일 : 2020-08-04</div>
              </div>
              <div class="review-context">this laundrry shop is sooooo awesome!!!</div>
            </div>

            <div class="detailview-review-row">
              <div class="review-head">
                <div class="review-writer">작성자 : 김상재</div>
                <div class="review-date">작성일 : 2020-08-04</div>
              </div>
              <div class="review-context">this laundrry shop is sooooo awesome!!!</div>
            </div>

            <div class="detailview-review-row">
              <div class="review-head">
                <div class="review-writer">작성자 : 김상재</div>
                <div class="review-date">작성일 : 2020-08-04</div>
              </div>
              <div class="review-context">this laundrry shop is sooooo awesome!!!</div>
            </div>
          </div>
          <button id="review-more">Open Modal</button></p>
        </div>
      </div>
    </section>

<!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->

      <div class="modal-content1" id="modal-content1">
        <select class="modal-couponList">
          <option>쿠폰1 1000원</option>
          <option>쿠폰2 5000원</option>
        </select>
        <button class="modal-addCoupon">받기</button>
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
          <img src="#" class="login-logo" />
          <div class="login-alert">메세지</div>
          <div class="login-input">
            <input type="text" name="userid" placeholder="ID" id="userid" class="login-input-boxs" />
            <input type="password" name="userpw" placeholder="PW" id="userpw" class="login-input-boxs" />

            <div class="login-check">
              <label><input type="checkbox" id="storeid" class="login-storeid" />ID 기억하기</label>
              <a href="#" class="login-idFind">ID/PW 찾기</a>
            </div>

            <div class="login-buttons">
              <input type="button" value="login" id="loginSubmit" class="login-input-buttons" />
              <input type="button" value="Join" id="loginJoin" class="login-input-buttons" />
            </div>
          </div>
        </form>
      </div>

      <div class="modal-content4" id="modal-content4">
        <div class="modal-grade">
          <i class="fas fa-star"></i>
        </div>
        <div class="modal-reiview">
          <div class="detailview-review-row">
            <div class="review-head">
              <div class="review-profilePic"></div>
              <div class="review-writer">
                <p>김상재</p>
                <p>2020-08-04</p>
              </div>
            </div>
            <div class="review-context">this laundrry shop is sooooo awesome!!!</div>
          </div>
        </div>
      </div>
    </div>

    <!-- 스크립트 영역 -->
    <script>
 // Get the modal
    var modal = document.getElementById('myModal');

    var modalContent1 = document.getElementById('modal-content1');
    var modalContent2 = document.getElementById('modal-content2');
    var modalContent3 = document.getElementById('modal-content3');
    var modalContent4 = document.getElementById('modal-content4');

    // Get the button that opens the modal
    var btn1 = document.getElementById('add-coupon');
    var btn2 = document.getElementById('order-submit');
    var btn3 = document.getElementById('review-more');
    var btn4 = document.getElementById('modal-submit');

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName('close')[0];

    // When the user clicks on the button, open the modal
    btn1.onclick = function () {
      modal.style.display = 'block';
      modalContent1.style.display = 'flex';
    };

    btn2.onclick = function () {
      modal.style.display = 'block';
      modalContent2.style.display = 'flex';
    };

    btn3.onclick = function () {
      modal.style.display = 'block';
      modalContent4.style.display = 'flex';
    };
    
    btn4.onclick = function () {
      modal.style.display = 'block';

      //로그인이 안되있으면 이 문장을 수행
      modalContent3.style.display = 'flex';

      //로그인이 되어있다면 submit 기능 수행
      submit();
    };

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
      modal.style.display = 'none';
      modalContent1.style.display = 'none';
      modalContent2.style.display = 'none';
      modalContent3.style.display = 'none';
      modalContent4.style.display = 'none';
    };

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
      if (event.target == modal) {
        modal.style.display = 'none';
        modalContent1.style.display = 'none';
        modalContent2.style.display = 'none';
        modalContent3.style.display = 'none';
        modalContent4.style.display = 'none';
      }
    };
    
      // 수정한 부분(메뉴에 모두 클릭이벤트 적용)★★★★★★
      document.querySelectorAll('.option-row').forEach(function(element){
    	  console.log('test');
    	  element.addEventListener('click', listUp);
      }); 
      
    </script>

<%@ include file="../main/customerFooter.jsp" %>    