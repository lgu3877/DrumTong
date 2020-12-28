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
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
     

<!-- body -->
<body>
	
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- 섹션 -->
	<section>
		<!-- top-header(membership) -->
		<%@ include file="../main/businessSubHeader.jsp" %>
		
	<!-- 전체 폼 -->
	<form method="POST">
	<!-- <div> -->
		<!-- 매장 소개(사진 & 글 -->
		<div class="shop_introduction">
			<!-- <form class="shop_image_con" method="POST"> -->					
			<div class="shop_image_con">
			<!-- title -->	
				<div class="shop_info_title_con">
					<div>
						<span class="shop_info_title">매장 사진</span>
						<i id="photo-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
						<div id="photo-help-msg"></div>
					</div>
				<!-- 사진 변경 버튼 -->
					<div class="service_button_con">
						<div id="add-cover-btn" class="update_image_btn_con">
							<div class="add_menu_icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="add_menu_btn_title">사진 변경</div>
						</div>
					</div>
				</div>
				
			<!-- cover-image input form -->
				<div id="shop-image-view" class="shop_image_view">
					<div class="upload_icon_con">
						<div class="cover_file_text_con">
						<!-- select cover image -->
							<div class="cover_file_text">
								<p>
									대표사진이 등록되어 있지 않습니다.<br>
									사진을 등록해 사장님 가게를 소개해보세요.
								</p>
							</div>
						<!-- cover image name view -->	
							<input id="file-name" class="upload_file_name" type="text" readonly disabled onchange='return checkFile()' placeholder="선택한 사진 이름이 이곳에 나타납니다.">						 		
						</div>
					</div>
				</div>
			
			<!-- image viewer as long as cover image is already uploaded when you visit this page for modification -->
				<div id="main-image-con" class="main_image_con">
					<img id="main-image">
				</div>
				
			<!-- Sub Slider -->
				<div style="position: relative;">
					<ul id="image-preview" class="shop_image_slider">
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/slide/laundry1_01.jpg" alt="">
							<i class="fas fa-times"></i>
							<i class="fas fa-star"><span>대표사진</span></i>
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/slide/laundry1_02.jpg" alt="">
							<i class="fas fa-times"></i>
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/slide/laundry1_03.jpg" alt="">
							<i class="fas fa-times"></i>
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/slide/laundry1_04.jpg" alt="">
							<i class="fas fa-times"></i>
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/slide/laundry1_05.jpg" alt="">
							<i class="fas fa-times"></i>
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/slide/laundry1_06.jpg" alt="">
							<i class="fas fa-times"></i>
						</li>
					</ul>

				<!-- Slide Move Button -->
					<div class="slide_btn">
   	        			<a class="prev">&#10094;</a>
       	    			<a class="next">&#10095;</a>
       				</div>	
       						
        		</div>
        		
			<!-- add new photo -->
				<div id="photo-modal-btn" class="photo_add_con">
					<!-- change cover -->
					<input id="update-cover" class="add_photo_input" type="file"
						name="" onchange="imageCheck('add-photo')" style="display: none;">
					<label for="update-cover"> <span style="margin-right: 10px">커버
							사진 바꾸기 <i class="far fa-images"></i>
					</span>
					</label>
					<!-- add store image -->
					<input id="add-photo" class="add_photo_input" type="file" name=""
						onchange="imageCheck('add-photo')" style="display: none">
					<label for="add-photo"> <span>새로운 사진 추가하기 <i
							class="far fa-images"></i>
					</span>
					</label>
				</div>
			</div>
			<!-- </form> -->
			
		<!-- 매장 소개글 -->
			<!-- <form class="shop_text_intro_con" method="POST"> -->
			<div class="shop_text_intro_con">
			
			<!-- title -->
				<div class="shop_info_title_con">
					<div>
						<span class="shop_info_title">매장 소개글</span>
						<i id="intro-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
					</div>
				</div>
			
			<!-- text content -->
				<div class="shop_text_intro">
					<p class="shop_text_view">
						이곳은 당신이 작성한 매장 소개글을 확인할 수 있는 칸입니다. 작성한 글이 마음에 들지 않을 경우 아래 '작성하기'버튼을 통해 기존에 작성하신 글을 수정하시거나 새로운 내용의 소개글을 작성하실 수 있습니다.
					</p>
				</div>

			<!-- add store introduction -->
				<div id="intro-modal-btn" class="intro_add_con">
       				<span>매장 소개글 등록 및 수정
       					<i class="far fa-file-alt"></i>
       				</span>
       			</div>
			</div>
			<!-- </form> -->
		</div>


		<!-- 서비스 메뉴 뷰(등록된 서비스 메뉴) -->
		<!-- <form class="current_menu_con" method="POST"> -->	
		<div class="current_menu_con">

			<!-- title -->
			<div class="shop_info_title_con">
				<div>
					<span class="shop_info_title">등록된 서비스 메뉴</span> 
					<i id="update-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
				</div>
				<div class="service_button_con">
					<!-- modify button -->
					<div id="update-list-btn" class="add_menu_btn_con">
						<div class="add_menu_icon_con">
							<i class="fas fa-plus-square"></i>
						</div>
						<div class="add_menu_btn_title">메뉴 수정</div>
					</div>
					<!-- complete button -->
					<div id="complete-list-btn" class="complete_menu_btn_con">
						<div class="add_menu_icon_con">
							<i class="fas fa-check-square"></i>
						</div>
						<div class="add_menu_btn_title">수정 완료</div>
					</div>
				</div>
			</div>

			<div class="current_menu">

			<!-- empty table -->
				 <table class="current_menu_table form">
					<!-- thead -->
					<thead>
						<tr>
							<th scope="cols">서비스 유형</th>
							<th scope="cols">서비스 타입</th>
							<th scope="cols">세부 내용</th>
							<th scope="cols">가격</th>
							<th scope="cols">소요시간</th>
							<th scope="cols">기타</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" class="even" colspan="6" style="text-align: center">
								등록된 상품 목록이 없습니다.<br>
								아래 [서비스 등록] 항목에서 서비스 등록이 필요합니다.	
							</th>
						</tr>
					</tbody>
				</table>
				
			<!-- registered table -->
				<table class="current_menu_table form">
				<!-- thead -->
					<thead id="item-list-thead">
						<tr>
							<th scope="cols">서비스 유형</th>
							<th scope="cols">서비스 타입</th>
							<th scope="cols">세부 내용</th>
							<th scope="cols">가격</th>
							<th scope="cols">소요시간</th>
						</tr>
					</thead>
					
				<!-- tbody -->
					<tbody id="item-list-tbody">
						<tr>
							<th scope="row">서비스1</th>
							<td>내용1</td>
							<td>내용2</td>
							<td>내용3</td>
							<td>내용4</td>
						</tr>
						<tr>
							<th scope="row" class="even">서비스2</th>
							<td class="even">내용1</td>
							<td class="even">내용2</td>
							<td class="even">내용3</td>
							<td class="even">내용4</td>
						</tr>
						<tr>
							<th scope="row">서비스3</th>
							<td>내용1</td>
							<td>내용2</td>
							<td>내용3</td>
							<td>내용4</td>
						</tr>
						<tr>
							<th scope="row" class="even">서비스4</th>
							<td class="even">내용1</td>
							<td class="even">내용2</td>
							<td class="even">내용3</td>
							<td class="even">내용4</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- </form> -->


		<!-- 서비스 메뉴 생성(서비스 등록) -->
		<!-- <form class="create_menu_con" method="POST"> -->	
		<div class="create_menu_con">

		<!-- title -->
			<div class="shop_info_title_con">
				<div>
					<span class="shop_info_title">서비스 등록</span>
					<i id="post-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
				</div>
			<!-- add button -->
				<div class="service_button_con">
					<div id="add-item-btn" class="add_menu_btn_con">
						<div class="add_menu_icon_con">
							<i class="fas fa-plus-square"></i>
						</div>
						<div class="add_menu_btn_title">메뉴 추가</div>
					</div>
					<!-- complete button -->
					<div id="update-item-btn" class="complete_menu_btn_con">
						<div class="add_menu_icon_con">
							<i class="fas fa-check-square"></i>
						</div>
						<div class="add_menu_btn_title">목록 추가</div>
					</div>
				</div>
			</div>

			<div class="create_menu form">
			
			
			<!-- item customizing -->
				
			<!-- head -->
				<div style="display: block">
					<ul class="customize_menu_head">
						<li class="service_main">서비스 유형</li>
						<li class="service_sub">서비스 타입</li>
						<li class="service_details">세부 내용</li>
						<li class="service_price">가격(원)</li>
						<li class="service_time">소요시간</li>
						<li class="service_cancle">삭제</li>
					</ul>
				</div>

				<div id="add-item-list" class="add_item_list">
					<div class="single_item_selector">
						<div class="first_item_prop">
						<!-- BManagementVO > maincategory -->
							<select class="service_selector" name="maincategory" onchange="directType(this)">
								<option hidden="true" disabled selected>서비스 타입 선택</option>
								<option value="type1">type1</option>
								<option value="type2">type2</option>
								<option value="type3">type3</option>
								<option value="type4">type4</option>
								<option value="type5">type5</option>
								<option value="selectedDirect" class="selectedDirect">직접입력</option>
							</select>
							<!-- 직접입력 선택시 -->
							<input type="text" class="direct_type_input" name="maincategory" placeholder="서비스 입력" style="display: none">
						</div>
						
						<div class="second_item_prop">
						<!-- BManagementVO > subcategory -->
							<select class="service_selector" name="subcategory" onchange="directType(this)">
								<option hidden="true" disabled selected>세부 서비스 유형 선택</option>
								<option value="">type1</option>
								<option value="">type2</option>
								<option value="">type3</option>
								<option value="">type4</option>
								<option value="">type5</option>
								<option value="selectedDirect" class="selectedDirect">직접입력</option>
							</select>
							<!-- 직접입력 선택시 -->
							<input type="text" name="subcategory" class="direct_type_input" placeholder="서비스 입력" style="display: none">
						</div>
						
						<div class="third_item_prop">
						<!-- BManagementVO > name -->
							<input type="text" class="service_detail_input" name="name" placeholder="세부 서비스 내용을 입력해주세요.">
						</div>

						<div class="forth_item_prop">
						<!-- BManagementVO > price -->
							<input type="text" class="service_price_input" name="price" placeholder="서비스 가격(원)">
						</div>

						<div class="fifth_item_prop">
						<!-- BManagementVO > ete -->
							<input type="text" class="service_time_input" name="ete" placeholder="서비스 소요시간">
						</div>

						<div class="cancle_listing" onclick="dismissInput(this.parentNode)">
							<i class="fas fa-times"></i>
							<span>취소</span>
						</div>
						
					</div>
					
				</div>
				
			</div>
		</div>
		<!-- </form> -->
		
		<!-- 상품 수령 방법(세탁물 수령 방법) -->
		<!-- <form class="return_menu_con" method="POST"> -->
		<div class="return_menu_con">

		<!-- 목차 -->
			<div class="shop_info_title_con">
				<div>
					<span class="shop_info_title">세탁물 수령 방법</span>
					<i id="return-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
				</div>
			<!-- 버튼 -->
				<div class="service_button_con">
					<div id="modify-return-option" class="add_menu_btn_con">
						<div class="add_menu_icon_con">
							<i class="fas fa-plus-square"></i>
						</div>
						<div class="add_menu_btn_title">수정 하기</div>
					</div>
					<div id="complete-return-option" class="complete_menu_btn_con">
						<div class="add_menu_icon_con">
							<i class="fas fa-check-square"></i>
						</div>
						<div class="add_menu_btn_title">수정 완료</div>
					</div>
				</div>
			</div>
			
		<!-- 수취 선택 -->
			<!-- <form class="return_menu"> -->
			<div class="return_menu">
				<ul>
					<li onclick="checkContent(this)">
					<!-- BManagementVO > deliveryboolean -->
						<input class="returnOptions" type="checkbox" name="quickboolean"> 
						<i class="fas fa-window-close"></i>
						<span>배달 대행업체 이용</span>
					</li>
					<!-- BManagementVO > quickboolean -->
					<li onclick="checkContent(this)">
						<input class="returnOptions" type="checkbox" name="deliveryboolean">
						<i class="fas fa-window-close"></i>
						<span>배달 서비스 제공</span>
					</li>
				</ul>
			</div>
			<!-- </form> -->
		</div>
		<!-- </form> -->
		
		<!-- 전체 form submit -->
		<div>
			<input type="submit" value="입력 완료">
		</div>
		
	</form>
	</section>
		
		
<!-- footer -->
	<%-- <%@ include file="../main/businessFooter.jsp" %> --%>

<!-- Modal  -->
	<div id="intro-modal" class="intro_modal">
	<!-- Modal content -->
		<div class="intro_content_con">
			<span class="intro_close">&times;</span>
			<div class="intro_content">
			<!-- BManagementVO > introduction -->
				<textarea class="store_intro_input" name="introduction" maxlength="500" placeholder="매장 소개글을 적어주세요." autofocus style="resize: none;"></textarea>
				<input class="store_intro_btn" type="button" value="작성완료" onclick='comfirmIntro()' >
			</div>
		</div>
	</div>



	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementMenuList.js"></script>
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementOnLoad.js"></script>
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementImage.js"></script>
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementIntroText.js"></script>
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementReturnItem.js"></script>
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementHelpMsg.js"></script>
	
</body>
</html>