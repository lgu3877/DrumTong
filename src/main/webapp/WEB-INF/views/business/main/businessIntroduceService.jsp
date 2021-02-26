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
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
	<!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- css -->
   	<link rel="stylesheet" href="${cpath }/business/css/businessIntroduction.css">

</head>
<body style="position: relative;">
	<!-- header(navbar) -->
	<%@ include file="businessHeader.jsp" %>
	
	
	<!-- section -->
	<div class="viewer_wrapper">
		<div class="viewer_up">
		</div>
		<div id="viewer-container" class="viewer_con" style="position: relative;">
			<div class="viewer bg_red" style="position: absolute; top: 100vh; left: 0; transition: all 2s ease;"></div>
			<div class="viewer bg_mint" style="position: absolute; top: 100vh; left: 0; transition: all 2s ease;"></div>
			<div class="viewer bg_blue" style="position: absolute; top: 100vh; left: 0; transition: all 2s ease;"></div>
			<div class="viewer bg_grey" style="position: absolute; top: 100vh; left: 0; transition: all 2s ease;"></div>
		</div>
		<div class="viewer_down">
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="businessFooter.jsp" %>
</body>

<script type="text/javascript" src="${cpath }/business/js/intropage.js"></script>

</html>