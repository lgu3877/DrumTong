<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>businessContaract :: Laundry</title>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css"> 
    <link rel="stylesheet" href="${cpath }/business/css/contract/businessContract.css"> 
     	
    <!-- Font -->
   <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
<!-- 	businessContract2.jsp -> 주소 확인 -->
<%@ include file="/resources/daumAddressSearch/daumAddressSearch.jsp" %>
</head>
<body>

    <%@ include file="../main/businessHeader.jsp" %>

	<div class="contract-all-container">
	
	<div id="contract-page">
		<h1>온라인 계약</h1>
	</div>	
	<div  class="contract-container">	
		<div id="iconDiv">
			<i class="fas fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
		</div>
    	<form action="" method="post" class="contract-form" onsubmit="contract4Check()"
    		enctype="multipart/form-data">
        	<%@ include file="./businessContract1.jsp" %>
        	<%@ include file="./businessContract2.jsp" %>
        	<%@ include file="./businessContract3.jsp" %>
        	<%@ include file="./businessContract4.jsp" %>
        	
     
        	<input type="hidden" value="businessInformationImage" name="saveType"/>
    	</form>
    </div>
    

    
	</div>
<script type="text/javascript" src="${cpath }/business/js/contract/businessContract.js"></script>

</body>
</html>