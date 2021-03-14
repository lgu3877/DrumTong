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
	
	<!-- css -->
	<link rel="stylesheet" href="${cpath }/customer/css/customerStyle.css">
	<link rel="stylesheet" href="${cpath }/customer/css/membership/customerMembership.css"> <!-- membership css -->
	<link rel="stylesheet" href="${cpath }/customer/css/laundry/customerDetail.css"> <!-- content css -->
	
	<!-- font-awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://kit.fontawesome.com/7522a35233.js" crossorigin="anonymous"></script>
	
	<!-- jQuery -->
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

	<!-- Google Chart -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<!-- AXIOS -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
	<!-- cPath -->
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		
		function getContextPath() {
			return sessionStorage.getItem("contextpath");
		}
	</script>
	
	<!-- Header Setting -->
	<script type="text/javascript" src="${cpath }/customer/js/laundry/customerHeaderSetting.js"></script>
	
	<!-- initial -->
	<script>
		// google-chart on load
		window.onload = function() {
	    	google.charts.load("current", {packages:['corechart']});
	   	 	google.charts.setOnLoadCallback(displayChart); // 차트 출력
	   	 	setScore(); // 평점 계산
		}
	
		// estid & login variable
		const estid = `${estid}`;
		const cLogin = `${cLogin}`;
			console.log("estid", estid);
			console.log("cLogin", cLogin);
		
		// member id & login status
		const memberID = `${cLogin.memberid}`;
		let checkLogin = cLogin !== ''; // 로그인 했을 땐 true, 로그인 안되어있을 땐 false
			console.log("memberID", memberID);
			console.log("checkLogin", checkLogin);
		
		// 메뉴 리스트
		const menuList = ${menuList};
			console.log("menuList", menuList);

		// 리뷰 리스트
		const reviewList = ${ReviewList};
			console.log("reviewList", reviewList);
		
		// 쿠폰 리스트
		const couponList = ${CouponList};
			console.log("couponList", couponList);
			
		// 쿠폰 리스트
		const bCouponVO = ${bCouponVO};
			console.log("bCouponVO", bCouponVO);
		
		// 이미지 리스트
		const bImageVO = ${bImageVO};
			console.log("bImageVO", bImageVO);
	</script>
</head>

<body>

<!-- Header -->
	<%@ include file="../main/customer_Header.jsp"%>
	
<!-- Section-->
	<section class="section-SangJae">
		<div class="detailview-wrap">
			<div class="detailview-top">
				<div class="detailview-imgBlock" id="detailview-imgBlock">
					<div class="detailview-imgBlock-main">
						<img src="" />
					</div>
					<div class="detailview-imgBlock-subRow">
						<img src="" id="imgBox1" class="select exist" /> 
						<img src="" id="imgBox2" /> <img src="" id="imgBox3" /> 
						<img src="" id="imgBox4" /> <img src="" id="imgBox5" /> 
						<img src="" id="imgBox6" />
					</div>
				</div>
				<div class="detailview-companyIntro">
					<div class="detailview-intro-headline">
						<h1>${bInformationVO.brandnaming}</h1>
						<i id="bookMarker"></i>
					</div>
					<textarea readonly>${bManagementVO.introduction }</textarea>
					<div class="detailview-address">주소 :
						${bInformationVO.mainlocation } ${bInformationVO.detaillocation }</div>
				</div>
			</div>

			<div class="detailview-bottom">
				<div class="detailview-options">
					<button id="add-coupon" class="add-coupon" value="1000">쿠폰 받기</button>

					<div class="detailview-mainCate" id="mainCate"></div>
					<hr>
					<div class="detailview-subCate" id="subCate"></div>
					<br>
					<div class="detailview-selectOptions" id="detailview-selectOptions">
					</div>
				</div>

				<div class="detailview-select">
					<div class="select-head">My Selection</div>
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
						<article>
							<div>보내는 날짜</div>
							<input type="date">
								이 영역에 버튼을 만들고 버튼 누르면 달력 모달창이 뜨고 날짜 선택시
								이 영역에 선택한 날짜를 띄워줄 예정!input date는 display none으로!
						</article>
						<article>
							<div>받는 날짜</div>
							<input type="date">
								이 영역에 버튼을 만들고 버튼 누르면 달력 모달창이 뜨고 날짜 선택시
								이 영역에 선택한 날짜를 띄워줄 예정!input date는 display none으로!
						</article>
					</div>
					
					<div class="select-pickup" id="select-pickup">
						수거 방법 : 
						<input type="radio" name="pickup-check" onclick="calTotal()" value="0">
							직접 방문
						<input type="radio" name="pickup-check" id="pickup-check" checked onclick="calTotal()" value="1000">
							수거 요청(+ 1000 원)
					</div>
					
					<div class="select-deli" id="select-deli">
						받는 방법 : 
						<input type="radio" name="deli-check" onclick="calTotal()" value="0" />
							직접 방문 
						<input type="radio" name="deli-check" id="deli-check" checked onclick="calTotal()" value="1000">
							배달 요청(+ 1000 원)
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
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i>
							<div class="frontstars" id="frontstars">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i>
							</div>
						</div>
					</div>
					<div id="donut_single" style="height: 70%; position: relative;">

						<div class="outer-more">
							<div class="review-more" id="review-more" 
								onmouseover="mouseOverModal(this)"
								onmouseout="mouseOutModal(this)">
								<p>
									리뷰<br>더보기
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


<!-- Modal -->
	<%@ include file="../laundry/customerDetailModal.jsp"%>
	
<!-- Footer -->
	<%@ include file="../main/customerFooter.jsp"%>

	<!-- Login -->
	<script type="text/javascript" src="${cpath }/customer/js/membership/customerLogin.js"></script>

	<!-- Default Setting -->
	<script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail/customerDetailDefaultInterface.js"></script>
	
	<!-- Member Login View (Coupons & Bookmark) -->
	<script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail/cusrtomerDetailIMemberView.js"></script>

	<!-- Modal -->
	<script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail/customerDetailModal.js"></script>

	<!-- Google Chart -->
	<script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail/customerDetailGoogle.js"></script>

	<!-- Recent Search -->
	<script type="text/javascript" src="${cpath }/customer/js/main/customerRecentSearchData.js"></script>

	<!-- Order Request Submit (Async) -->
	<script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail/customerDetailSubmit.js"></script>

	<!-- Start Page (Load Page & Modal & Check Login & Date Area & Check Equality -->
	<script type="text/javascript" src="${cpath }/customer/js/laundry/customerDetail/customerDetailSetting.js"></script>
