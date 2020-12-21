<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<section class="section_pac">
        <h1 class="pac_mainName">결제 수단 및 쿠폰 마일리지 관리</h1>

        <div class="pac_list">
            <div class="pac_lists">
<!--             pac_pay, pac_copon => 수정함 pac_list -->
            	<div class="pac_list">
                    <button class="pac_button" id="pac_point_button">포인트</button>
                </div>
                
                <div class="pac_list">
                    <button class="pac_button" id="pac_pay_button">결제 수단</button>
                </div>

                <div class="pac_list">
                    <button class="pac_button" id="pac_coupon_button">쿠폰</button>
                </div>
            </div>
        </div>


        <article class="pac_mainList_point">
        	<div class="pac_mainPoint">
        		<div class="pac_pointList">
        			<p class="pac_pointText">포인트</p>
        			<div>
        				<div>현재 포인트 : ${myPoint }</div>
        				<div>포인트 충전 ) 1000단위로 충전이 가능합니다.</div>
        				<input id="point" type="number" min="0" placeholder="금액 입력">
	        			<select id="paymenttype">
	        				<option value="CARD">카드결제</option>
	        				<option value="CASH">계좌이체</option>
	        			</select>
	        			<button onclick="addPoint()">충전하기</button>
        			</div>
        			<div>
        				<div>충전 내역(최근 6개월)</div>
        				<div style="display: inline-flex;">
        					<div>날짜</div>
        					<div>금액</div>
        					<div>결제방식</div>
        				</div>
        				<c:forEach items="${pointlist }" var="po">
        				<br>
        					<div style="display: inline-flex;">
	        					<div>${po.registdate }</div>
	        					<div>${po.point }</div>
	        					<div>${po.paymenttype }</div>
        					</div>
        				</c:forEach>
        			</div>
        		</div>
        	</div>
        </article>
        
        <article class="pac_mainList_pay">
            <div class="pac_mainPay">
                <div class="pac_payList">
                      <p class="pac_payText">결제 수단 관리</p>
<!--                     <p class="pac_payText">카드</p> -->
                    <div class="pac_payLists">
                        <div class="pac_payCard_name">카드</div>
                        <div class="dropdown">
                     <button id="cardBank" class="dropdown-button">${cardBank }</button>
                     <div class="dropdown-content">
                        <a onclick="dropSelect(this)">신한</a>
                        <a onclick="dropSelect(this)">현대</a>
                        <a onclick="dropSelect(this)">하나</a>
                        <a onclick="dropSelect(this)">우리</a>
                        <a onclick="dropSelect(this)">국민</a>
                        <a onclick="dropSelect(this)">농협</a>
                        <a onclick="dropSelect(this)">롯데</a>
                        <a onclick="dropSelect(this)">기타</a>
                     </div>
                  </div>
                        <input id="cardNum1" onkeyup="onlyNum(this)" maxlength="4" class="pac_payCard_num" type="text" value="${cardNum[0]}"></input>
                        -
                        <input id="cardNum2" onkeyup="onlyNum(this)" maxlength="4" class="pac_payCard_num" type="text" value="${cardNum[1]}"></input>
                        -
                        <input id="cardNum3" onkeyup="onlyNum(this)" maxlength="4" class="pac_payCard_num" type="text" value="${cardNum[2]}"></input>
                        -
                        <input id="cardNum4" onkeyup="onlyNum(this)" maxlength="4" class="pac_payCard_num" type="text" value="${cardNum[3]}"></input>
                        <button class="pac_payCard_save" onclick="savePay('card')">저장</button>
                    </div>
