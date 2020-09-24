<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>customerMain :: Laundry</title>
  	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
</head>
<body>
	
	<header>
		<div style="width: 20%; height: 100%;" class="marginzero inlineBlock">
			<img src="${cpath}/resources/business/img/laundry.png" style="height: 100%;">
		</div>
		<div style="width: 40%;" class="marginzero inlineBlock"></div>
		
		<!-- 매장선택 -->
		<!-- 나중에 리스트 받아와서 반복문 돌리자 -->
		<div class="marginzero inlineBlock" style="float: right;">
			<div style="margin: auto">
			<select>
				<option>매장선택</option>
				<option>A</option>
				<option>B</option>
				<option>C</option>
			</select>
			<button onclick="#">개인정보수정</button>
			</div>
		</div>
		
			
	</header>
	
