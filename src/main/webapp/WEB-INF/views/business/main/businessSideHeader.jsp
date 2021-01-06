<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="side_header_con">
	<div class="side_header_logo">
		<a href="${cpath }/business/">
			<img src="${cpath }/resources/business/img/businessLogo.png" />
		</a>
	</div>
	<ul class="side_menu_con">
		<li class="side_menu_list">
			<div class="side_menu">
				<div class="side_menu_title" onclick="location.href='${cpath}/business/mainmanagement/businessShopManagement/'">매장관리</div>
				<div class="side_menu_icon">
					<i class="fas fa-angle-down"></i>
				</div>
			</div>
		</li>
		<li class="side_menu_list">
			<div class="side_menu">
				<div class="side_menu_title" onclick="location.href='${cpath}/business/mainmanagement/businessScheduleManagement/'">일정관리</div>
				<div class="side_menu_icon">
					<i class="fas fa-angle-down"></i>
				</div>
			</div>
		</li>
		<li class="side_menu_list">
			<div class="side_menu">
				<div class="side_menu_title">리뷰관리</div>
				<div class="side_menu_icon">
					<i class="fas fa-angle-down"></i>
				</div>
			</div>
			<ul class="side_menu_dropdown">
				<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessReviewManagement/whole/'">전체 리뷰</li>
				<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessReviewManagement/noReply/'">미답변 리뷰</li>
				<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessReviewManagement/reportReply/'">신고 리뷰</li>
			</ul>
		</li>
		<li class="side_menu_list">
			<div class="side_menu">
				<div class="side_menu_title" onclick="location.href='${cpath}/business/submanagement/businessCouponManagement/'">쿠폰관리</div>
				<div class="side_menu_icon">
					<i class="fas fa-angle-down"></i>
				</div>
			</div>
		</li>
		<li class="side_menu_list">
			<div class="side_menu">
				<div class="side_menu_title" onclick="location.href='${cpath}/business/submanagement/businessCardAccountManagement/'">결제변경</div>
				<div class="side_menu_icon">
					<i class="fas fa-angle-down"></i>
				</div>
			</div>
		</li>
		<li class="side_menu_list">
			<div class="side_menu">
				<div class="side_menu_title">통계관리</div>
				<div class="side_menu_icon">
					<i class="fas fa-angle-down"></i>
				</div>
			</div>
			<ul class="side_menu_dropdown">
				<li class="side_menu_dropdown_list">조회수
					<ul class="side_menu_dropdown">
						<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Hits/Day/n/n/'">일간</li>
						<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Hits/Week/n/n/'">주간</li>
						<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Hits/Month/n/n/'">월간</li>
					</ul>
				</li>
				<li class="side_menu_dropdown_list">주문수
					<ul class="side_menu_dropdown">
						<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Orders/Day/n/n/'">일간</li>
						<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Orders/Week/n/n/'">주간</li>
						<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Orders/Month/n/n/'">월간</li>
					</ul>
				</li>
				<li class="side_menu_dropdown_list">주문금액
					<ul class="side_menu_dropdown">
						<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Price/Day/n/n/'">일간</li>
						<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Price/Week/n/n/'">주간</li>
						<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessStatisticsManagement/Price/Month/n/n/'">월간</li>
					</ul>
				</li>
			</ul>
		</li>
		<li class="side_menu_list">
			<div class="side_menu">
				<div class="side_menu_title">주문현황</div>
				<div class="side_menu_icon">
					<i class="fas fa-angle-down"></i>
				</div>
			</div>
			<ul class="side_menu_dropdown">
				<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessOrderStatusManagement/REQUEST/'">요청</li>
				<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessOrderStatusManagement/PROCESSING/'">처리중</li>
				<li class="side_menu_dropdown_list" onclick="location.href='${cpath}/business/submanagement/businessOrderStatusManagement/SUCCESS/'">완료</li>
			</ul>
		</li>
	</ul>
</div>