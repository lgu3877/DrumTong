<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>


<section class="section_pac">
        <h1 class="pac_mainName">결제 수단 및 쿠폰 마일리지 관리</h1>

        <div class="pac_list">
            <div class="pac_lists">
                <div class="pac_pay">
                    <button id="pac_pay_button">결제 수단</button>
                </div>

                <div class="pac_copon">
                    <button id="pac_coupon_button">쿠폰</button>
                </div>
            </div>
        </div>


        <article class="pac_mainList_pay">
            <div class="pac_mainPay">
                <div class="pac_payList" id="pac_payList">
                   	<p class="pac_payText">결제 수단 관리</p>
<!--                     <p class="pac_payText">카드</p> -->
                    <div class="pac_payLists">
                        <div class="pac_payCard_name">카드</div>
                        <div class="dropdown">
							<button class="dropdown-button">== 선택 ==</button>
							<div class="dropdown-content">
								<a href="#">신한</a>
								<a href="#">현대</a>
								<a href="#">하나</a>
								<a href="#">우리</a>
								<a href="#">국민</a>
								<a href="#">농협</a>
								<a href="#">롯데</a>
								<a href="#">기타</a>
							</div>
						</div>
                        <input class="pac_payCard_num" type="text" value="1234"></input>
                        -
                        <input class="pac_payCard_num" type="text" value="2345"></input>
                        -
                        <input class="pac_payCard_num" type="text" value="3456"></input>
                        -
                        <input class="pac_payCard_num" type="text" value="4567"></input>
                        <button class="pac_payCard_save">저장</button>
                        <div class="pac_payList_add"></div>
                    </div>
<!--                     <p class="pac_payText">계좌</p> -->
                    <div class="pac_payLists">
                        <div class="pac_payCard_name">계좌</div>
                        
                        <div class="dropdown">
							<button class="dropdown-button">== 선택 ==</button>
							<div class="dropdown-content">
								<a href="#">신한</a>
								<a href="#">현대</a>
								<a href="#">하나</a>
								<a href="#">우리</a>
								<a href="#">국민</a>
								<a href="#">농협</a>
								<a href="#">롯데</a>
								<a href="#">기타</a>
							</div>
						</div>
                        <input class="pac_payAccount_num" type="text" value="1234"></input>
                        <button class="pac_payCard_save">저장</button>
                        <div class="pac_payList_add"></div>
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
	                        <div class="pac_copon_brandnaming">${coupon.brandnaming }</div>
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
    <script>
        // 문서전체에서 li만 가져오려면? css 선택자를 활용할 수 있는 querySelectorAll 사용
        // 태그이름.클래스이름 or 태그이름#ID or 태그만 사용가능
        lis = document.querySelectorAll('.pac_lists');
        lis.forEach((li) => { // 집합의 각 원소에 대한 실행 함수
            li.addEventListener('click', (event) => { // 클릭했을때 이벤트 관련내용
                let arr1 = ['pac_mainList_pay', 'pac_mainList_copon'];
                let buttonArr = ['pac_pay_button', 'pac_coupon_button'];
                result = event.target.id === buttonArr[0];
                target = result ? arr1[0] : arr1[1];
                anotherButton = result ? 1 : 0;
                // 클릭했을때(이벤트) 클릭한 버튼의 아이디값이 타겟에 저장됨 

                for (i in arr1) {
                    tmp = document.getElementsByClassName(arr1[i])[0];
                    if (arr1[i] === target) { // 배열의 이름과 타겟에 비교 했을때 해당되면 디스플레이 보여줌
                        tmp.style.display = 'block';
                        document.getElementById(buttonArr[1-anotherButton]).style.backgroundColor = "#35aefd";
                        document.getElementById(buttonArr[1-anotherButton]).style.color = "white";
                        document.getElementById(buttonArr[anotherButton]).style.backgroundColor = 'white';
                        document.getElementById(buttonArr[anotherButton]).style.color = 'black';
                    } 
                    else {
                        tmp.style.display = 'none';
                    }
                        
                }
            });
        });
        
        document.querySelector('a').addEventListener('click', function() {
        	console.log(this);
        })	
        
        
    </script>
<%@ include file="../main/customerFooter.jsp"%>