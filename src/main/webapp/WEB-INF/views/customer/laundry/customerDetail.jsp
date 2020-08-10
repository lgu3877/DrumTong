<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

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

        if (className.search(/remove/) > 0) {
          icon.style['-webkit-text-stroke'] = '2px skyblue';
          icon.style.color = '';
          icon.className = 'fas fa-star add';
        }
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
              <i class="fas fa-star add" id="bookMarker" onclick="addBookmark()"></i>
            </div>
            <textarea readonly>${bManagementVO.introduction }</textarea>
          </div>
        </div>

        <div class="detailview-bottom">
          <div class="detailview-options">
            <button class="add-coupon" value="1000">쿠폰 받기</button>

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
                <option>쿠폰 1</option>
                <option>쿠폰 2</option>
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
          <p>리뷰 : 전체 리뷰 수(2) <button id="myBtn">Open Modal</button></p>
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
      </div>
    </section>

    <!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>
        <p>Some text in the Modal..</p>
      </div>
    </div>

    <!-- 스크립트 영역 -->
    <script>
      document.getElementById('order-submit').addEventListener('click', submit);

      // Get the modal
      var modal = document.getElementById('myModal');

      // Get the button that opens the modal
      var btn = document.getElementById('myBtn');

      // Get the <span> element that closes the modal
      var span = document.getElementsByClassName('close')[0];

      // When the user clicks on the button, open the modal
      btn.onclick = function () {
        modal.style.display = 'block';
      };

      // When the user clicks on <span> (x), close the modal
      span.onclick = function () {
        modal.style.display = 'none';
      };

      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function (event) {
        if (event.target == modal) {
          modal.style.display = 'none';
        }
      };
      
      // 수정한 부분(메뉴에 모두 클릭이벤트 적용)★★★★★★
      document.querySelectorAll('.option-row').forEach(function(element){
    	  console.log('test');
    	  element.addEventListener('click', listUp);
      }) 
      
    </script>

<%@ include file="../main/customerFooter.jsp" %>    