<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
 
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: Laundry</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- content css -->
	<link rel="stylesheet" href="${cpath }/business/css/management/businessShopManagement.css">

	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   	
   	<!-- jQuery -->
   	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
     

<!-- body -->
<body>
	
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
		<!-- top-header(membership) -->
		<%@ include file="../main/businessSubHeader.jsp" %>
		
		<div class="shop_introduction">
			<div class="shop_image_con">
			
			<!-- Main Slider -->
				<form class="shop_image_view">
					<div class="upload_icon_con">
						<label for="cover-img-upload" class="upload_link">
							<i class="fas fa-upload fa-3x"></i>
						</label>
						<div class="cover_file_text_con">
							<div class="cover_file_text">매장 대표사진 업로드</div>
							<input id="file-name" class="upload_file_name" type="text" readonly disabled
								onchange='checkFile()'>
							<input id="cover-img-upload" class="upload_file_input" type="file" 
								onchange="javascript:document.getElementById('file-name').value=this.value">
						</div>
					</div>
				<!-- test image 
					<img src="${cpath }/resources/business/img/laundry1_02.jpg" alt="">
				 -->
				</form>
			
			<!-- Sub Slider -->
				<div style="position: relative;">
					<ul id="image-preview" class="shop_image_slider">
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_02.jpg" alt="">
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_03.jpg" alt="">
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_04.jpg" alt="">
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_02.jpg" alt="">
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_03.jpg" alt="">
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_04.jpg" alt="">
						</li>
					</ul>

				<!-- Slide Move Button -->
					<div class="slide_btn">
   	        			<a class="prev">&#10094;</a>
       	    			<a class="next">&#10095;</a>
       				</div>	
       						
        		</div>
			</div>
			
		<!-- Text Introduction -->
			<div class="shop_text_intro_con">
				<div class="shop_text_intro">
					<p>매장 소개글</p>
					<p></p>
				</div>
			</div>
		 	
		</div>
		
	</section>
		
	<!-- footer -->
	<%@ include file="../main/businessFooter.jsp" %>
	
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagement.js"></script>

</body>
</html>