<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<%@ include file="../main/businessHeader.jsp"%>


<section>
	<!-- Login -->
	<div class="single_page_login">
		<div class="login_title">
			<p>Login</p>
		</div>
		<form class="login_form">
			<div class="login_input_con" action="#" method="POST">
				<div>
					<div class="input_title text-left">Account(Email)<span class="red-mark">*</span></div>
					<input type="text" placeholder="enter your ID">
				</div>
				<div>
					<div class="input_title text-left">Password<span class="red-mark">*</span></div>
					<input type="password" placeholder="type in your Password">
				</div>
				<div>
					<input type="submit" value="Login" />
				</div>
			</div>
			<div class="login_search_con">
				<div>
					<a href="#">아이디/비밀번호 찾기</a>
				</div>
				<div>
					<a href="${cpath }/business/membership/businessSignUp/">회원가입</a>
				</div>
			</div>
		</form>
	</div>

	<hr><b>달력 임시 출력(연습)</b>

	<div>
		<div class="calender">
			<div class="calender_wrapper">
				<!-- left -->
				<div class="calender_left_con">
					<div class="date_indicator">
						<div id="main-day" class="today">Today</div>
						<div id="main-date" class="date">Date</div>
					</div>
				</div>
				<!-- right -->
				<div class="calender_right">
					<table id="calendar" align="center">
						<thead>
						<!-- upper head -->
							<tr class="calender_head">
								<td><label id="prev"> &#60; </label></td>
								<!-- Current Year & Month -->
								<td align="center" id="current-year-month" colspan="5"></td>
								<td><label id="next"> &#62; </label></td>
							</tr>
						<!-- lower body(date) -->
							<tr>
								<td class="sunday" align="center">Sun</td>
								<td align="center">Mon</td>
								<td align="center">Tue</td>
								<td align="center">Wed</td>
								<td align="center">Thu</td>
								<td align="center">Fri</td>
								<td class="saturday" align="center">Sat</td>
							</tr>
						</thead>
						<tbody id="calendar-body" class="calendar_body"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../main/businessFooter.jsp"%>
