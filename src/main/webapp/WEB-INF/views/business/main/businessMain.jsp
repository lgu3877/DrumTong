<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="businessHeader.jsp" %>    


<section>
	<div style="background-color: black; width: 100%; height: 40%">
		<div class="marginzero inlineBlock" style="width: 50%;height: 50%; background-color: red; float: left"></div>
		<div class="marginzero inlineBlock" style="width: 50%;height: 50%; background-color: aqua; float: left"></div>
		<div class="marginzero inlineBlock" style="width: 50%;height: 50%; background-color: white; float: left"></div>
		<div class="marginzero inlineBlock" style="width: 50%;height: 50%; background-color: yellow ;"></div>
	</div>
	<div style="background-color: white; width: 100%; height: 20%">
		<div class="marginzero inlineBlock" style="width: 14.2%;height: 100%; background-color: red; float: left; line-height: 200px">A</div>
		<div class="marginzero inlineBlock" style="width: 14.2%;height: 100%; background-color: aqua; float: left; line-height: 200px">B</div>
		<div class="marginzero inlineBlock" style="width: 14.2%;height: 100%; background-color: red; float: left; line-height: 200px">C</div>
		<div class="marginzero inlineBlock" style="width: 14.2%;height: 100%; background-color: aqua; float: left; line-height: 200px">D</div>
		<div class="marginzero inlineBlock" style="width: 14.2%;height: 100%; background-color: red; float: left; line-height: 200px">E</div>
		<div class="marginzero inlineBlock" style="width: 14.2%;height: 100%; background-color: aqua; float: left; line-height: 200px">F</div>
		<div class="marginzero inlineBlock" style="width: 14.8%;height: 100%; background-color: red; float: left; line-height: 200px">G</div>
	</div>
	<div style="background-color: gray; width: 100%; height: 20%">
		<div class="marginzero inlineBlock" style="width: 50%;height: 100%; background-color: yellow; float: left; line-height: 200px">슬라이드</div>
		<div class="marginzero inlineBlock" style="width: 50%;height: 100%; background-color: white; float: left">
			<form action="#" method="POST" style="height: 100%;">
				<div class="marginzero inlineBlock parent" style="width: 60%; height: 100%; float: left; text-align: center">
				<div>
					<input type="text" placeholder="아이디">
					</div>
				<div>
					<input type="password" placeholder="비밀번호">
					</div>
				</div>
				<div class="marginzero inlineBlock parent" style="width: 40%; height: 100%; float: left; text-align: center">				
					<input type="submit" value="로그인">
				</div>
			</form>
		</div>
	</div>
</section>

<%@ include file="businessFooter.jsp" %>    