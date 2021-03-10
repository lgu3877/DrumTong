<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: businessCouponManagemnet</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- businessCouponManagement css -->
	<link rel="stylesheet" href="${cpath }/business/css/submanagement/businessCouponManagement.css">

	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   	
   	<!-- javascript cpath -->
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		function getContextPath() {
		    return sessionStorage.getItem("contextpath");
		}
	</script>
</head>
<body>
		
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
	<!-- sub-header(membership) -->
	<%@ include file="../main/businessSubHeader.jsp" %>
	
	
	<!-- 발급날짜 별로 자동적으로 정렬이 이루어지도록 만들자 -->
<div class="pagetitlediv">
	<h1>쿠폰</h1>
</div>
<div class="container">
        <div class="inputFlex">
        <div class="inputDivContainer">
        <i class="fas fa-bookmark fa-10x" style="position: absolute; left: -150px; color: #3b5998"></i>
        <span class="bookmark">쿠폰<br>입력</span>
            <div class="inputDiv" id="enrollDiv">
                <h1>기간</h1>
                <input type="date" name="period" id="beforeDate">
                <h1 style="width: 20px; display: inline-block; text-align: center;">-</h1>
                <input type="date" name="period"  id="afterDate" readonly>
                
                <div class="costDiv">
                    <h1>최소주문금액</h1>
                    <input type="text" placeholder="금액을 입력하세요" id="minimumprice" name="minimumprice">
                </div>
                
                <div  class="costDiv">
                    <h1>할인금액</h1>
                    <input type="text" placeholder="금액을 입력하세요" id="discount" name="discount">
                </div>

                
                <div  class="radioDiv">	<!-- 체크되었을 때 옆에 입력란 활성화 -->
                    <input type="radio" name="maxissuenum" id="unlimitedcoupon">	<!-- 선착순도 name="maxissunum" value 값이 0이 되지 않도록 하기 -->
                    <h1>무제한</h1>
                </div>
                <div  class="radioDiv">	<!-- 체크되었을 때 옆에 입력란 활성화 -->
                    <input type="radio" name="maxissuenum" id="limitedcoupon">	<!-- 선착순도 name="maxissunum" value 값이 0이 되지 않도록 하기 -->
                    <h1>선착순</h1>
                    <input tpye="text" placeholder="숫자를 입력하세요" id="limitedcouponNum" style="display: none; ">
                </div>
                <div class="bottombg1"></div>
                <div class="topbg1"></div>

            </div>
                    </div>
            <div class="sideinputDiv">
                <div class="sidedivborder">
                    <div class="buttonDiv">
                        <input type="button" value="등록" onclick="couponEnrollment()">
                    </div>
                        <div class="sideCircle-black" style="top: -2px"></div>
                        <div class="sideCircle-black" style="top: 78px"></div>
                        <div class="sideCircle-black" style="top: 158px"></div>
                        <div class="sideCircle-black" style="top: 238px"></div>
                        <div class="sideCIrcle-white" style="top: -1px"></div>
                        <div class="sideCIrcle-white" style="top: 79px"></div>
                        <div class="sideCIrcle-white" style="top: 159px"></div>
                        <div class="sideCIrcle-white" style="top: 239px"></div>
                        <div class="side-hr"></div>
                        <div class="bottombg2"></div>
                        <div class="topbg2"></div>
                    </div>
                </div>
            </div>
    
    
        </div>
	
	<hr>
	
	<div id="enrollmentedDiv" class="container">
	
	</div>

	</section>
<script type="text/javascript">

	var couponlist = null;
	var slidenum = null;		// 화살표 누를 때마다 3개씩 쿠폰보여주기 위한 변수
	
	window.onload = function() {
		var inputDate = document.querySelectorAll('input[type="date"]');
	
		var date = new Date();
		var year = date.getFullYear();
		var month = new String(date.getMonth()+1);
		var day = new String(date.getDate()); 
		
		for(i = 0; i < 2; i++) {
			inputDate[i].setAttribute('min', year + '-' + month + '-' + day);
		}
		couponlist = ${couponList };
		showCounpons();
		slidenum = 3;
	}

</script>
<script type="text/javascript" src="${cpath }/business/js/submanagement/businessCouponManagement.js"></script>
</body>

</html>