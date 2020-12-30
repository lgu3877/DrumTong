<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 스크립트 영역 -->
<script></script>

<!-- 본문 영역 -->
<section class="section-SangJae section-orderlist">
  <div class="orderlist-wrap">
  
<%--     <c:if test="${not empty orderList}"> --%>
<%-- 	  <c:forEach items="${orderList }" var="orderList"> --%>
    <div class="orderlist-card">
      <div class="orderData1">
        <div class="orderData-company">
<!--           <div class="orderData-circle"></div> -->
<%--          	 ${orderList.brandnaming } --%>
        </div>
        <div class="orderData-date"> 
<!--         	<b>주문코드</b>  -->
<%--         	${orderList.salecode } --%>
        </div>
      </div>
      <div class="orderData2">
        <div class="orderData-onGoing">
          <img src="stampSample.png" />
        </div>
        <div class="orderData-options">
          <div class="orderData-options-head">주문옵션</div> <div></div> 
          
<%-- 		            	<li> ${bl.name }  --%>
<%-- 			            	개당 가격 : <fmt:formatNumber value="${bl.menuprice }" pattern="#,###" />원 --%>
<%-- 			            	총 개수 : ${bl.amount } --%>
<%-- 			            	합산 : <fmt:formatNumber value="${bl.sumprice }" pattern="#,###" />원  --%>
<!-- 			            </li> -->
            
            
          
          <div class="orderData-options-head-originalprice">오리지널 금액</div>
          <ul>
<%--             <li><fmt:formatNumber value="${orderList.originalprice }" pattern="#,###" />원</li> --%>
          </ul>
          
          
          
          
          
          
          
		          <div class="orderData-options-head-coupon">쿠폰</div>
		          <ul>
<%-- 		            <li>-<fmt:formatNumber value="${orderList.discountprice }" pattern="#,###" />원</li> --%>
		          </ul>
		          
		          <div class="orderData-options-head-requests">요청사항</div>
		          <ul>
<%-- 		            <li>${orderList.requests }</li> --%>
		          </ul>
		          
		        </div>
		      </div>
		      <div class="orderData-total">
		      	<div class="orderData-total-purchasedate">
<%-- 		      		  <b>주문일자</b>  ${orderList.purchasedate }  --%>
		      	</div>
		      	<div class="orderData-total-totalamount">
<%-- 		      		총 요청 개수 : ${orderList.totalamount } --%>
		      	</div>
		      	<div class="orderData-total-totalprice">
<%-- 		      		Total <fmt:formatNumber value="${orderList.totalprice }" pattern="#,###" />원 --%>
		      	</div>
		      </div>
		      
		      
		    </div>








<%--     </c:forEach> --%>
<%--     </c:if> --%>
    
  </div>
</section>

