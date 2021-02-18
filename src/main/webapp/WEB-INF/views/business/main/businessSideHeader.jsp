<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="side_header_sub_back" id="review-side">
	 <div class="sub_back_div">
	 	<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessReviewManagement/whole/'"><p>전체 리뷰</p></div>
		<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessReviewManagement/noReply/'"><p>미답변 리뷰</p></div>
		<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessReviewManagement/reportReply/'"><p>신고 리뷰</p></div>
	 </div>
</div>

<div class="side_header_sub_back" id="statistics-side">
	<div class="sub_back_div">
		<div class="sub_back_menu_title"><span class="menu_title">조회수</span>
			<div class="sub_back_menu_div">
				<div class="sub_back_menu" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Hits/Day/n/n/'">일간</div>		
				<div class="sub_back_menu" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Hits/Week/n/n/'">주간</div>
				<div class="sub_back_menu" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Hits/Month/n/n/'">월간</div>
			</div>
		</div>
		<div class="sub_back_menu_title"><span class="menu_title">주문수</span>
			<div class="sub_back_menu_div">
				<div class="sub_back_menu"
					onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Orders/Day/n/n/'">일간</div>
				<div class="sub_back_menu"
					onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Orders/Week/n/n/'">주간</div>
				<div class="sub_back_menu"
					onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Orders/Month/n/n/'">월간</div>
			</div>
		</div>
		<div class="sub_back_menu_title"><span class="menu_title">주문금액</span>
			<div class="sub_back_menu_div">
				<div class="sub_back_menu"
					onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Price/Day/n/n/'">일간</div>
				<div class="sub_back_menu"
					onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Price/Week/n/n/'">주간</div>
				<div class="sub_back_menu"
					onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Price/Month/n/n/'">월간</div>
			</div>
		</div>
	</div>
</div>

<div class="side_header_sub_back" id="orderstatus-side">
	<div class="sub_back_div">
		<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessOrderStatusManagement/REQUEST/'"><p>요청</p></div>
		<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessOrderStatusManagement/PROCESSING/'"><p>처리중</p></div>
		<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessOrderStatusManagement/SUCCESS/'"><p>완료</p></div>
	</div>
</div>


<div class="side_header_con">
	<div class="side_header_logo">
		<a href="${cpath }/business/">
			<img src="${cpath }/resources/business/img/businessLogo.png" />
		</a>
	</div>
	<ul class="side_menu_con">
		<li class="side_menu_list" onclick="location.href='${cpath}/business/mainmanagement/businessShopManagement/'">
			<i class="fas fa-store  fa-3x"></i>
			<div class="side_menu">
				<div class="side_menu_title" >매장관리</div>
			</div>
			<div class="side_menu_sub side_hide">
			
			</div>
		</li>
		<li class="side_menu_list"  onclick="location.href='${cpath}/business/mainmanagement/businessScheduleManagement/'">
			<i class="fas fa-calendar-alt fa-3x"></i>
			<div class="side_menu">
				<div class="side_menu_title">일정관리</div>
			</div>
			<div class="side_menu_sub side_hide">
			
			</div>
		</li>
		<li class="side_menu_list" id="review-list">
			<i class="fas fa-users fa-3x"></i>
			<div class="side_menu">
				<div class="side_menu_title">리뷰관리</div>
				<input type="hidden" name="review-side">
			</div>
			<div class="side_menu_sub side_hide">
			
			</div>
		</li>
		<li class="side_menu_list"  onclick="location.href='${cpath}/business/submanagement/businessCouponManagement/'">
			<i class="fas fa-hand-holding-usd  fa-3x"></i>
			<div class="side_menu">
				<div class="side_menu_title">쿠폰관리</div>
			</div>
			<div class="side_menu_sub side_hide">
			
			</div>
		</li>
		<li class="side_menu_list"  onclick="location.href='${cpath}/business/submanagement/businessCardAccountManagement/'">
			<i class="fab fa-cc-amazon-pay fa-3x"></i>
			<div class="side_menu">
				<div class="side_menu_title">결제변경</div>
			</div>
			<div class="side_menu_sub side_hide">
			
			</div>
		</li>
		<li class="side_menu_list" id="statistics-list">
			<i class="fas fa-calculator fa-3x"></i>
			<div class="side_menu">
				<div class="side_menu_title">통계관리</div>
				<input type="hidden" name="statistics-side">
			</div>
			<div class="side_menu_sub side_hide">
			
			</div>
		</li>
		<li class="side_menu_list"  id="orderstatus-list">
			<i class="fas fa-file-invoice-dollar fa-3x"></i>
			<div class="side_menu">
				<div class="side_menu_title">주문현황</div>
				<input type="hidden" name="orderstatus-side">
			</div>

		</li>
	</ul>
