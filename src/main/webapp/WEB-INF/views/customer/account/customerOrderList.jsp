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
          <div class="orderData-circle"></div>
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
          <div class="orderData-options-head">주문옵션</div>
          	
<!--           	주문 옵션 출력 -->
<%--           	<c:forEach items="${orderList.bDetailSalesVorderListist }" var="bl"> --%>
<%-- 	          	<div class="orderData-options-head">${bl.maincategory }</div> --%>
<%-- 	          	<div class="orderData-options-head">${bl.subcategory }</div> --%>
<!-- 	            	<ul> -->
<%-- 		            	<li> ${bl.name }  --%>
<%-- 			            	개당 가격 : <fmt:formatNumber value="${bl.menuprice }" pattern="#,###" />원 --%>
<%-- 			            	총 개수 : ${bl.amount } --%>
<%-- 			            	합산 : <fmt:formatNumber value="${bl.sumprice }" pattern="#,###" />원  --%>
<!-- 			            </li> -->
<!-- 			       </ul> -->
<%--             </c:forEach> --%>
            
            
          
          
          <div class="orderData-options-head-originalprice">오리지널 금액</div>
          <ul>
<%--             <li><fmt:formatNumber value="${orderList.originalprice }" pattern="#,###" />원</li> --%>
          </ul>
          
          
          
          
          
          
          
<!-- 		          <div class="orderData-options-head-coupon">쿠폰</div> -->
<!-- 		          <ul> -->
<%-- 		            <li>-<fmt:formatNumber value="${orderList.discountprice }" pattern="#,###" />원</li> --%>
<!-- 		          </ul> -->
		          
<!-- 		          <div class="orderData-options-head-requests">요청사항</div> -->
<!-- 		          <ul> -->
<%-- 		            <li>${orderList.requests }</li> --%>
<!-- 		          </ul> -->
		          
<!-- 		        </div> -->
<!-- 		      </div> -->
<!-- 		      <div class="orderData-total"> -->
<!-- 		      	<div class="orderData-total-purchasedate"> -->
<%-- 		      		  <b>주문일자</b>  ${orderList.purchasedate }  --%>
<!-- 		      	</div> -->
<!-- 		      	<div class="orderData-total-totalamount"> -->
<%-- 		      		총 요청 개수 : ${orderList.totalamount } --%>
<!-- 		      	</div> -->
<!-- 		      	<div class="orderData-total-totalprice"> -->
<%-- 		      		Total <fmt:formatNumber value="${orderList.totalprice }" pattern="#,###" />원 --%>
<!-- 		      	</div> -->
<!-- 		      </div> -->
		      
		      
<!-- 		    </div> -->








<%--     </c:forEach> --%>
<%--     </c:if> --%>
    
  </div>
</section>

<!-- 스크립트 영역 -->
<script type="text/javascript">
	
	// 주문 시에값이 없을 수도 있는 값
	// [쿠폰] [요청사항]
	
	// 주문 목록을 보여줄 전체 영역
	let orderlistWrap = $('.orderlist-wrap');
	
	// 주문 목록 1개의 Div 영역
	let clonecontainer = $('div.orderlist-card');
	
	// 주문 목록 데이터 값
	let orderList = ${orderList};

	console.log(orderList);
	
	
	// 처음 화면을 로드했을 시에 Sample Clone을 생성해준다. (orderList[0]에 대한 값)
	window.onload = function() {
		
		// 클론 내부영역에  테두리 모양의 구멍뚫린 O 모양을 추가시켜주고 매장명을 입력시켜준다.
		clonecontainer.children('.orderData1').children('.orderData-company').append('<div class="orderData-circle">' + '</div>' + orderList[0].brandnaming);
		
		// 주문 번호를 입력해줍니다.
		clonecontainer.find('.orderData-date').html('<b>주문번호</b> ' + orderList[0].salecode );

		for(i=0; i < orderList[0].bDetailSalesVorderListist.lenght; i++) {
			clonecontainer.find('.orderData-options-head').html('<div class="orderData-options-maincategory">' + orderList[0].bDetailSalesVorderListist[i].maincategory + '</div>');
			clonecontainer.find('.orderData-options-head').html('<div class="orderData-options-subcategory">' + orderList[0].bDetailSalesVorderListist[i].subcategory + '</div>');
			

		}
		
		orderList[0].bDetailSalesVorderListist
		// 		clonecontainer.find('.
		
		
		// [nextElementSibling] 기준 값을 하는 태그의 옆에 태그를 찾아줍니다. <ul> 안에 <li> 값을 넣어준다.
			
				
		// 원래 금액을 입력해줍니다.
		clonecontainer.find('.orderData-options-head-originalprice').nextElementSibling.html('<li>' + numberWithCommas(orderList[0].originalprice) + '</li>');
		
		// 쿠폰 금액을 입력해줍니다.
		clonecontainer.find('.orderData-options-head-coupon').nextElementSibling.html('<li>' + numberWithCommas(orderList[0].coupon) + '</li>');
		
		// 요청사항에 대한 값을 입력해줍니다.
		clonecontainer.find('.orderData-options-head-requests').nextElementSibling.html('<li>' + orderList[0].requests + '</li>');
		
		// 
		clonecontainer.find();
		
		
		
	}
	
	// Clone한 Div영역을 반복문으로 orderList 배열의 길이만큼 반복시켜준다.
	// orderList[0]에 대한 값은 입력을 했으니 배열은 1부터 시작한다.
	function insertCloneDiv() {
		for (i = 1; i < orderList.length; i++){
			orderlistWrap.append('<div class="orderlist-card">' + clonecontainer.html() + '</div>');
		}
	}
	
	// 1,000 단위 콤마 찍는 함수
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}



</script>

<%@ include file="../main/customerFooter.jsp" %>    