<!--                     <p class="pac_payText">계좌</p> -->
                    <div class="pac_payLists">
                        <div class="pac_payCard_name">계좌</div>
                        
                        <div class="dropdown">
                     <button id="accountBank" class="dropdown-button" style="text-decoration: none">${accountBank }</button>
                     <div class="dropdown-content">
                        <a onclick="dropSelect(this)">신한</a>
                        <a onclick="dropSelect(this)">현대</a>
                        <a onclick="dropSelect(this)">하나</a>
                        <a onclick="dropSelect(this)">우리</a>
                        <a onclick="dropSelect(this)">국민</a>
                        <a onclick="dropSelect(this)">농협</a>
                        <a onclick="dropSelect(this)">롯데</a>
                        <a onclick="dropSelect(this)">기타</a>
                     </div>
                  </div>
                        <input id="accountNum" onkeyup="onlyNum(this)" maxlength="20" class="pac_payAccount_num" type="text" value="${accountNum}"></input>
                        <button class="pac_payCard_save" onclick="savePay('account')">저장</button>
                    </div>
                </div>
            </div>
        </article>

        <article class="pac_mainList_copon">
            <div class="pac_mainCopon">
                <div class="pac_coponList">
                    <p class="pac_coponText">쿠폰 목록</p>
                    <div class="pac_coponLists pac_coponLists_menu">
                        <div class="pac_copon_brandnaming">가게이름</div>
                        <div class="pac_copon_discount">할인가격</div>
                        <div class="pac_copon_period">사용기간</div>
                        <div class="pac_copon_minimumprice">최소금액</div>
                    </div>
                    <c:forEach items="${couponlist }" var="coupon">
                       <div class="pac_coponLists">
                           <div class="pac_copon_brandnaming pac_copon_brandnaming_link" onclick="location.href='${cpath }/customer/laundry/customerDetail/${coupon.estid }/'">${coupon.brandnaming }</div>
                           <div class="pac_copon_discount">${coupon.discount }</div>
                           <div class="pac_copon_period">${coupon.period }</div>
                           <div class="pac_copon_minimumprice">${coupon.minimumprice }</div>
                       </div>
                    </c:forEach>
                </div>
            </div>
        </article>

    </section>

    <div id="footers"></div>
    <!-- 영경 -->
    <script>
	   	function addPoint(){
	   		var pointNum = document.getElementById('point').value;
	   		var paymenttypeName = document.getElementById('paymenttype').value;
	   		
	   		if(pointNum < 1000){
	   			alert('1000원 이상부터 충전이 가능합니다.');
	   			return false;
	   		} else if(pointNum % 1000 !== 0){
	   			var trashPoint = pointNum % 1000;
	   			document.getElementById('point').value = pointNum - trashPoint;
	   			alert('천단위로 충전 가능합니다. \n[' + pointNum + '→' + (pointNum - trashPoint) + 
	   				']\n변경된 금액으로 충전을 원하시면 다시 한번 충전 버튼을 눌러주세요.' );
	   			return false;
	   		}
	   		
	   		ob={
	   			point : pointNum,
	   			paymenttype : paymenttypeName,
	   		}
	   		var axPost = async (ob) => {
	               await axios.post('/drumtong/customer/account/customerPayAndCoupon/rest/pointSave/', ob)
	               // 배포용
//	                await axios.post('/customer/account/customerPayAndCoupon/rest/pointSave/', ob)

	               .then( (response) => {
	                 if(response.data === true){
	                    alert('충전이 완료되었습니다.');
	                    location.href='/drumtong/customer/account/customerPayAndCoupon/';
	                 } else{
	                     alert('충전이 정상적으로 이루어지지 않았습니다.');
	                 }
	               });
	             }
	             axPost(ob);
	   	}
       function savePay(type){
          switch(type){
          case 'account':
             ob={
                type : type,
                accountBank : document.querySelector('#accountBank').innerHTML,
                accountNum : document.getElementById('accountNum').value,
             };
             if(ob['accountNum'].length < 10){
            	 alert('계좌번호가 너무 짧습니다.');
            	 return false;
             }
             break;
          case 'card':
             ob={
                type : type,
                cardBank : document.querySelector('#cardBank').innerHTML,
                cardNum1 : document.getElementById('cardNum1').value,
                cardNum2 : document.getElementById('cardNum2').value,
                cardNum3 : document.getElementById('cardNum3').value,
                cardNum4 : document.getElementById('cardNum4').value,
               };
             for(i = 1; i <=4; i++){
            	 if(ob['cardNum' + i].length != 4){
            		 alert(i + '번째 카드 번호가 4자리가 아닙니다.');
            		 return false;
            	 }
             }
             break;
          }
          var axPost = async (ob) => {
               await axios.post('/drumtong/customer/account/customerPayAndCoupon/rest/paySave/', ob)
               // 배포용
//                await axios.post('/customer/account/customerPayAndCoupon/rest/paySave/', ob)

               .then( (response) => {
                 if(response.data === true){
                    alert('변경되었습니다.');
                 } else{
                     alert('변경에 실패하였습니다');
                 }
               });
             }
             axPost(ob);
          
          
       }
       function onlyNum(obj){
    	   var regexp = /^[0-9]*$/;
// //     	   var regexp = /^[0-9]ㅎgi;
    	   if(!regexp.test(obj.value)){
    		   alert("숫자만 입력할 수 있습니다!");
    		   obj.value = obj.value.replaceAll(/[^0-9]/g, '');
// //     		   obj.value = obj.value.substr(0,obj.value.length-1);
    	   }
       }
    </script>
    
    <script>
    	// 영경 수정함
        // 문서전체에서 li만 가져오려면? css 선택자를 활용할 수 있는 querySelectorAll 사용
        // 태그이름.클래스이름 or 태그이름#ID or 태그만 사용가능
//         lis = document.querySelectorAll('.pac_list');
        lis = document.querySelectorAll('.pac_button');
        lis.forEach((li) => { // 집합의 각 원소에 대한 실행 함수
            li.addEventListener('click', (event) => { // 클릭했을때 이벤트 관련내용
                let arr1 = ['pac_mainList_point', 'pac_mainList_pay', 'pac_mainList_copon'];
                let buttonArr = ['pac_point_button', 'pac_pay_button', 'pac_coupon_button'];
                
                for (i in arr1){
                    tmp = document.getElementsByClassName(arr1[i])[0];
                	if(event.target.id === buttonArr[i]){
                        tmp.style.display = 'block';
                        document.getElementById(buttonArr[i]).style.backgroundColor = "#35aefd";
                     	document.getElementById(buttonArr[i]).style.color = "white";
                	} else {
                		tmp.style.display='none';
                		document.getElementById(buttonArr[i]).style.backgroundColor = 'white';
                     	document.getElementById(buttonArr[i]).style.color = 'black';
                	}
                }
            });
        });
        
        // 승원
       function dropSelect(obj) {
          obj.parentNode.parentNode.querySelector('button').innerHTML = obj.innerHTML;
       }
       
        
    </script>
<%@ include file="../main/customerFooter.jsp"%>