</div>

<script type="text/javascript">
	var side_menus = document.getElementsByClassName('side_menu_list');
	var setTimeFont = new Array();
// 	console.log('와이드 : ' + document.querySelector('.side_header_con').offsetWidth );
// 	console.log('브라우저 너비 : ' + window.innerWidth);
	
	let back_side_headers = document.querySelectorAll('.side_header_sub_back');
	
	
	for(let i = 0; i < back_side_headers.length; i++ ) {
// 		back_side_headers[i].style.left = document.querySelector('.side_header_con').offsetWidth + 'px';
		back_side_headers[i].style.left = '-175px';
	}
	
	
	function anontherBackExit(object1, object2) {
		let subBack = document.querySelectorAll('.side_header_sub_back');
// 		console.log('object1 : ' + object1.id);
// 		console.log('object2 : ' + object2.id);
		for(let i = 0 ; i < subBack.length; i++) {
// 			console.log('another-id : ' + subBack[i].id);
			if(subBack[i].id != object2.id) {
				subBack[i].style.transform = "translate(0, 0)";
			}
		}
		
		let switches = document.querySelectorAll('.side_menu_list_switch');
		for(let j = 0; j < switches.length; j++) {
// 			console.log('switches-id : ' + switches[j].id);
			if(switches[j].id != object1.id) {
				switches[j].className = 'side_menu_list';
			}
		}
	}
	

	document.getElementById('orderstatus-list').addEventListener("click", function() {
		
		let sub_bacK_div = document.getElementById(this.querySelector('input[type="hidden"]').name);

			if(this.className == 'side_menu_list') {	//	나타나기
				anontherBackExit(this, sub_bacK_div);
				sub_bacK_div.style.transform = "translate(300px, 0)";
				this.className = 'side_menu_list_switch';
			}
			else {										// 사라지기
				sub_bacK_div.style.transform = "translate(0, 0)";
				this.className = 'side_menu_list';
			}
	})
	
	document.getElementById('review-list').addEventListener("click", function() {
		
		let sub_bacK_div = document.getElementById(this.querySelector('input[type="hidden"]').name);

		if(this.className == 'side_menu_list') {	//	나타나기
			anontherBackExit(this, sub_bacK_div);
			sub_bacK_div.style.transform = "translate(300px, 0)";
			this.className = 'side_menu_list_switch';
		}
		else {										// 사라지기
			sub_bacK_div.style.transform = "translate(0, 0)";
			this.className = 'side_menu_list';
		}
	})
	
	document.getElementById('statistics-list').addEventListener("click", function() {
		
		let sub_bacK_div = document.getElementById(this.querySelector('input[type="hidden"]').name);

		if(this.className == 'side_menu_list') {	//	나타나기
			anontherBackExit(this, sub_bacK_div);
			sub_bacK_div.style.transform = "translate(300px, 0)";
			this.className = 'side_menu_list_switch';
		}
		else {										// 사라지기
			sub_bacK_div.style.transform = "translate(0, 0)";
			this.className = 'side_menu_list';
		}
	})
</script>