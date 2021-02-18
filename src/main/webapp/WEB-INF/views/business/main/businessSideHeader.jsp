<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="side_header_sub_back" id="review-side" style="visibility: hidden;">
	 <div class="sub_back_div">
	 	<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessReviewManagement/whole/'"><p>전체 리뷰</p></div>
		<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessReviewManagement/noReply/'"><p>미답변 리뷰</p></div>
		<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessReviewManagement/reportReply/'"><p>신고 리뷰</p></div>
	 </div>
	 <div class="whitecover"></div>
</div>

<div class="side_header_sub_back" id="statistics-side" style="visibility: hidden">
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
	<div class="whitecover"></div>
</div>

<div class="side_header_sub_back" id="orderstatus-side"  style="visibility: hidden">
	<div class="sub_back_div">
		<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessOrderStatusManagement/REQUEST/'"><p>요청</p></div>
		<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessOrderStatusManagement/PROCESSING/'"><p>처리중</p></div>
		<div class="sub_back_location" onclick="location.href='${cpath}/business/submanagement/businessOrderStatusManagement/SUCCESS/'"><p>완료</p></div>
	</div>
	<div class="whitecover"></div>
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
	console.log('와이드 : ' + document.querySelector('.side_header_con').offsetWidth );
	console.log('브라우저 너비 : ' + window.innerWidth);
	
	let back_side_headers = document.querySelectorAll('.side_header_sub_back');
	
	
	for(let i = 0; i < back_side_headers.length; i++ ) {
		back_side_headers[i].style.left = document.querySelector('.side_header_con').offsetWidth + 'px';
	}
	
	
	
	// 사이드 메뉴의 서브 div를 닫을 때 사용하는 함수
	function hideWhiteCover(tagpath, object) {
		
		let list_tags = document.querySelectorAll('.side_menu_con li');
		for(let k = 0; k < list_tags.length; k++) {
			list_tags[k].style.background = ''
		}
		object.style.background = '#3b5998';
		
		// 맨 처음 사이드 메뉴를 클릭 할 때에는 class="side_menu_list" 밖에 없기 때문에 만든 조건문
		// 최소한 1개 이상의 class="side_menu_list_switch" 가 있어야 오류 없이 함수가 작동가능하다
		if(document.querySelector('.side_menu_list_switch') == null)
			return false;

		let sub_bacK_divs = document.querySelectorAll('.side_header_sub_back');
		for(let j = 0; j < sub_bacK_divs.length; j++) {
			if(sub_bacK_divs[j].style.visibility == 'visible') {
				sub_bacK_divs[j].style.visibility = "hidden";
				sub_bacK_divs[j].style.transform = "translate(-300px, 0)";
				break;
			}
		}
		let whitecovers = document.querySelectorAll('.side_header_sub_back .whitecover');
		for(let i = 0; i < whitecovers.length; i++) {
			whitecovers[i].style.width = '300px';
		}
		
		object.className = "side_menu_list";
	}
	
	function showWhiteCover(tagpath) {
		let switchs = document.querySelectorAll('.side_menu_list_switch');
		for(let i = 0; i < switchs.length; i++) {
			switchs[i].className = 'side_menu_list';
		}
		tagpath.style.transform = "translate(0, 0)";
		tagpath.style.visibility = "visible";
		tagpath.querySelector('.whitecover').style.width = '0';
	}

	document.getElementById('orderstatus-list').addEventListener("click", function() {
		
		let sub_bacK_div = document.getElementById(this.querySelector('input[type="hidden"]').name);

			if(this.className == 'side_menu_list_switch')
				hideWhiteCover(sub_bacK_div, this);
			else {
				hideWhiteCover(sub_bacK_div, this);
				showWhiteCover(sub_bacK_div);
				this.className = 'side_menu_list_switch';
			}
	})
	document.getElementById('review-list').addEventListener("click", function() {
		
		let sub_bacK_div = document.getElementById(this.querySelector('input[type="hidden"]').name);

			if(this.className == 'side_menu_list_switch')
				hideWhiteCover(sub_bacK_div, this);
			
			else {
				hideWhiteCover(sub_bacK_div, this);
				showWhiteCover(sub_bacK_div);
				this.className = 'side_menu_list_switch';
			}
	})
	document.getElementById('statistics-list').addEventListener("click", function() {
		
		let sub_bacK_div = document.getElementById(this.querySelector('input[type="hidden"]').name);

		if(this.className == 'side_menu_list_switch')
			hideWhiteCover(sub_bacK_div, this);
		
		else {
			hideWhiteCover(sub_bacK_div, this);
			showWhiteCover(sub_bacK_div);
			this.className = 'side_menu_list_switch';
		}
	})
</script>