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

	
		<!-- Content Title-->
		<div class="pagetitlediv">
			<span>쿠폰 등록</span>
		</div>
		
		<!-- Content Container -->
		<div class="container">

			<!-- 쿠폰 등록 -->
			<div class="inputFlex form">
				<div class="inputDivContainer" id="enrollDiv">

					<!-- 기간 -->
					<div class="mb-20">
						<div class="input_title">기간</div>
						<div style="display: flex;">
							<!-- 쿠폰 시작일 -->
							<input type="date" name="period" id="beforeDate" onchange="activateEndDate()">

							<!-- 하이픈 -->
							<div class="date_arrow">~</div>

							<!-- 쿠폰 시작일 -->
							<input id="afterDate" type="date" name="period" readonly onchange="dateValidation()">
						</div>
					</div>
					
					<!-- 최소주문금액 -->
					<div class="mb-20">
						<div class="input_title">최소주문금액</div>
						<div class="costDiv">
							<input type="text" placeholder="최소 주문금액(원)" id="minimumprice"
								name="minimumprice" onkeyup="costSlice()">
						</div>
					</div>

					<!-- 할인금액-->
					<div class="mb-20">
						<div class="input_title">할인금액</div>
						<div class="costDiv">
							<input type="text" placeholder="할인 적용금액(원)" id="discount"
								name="discount" onkeyup="costSlice()">
						</div>
					</div>

					<!-- 쿠폰발급 옵션 -->
					<div class="mb-20">
						<div class="input_title">발급옵션</div>
						<div class="d-flex">
							<!-- 무제한 선택 옵션 -->
							<div class="radioDiv">
								<!-- label & input(radio) -->
								<label for="unlimitedCoupon" class="radio_label"> 
									<input type="radio" name="maxissuenum" id="unlimitedCoupon"
										   onchange="changeUnlimitedOption()">
									<span class="fs-15">무제한</span>
								</label>
							</div>
							
							<!-- 선착순 선택 옵션 -->
							<div class="radioDiv">
								<!-- label & input(radio) -->
								<label for="limitedcoupon" class="radio_label">
									<input id="limitedcoupon" type="radio" name="maxissuenum"
										   onchange="changeFirstInOutOption(this)">
									<span class="fs-15">선착순</span>
								</label>
							</div>

							<!-- 선착순 인원 입력 input(text) -->
							<div class="radioDiv">
								<input id="limitedcouponNum" class="coupon_amount" type="text" placeholder="발급쿠폰 수(개)" onkeyup="costSlice()" style="display: none;">
							</div>
						</div>
						

					</div>
				</div>


				<!-- 쿠폰 등록(발급) 버튼 -->
				<div class="sideinputDiv">
					<input class="coupon_publish" type="button" value="발급" onclick="couponEnrollment()">
				</div>
				
			</div>
		</div>

		<!-- Content Title-->
		<div class="pagetitlediv">
			<span>쿠폰 리스트</span>
		</div>
		
		<!-- 쿠폰 리스트 -->
		<div id="enrollmentedDiv"></div>

	</section>
	
	<!-- 전역변수 & 초기실행(onload) -->
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
		
		
		// 가격에 콤마(,) 삽입
		function insertComma(string) {
			const reversedString = string.split("").reverse().join("");
			const commaAttached = reversedString.replace(/(.{3})/g,"$1,");
			
			const array = commaAttached.split("").reverse();
			
			if (array[0] === ",") {
				array.shift();
			}
			
			return array.join("");
		}
	</script>
	
	<!-- 인터페이스(View & Event Control) -->
	<script type="text/javascript" src="${cpath }/business/js/submanagement/businessCouponInterface.js"></script>
	
	<!-- 업데이트(Axios request & response) -->
	<script type="text/javascript" src="${cpath }/business/js/submanagement/businessCouponUpdate.js"></script>

</body>

</html>