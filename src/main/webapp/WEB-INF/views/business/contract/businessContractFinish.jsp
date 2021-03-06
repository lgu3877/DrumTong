<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>businessContaract :: Finish</title>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css"> 
    <link rel="stylesheet" href="${cpath }/business/css/contract/businessContract.css"> 
     	
    <!-- Font -->
   <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
</head>
<body>

    <%@ include file="../main/businessHeader.jsp" %>

	<div class="contract-all-container">
		<div id="contract-page" class="contract-page">
			<h1>온라인 계약</h1>
		</div>	
		<div class="contract-container">
			<div id="iconDiv">
				<i class="far fa-circle fa-3x"></i>
				<i class="far fa-circle fa-3x"></i>
				<i class="far fa-circle fa-3x"></i>
				<i class="far fa-circle fa-3x"></i>
				<i class="fas fa-circle fa-3x"></i>
			</div>

			<div class="c-final">
				<div class="c-final-table">
					<div class="c-final-table-cell" style="">
						<h1 style="font-size: 28pt; text-align: center;">온라인 계약이	완료되었습니다</h1>
						<hr>
						<input class="input-cell" type="button" value="온라인 계약"
							onclick="location.href='${cpath }/business/mainmanagement/businessShopManagement/'">
						<input class="input-cell" type="button" value="사이트 메인" onclick="location.href='${cpath }/business/'">
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>