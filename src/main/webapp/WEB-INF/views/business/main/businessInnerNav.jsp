<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- inner navbar with icons -->
<div class="inner_nav_con">
	<div class="inner_nav" onclick="accessControl('ShopManagement')" id="ShopManagement">
	<i class="fas fa-store  fa-3x"></i>
	<p>매장관리</p></div>
	
	<div class="inner_nav" onclick="accessControl('ScheduleManagement')" id="ScheduleManagement">
	<i class="fas fa-calendar-alt fa-3x"></i>
	<p>일정관리</p></div>
	
	<div class="inner_nav" onclick="accessControl('ReviewManagement')" id="ReviewManagement">
	<i class="fas fa-users fa-3x"></i>
	<p>리뷰관리</p></div>
	
	<div class="inner_nav" onclick="accessControl('CouponManagement')" id="CouponManagement">
	<i class="fas fa-hand-holding-usd  fa-3x"></i>
	<p>쿠폰관리</p></div>
	
	<div class="inner_nav" onclick="accessControl('CardAccountManagement')" id="CardAccountManagement">
	<i class="fab fa-cc-amazon-pay fa-3x"></i>
	<p>결제변경</p></div>
	
	<div class="inner_nav" onclick="accessControl('StatisticsManagement')" id="StatisticsManagement"> 
	<i class="fas fa-calculator fa-3x"></i>
	<p>통계</p></div>
	
	<div class="inner_nav" onclick="accessControl('OrderStatusManagement')" id="OrderStatusManagement">
	<i class="fas fa-file-invoice-dollar fa-3x"></i>
	<p>주문현황</p></div>
</div>