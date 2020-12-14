<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>businessFinishSignUp :: Laundry</title>
  		
	<link rel="stylesheet" href="${cpath }/business/css/membership/businessFinishSignUp.css">
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
  	
</head>
<body>  	
<%@ include file="../main/businessHeader.jsp"%>

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