<!-- 스크립트 영역 [건욱 작업] -->
<script type="text/javascript">
	
	// 주문 시에값이 없을 수도 있는 값
	// [쿠폰] [요청사항]
	
	// 주문 목록을 보여줄 전체 영역
	let orderlistWrap = $('.orderlist-wrap');
	
	// 주문 목록 1개의 Div 영역
	let initSetting = $('div.orderlist-card');
	
	console.log(initSetting);

	// 주문 목록 데이터 값
	let orderList = ${orderList};

	console.log(orderList);
	
	// 처음 화면을 로드했을 시에 Sample Clone을 생성해준다. (orderList[0]에 대한 값)
	window.onload = function() {
		
		insertCloneDiv();
		console.log("클론 콘테이너 ");
		console.log(clonecontainer);
		
	}
	
	
	// 초기 데이터 세팅
	function initData(value){
		
// 		orderlistWrap.append('<div class="orderlist-card'+ ((value == 0) ? '' : value) + '">' + initSetting.html() + '</div>');
		
// 		let clonecontainer = $('div.orderlist-card' + ((value == 0) ? '' : value));
		
		
		orderlistWrap.append('<div class="orderlist-card'+ value + '">' + initSetting.html() + '</div>');
		
		let clonecontainer = $('div.orderlist-card' + value );
		
		// 클론 내부영역에  테두리 모양의 구멍뚫린 O 모양을 추가시켜주고 매장명을 입력시켜준다.
		clonecontainer.children('.orderData1').children('.orderData-company').append('<div class="orderData-circle">' + '</div>' + orderList[value].brandnaming);
		// 주문 번호를 입력해줍니다.
		clonecontainer.find('.orderData-date').html('<b>주문번호</b> ' + orderList[value].salecode );
		
		
		
		// 주문 옵션을 넣어줍니다.
		
		// 1차 메인카테고리 HashMap array
		for(mainkey in Object.keys(orderList[value].maincategory)) {
			
			// HashMap [maincategory]를  단일 객체로 분리시켜줍니다.
			let inputMainKey = Object.keys(orderList[value].maincategory)[mainkey];
			
			
			console.log();
			console.log('메인카테고리 단일 값');
			console.log(inputMainKey);
			console.log();
			
			// after은 선택한 영역 뒤에 추가시켜줍니다.
			// 메인 메뉴 이름  <div> 영역에 추가하기  
			clonecontainer.find('.orderData-options-head').after('<div id="orderData-option-main-' + inputMainKey + '">' + inputMainKey + '</div>');
			
			
			
			// 서브 카테고리들
			let subcategories = orderList[value].maincategory[inputMainKey];
			
			
			console.log();
			console.log('서브카테고리 배열의 값');
			console.log(subcategories)
			console.log();
			
			
			
			// 2차 서브카테고리 HashMap 해제
			for(subkey in Object.keys(subcategories)){
				
				
				// HashMap [subcategory]를  단일 객체로 분리시켜줍니
				let inputSubKey = Object.keys(subcategories)[subkey];
				
				
				console.log();
				console.log('서브카테고리 단일의 값');
				console.log(inputSubKey);
				console.log();
				
				
				clonecontainer.find('#orderData-option-main-' + inputMainKey ).after('<div id="orderData-option-sub-' + inputSubKey + '">' + inputSubKey + '</div> <ul></ul>');
				
				
				let mainmenus = subcategories[inputSubKey];
				
				
				for ( i = 0; i < mainmenus.length; i++ ) {
					
					console.log('12세부메뉴 단일 값 : ' + i);
					console.log(mainmenus[i].name);
					console.log(mainmenus[i]);
					
					console.log(mainmenus[i].quickprice);
					let quickprice = ( mainmenus[i].quickprice === 0 ) ? '' : 'Quick Price : ' + numberWithCommas(mainmenus[i].quickprice) + '원';
					console.log('quick : ' + quickprice);
					
					clonecontainer.find('#orderData-option-sub-' + inputSubKey).next('ul').
					html('<li>' + mainmenus[i].name + ' '+ numberWithCommas(mainmenus[i].amount) +'개 X ' + 
								  numberWithCommas(mainmenus[i].menuprice) +'원  = ' + 	
								  numberWithCommas(mainmenus[i].sumprice) + '원 ' + quickprice  +
					     '</li>');

				}
			}
			
		}

		
		
		// [next] 기준 값을 하는 태그의 옆에 태그를 찾아줍니다. <ul> 안에 <li> 값을 넣어준다.
			
				
		// 원래 금액을 입력해줍니다.
		clonecontainer.find('.orderData-options-head-originalprice').next('ul').html('<li>' + numberWithCommas(orderList[value].originalprice) + '원 </li>');
		
		// 쿠폰 금액을 입력해줍니다.
		clonecontainer.find('.orderData-options-head-coupon').next('ul').html('<li>' + numberWithCommas(orderList[value].discountprice) + '원 </li>');
		
		// 요청사항에 대한 값을 입력해줍니다.
		clonecontainer.find('.orderData-options-head-requests').next('ul').html('<li>' + orderList[value].requests + '</li>');
		
		
		
		
		// 주문 일자를 입력해줍니다.
		clonecontainer.find('.orderData-total-purchasedate').html(' <b>주문일자</b> ' +  orderList[value].purchasedate);
		
		// 총 요청 개수를 입력해줍니다.
		clonecontainer.find('.orderData-total-totalamount').html('총 요청 개수 : ' +  orderList[value].totalamount);
		
		// 총 금액을 입력해줍니다.
		clonecontainer.find('.orderData-total-totalprice').html('Total ' +  numberWithCommas(orderList[value].totalprice));
		
	}
	
	
	// Clone한 Div영역을 반복문으로 orderList 배열의 길이만큼 반복시켜준다.
	// orderList[0]에 대한 값은 입력을 했으니 배열은 1부터 시작한다.
	function insertCloneDiv() {
		for (i = 0; i < orderList.length; i++){
			initData(i);
		}
	}
	
	// 1,000 단위 콤마 찍는 함수
	function numberWithCommas(value) {
		if (value == null || value == ""){
	        return value;
	    }
	    
	    // 소수점 분리
	    let valueArr = value.toString().split(".");
	    
	    let str = valueArr[0].toString();
	        str = str.replace ( /,/g ,'' );
	    let retValue = "";
	 
	    for( let i = 1; i <= str.length; i++ ) {
	        if ( i > 1 && ( i % 3 ) == 1 )
	            retValue = str.charAt ( str.length - i ) + "," + retValue;
	        else
	            retValue = str.charAt ( str.length - i ) + retValue;
	    }
	 
	    return retValue + (valueArr.length > 1 ? "." + valueArr[1] : "");
	}

	




</script>

<%@ include file="../main/customerFooter.jsp" %>    