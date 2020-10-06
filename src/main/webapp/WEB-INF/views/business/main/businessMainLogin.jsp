<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>

	<form class="login_wrapper">
		<div class="login_title">
			<p>Login</p>
		</div>
		<div class="login_input_con" action="#" method="POST">
			<div>
				<input type="text" placeholder="   Account">
			</div>
			<div>
				<input type="password" placeholder="   Password">
			</div>
			<div class="login_button_con">
				<input type="submit" value="Login" style="float: left">
				<button onclick="#" style="float: right;">Sign-up</button>
			</div>
		</div>
	</form>
