<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/businessHeader.jsp"%>
	
	<link rel="stylesheet" href="${cpath }/business/css/membership/businessFinishSignUp.css">
	
	<div class="mainDiv">
		<h1>회원가입 완료를 축하드립니다</h1>
		<hr>
		<div>
			<button onclick="location.href='${cpath}/business/contract/businessContract/'">온라인 계약</button>
		</div>
		<div>
			<button onclick="location.href='${cpath}/business/">사업자 메인페이지</button>
		</div>
	</div>



<%@ include file="../main/businessFooter.jsp"%>
</body>
</html>