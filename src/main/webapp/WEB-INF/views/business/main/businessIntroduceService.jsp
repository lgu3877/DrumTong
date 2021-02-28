<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- tag library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- capth -->
<c:set var="cpath">${pageContext.request.contextPath }</c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- global css -->
    <!-- 
     <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
     -->
 	<!-- header css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessAltHeader.css">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
	<!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- css -->
   	<link rel="stylesheet" href="${cpath }/business/css/businessIntroduction.css">

</head>
<body style="position: relative;">
	<!-- header(navbar) -->
	<%@ include file="businessAltHeader.jsp" %>
	
	
	<!-- section -->
	<div id="viewr-wrapper" class="viewer_wrapper">
	
		<!-- down btn -->
		<div class="viewer_up top pointer bg_trans">
			<i class="fas fa-chevron-up"></i>
		</div>
		
		<!-- sliders -->
		<div id="viewer-container" class="viewer_con">
			<!-- content 01 -->
			<div class="viewer bg_red">
				<div class="image_01"></div>
				<div class="intro_01"></div>
			</div>
			<!-- content 02 -->
			<div class="viewer bg_mint">
				<div class="image_02"></div>
				<div class="intro_02"></div>
			</div>
			<!-- content 03 -->
			<div class="viewer bg_blue"></div>
			<!-- content 04 -->
			<div class="viewer bg_grey"></div>
		</div>
		
		<!-- up btn -->
		<div class="viewer_down bottom pointer bg_trans">
			<i class="fas fa-chevron-down"></i>
		</div>
		
		<!-- move to top -->
		<div class="move_top pointer invisible">
			<i class="far fa-arrow-alt-circle-up"></i>
		</div>
		
	</div>
	
	<!-- footer -->
	<%@ include file="businessFooter.jsp" %>
</body>

<script type="text/javascript" src="${cpath }/business/js/intropage.js"></script>

</html>