<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- selectEST.status 값을 status에 c:set 해줍니다 -->
<c:set var = "status" value="${selectEST.status}" />
<c:set var = "mainAddress" value="${selectEST.mainlocation}" />
<c:set var = "detailAddress" value="${selectEST.detaillocation}" />

<!DOCTYPE html>
 
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: Laundry</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- header css 처음 등록할 때 쓸 헤더입니다. ( status eq 'FAIL' )-->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
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
   	
   	<!-- Daum Map API -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- Kakao Map API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a8f343b25889960b1fdf777c9a2a57c&libraries=services,clusterer,drawing"></script>
</head>
     

<!-- body -->
<body>
	
	
	<!-- 	온라인 계약이 진행 중인 상태이면은 기본 헤더를 보여준다 -->
	<c:if test="${status eq 'FAIL' }">
		<%@ include file="../main/businessHeader.jsp" %>
	</c:if>
	
	<!-- side-header(navbar) -->
	<!-- 	온라인 계약이 수행되었다면 관리헤더와 관리서브메뉴를 보여준다. -->
	<c:if test="${status eq 'SUCCESS' }">
		<%@ include file="../main/businessSideHeader.jsp" %>
	</c:if>
	
	<!-- 섹션 -->
	<section>
	
		

	
	
		<!-- top-header(membership) -->
<!-- 	온라인 계약이 수행되었다면 관리헤더와 관리서브메뉴를 보여준다. -->
	<c:if test="${status eq 'SUCCESS' }">
		<%@ include file="../main/businessSubHeader.jsp" %>
	</c:if>
	
	<!-- 전체 폼 -->
	
<!-- 	[479줄] 닫는 태그 세션의 상태가 FAIL이면 POST 형식   -->
<!-- 	SUCCESS이면 REST형식으로 처리해준다. -->
<!-- 	[전체 폼]에 대한 c:if문 -->

	<c:if test="${status eq 'FAIL' }">
			<form method="POST" enctype="multipart/form-data">
	</c:if>
		
		<!-- 매장 소개(사진 & 글) -->
		
		<div class="shop_introduction">
		
				
			<div class="shop_image_con">
			
			<!-- title -->	
				<div class="shop_info_title_con">
					<div>
						<span class="shop_info_title">매장 사진</span>
						<i id="photo-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
						<div id="photo-help-msg"></div>
					</div>
					
				<!-- cover button -->
				<!-- status 가 SUCCESS일때만 버튼이 생성된다. ( Rest를 위한 버튼 ) -->
				<c:if test="${status eq 'SUCCESS' }">
					<div class="service_button_con">
						<div id="update-intro-btn" class="update_image_btn_con" onclick="updatePhoto()">
							<div class="add_menu_icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="add_menu_btn_title">사진 변경</div>
						</div>
					</div>
				</c:if>
				
				</div>
				
			<!-- cover-image input form -->
				<div id="shop-image-view" class="shop_image_view">
					<div class="upload_icon_con">
						<div class="cover_file_text_con">
							<div class="cover_file_text">
								<p>
									기존에 등록된 사진이 있다면, <br>
									클릭 후 미리보기로 확대해 볼 수 있습니다.<br>
									사진을등록하지 않으셨다면, <br>
									아래 추가하기 버튼을 통해 사진을 추가해주세요.
								</p>
							</div>
						</div>
					</div>
				</div>
				
			<!-- image viewer as long as cover image is already uploaded when you visit this page for modification -->
				<div id="main-image-con" class="main_image_con">
					<img id="main-image" class="shop_image_view">	
				</div>
				
			<!-- Sub Slider -->
				<div style="position: relative;">
					<ul id="image-preview" class="shop_image_slider">
						<li id="cover-image-con" class="shop_picture">
							<img id="cover-image" src="${cpath }/resources/business/img/slide/laundry1_01.jpg" alt="">
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
						name="delegatephotoboolean" onchange="imageCheck(event)"
						style="display: none;" accept=".png, .jpg, .jpeg" >
					<label for="update-cover"> <span style="margin-right: 10px">커버
							사진 바꾸기 <i class="far fa-images"></i>
					</span>
					</label>
					
					<!-- 이곳에 자동 input & label 생성 --> 
					
				</div>
				
			</div>
		<!-- Text Introduction -->
		
		<div class="shop_text_intro_con">
			
			<!-- title -->
				<div class="shop_info_title_con">
					<div style="display: flex;">
						<span class="shop_info_title">소개글</span>
						<i id="intro-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
						<div id="intro-help-msg"></div>
					</div>
					<!-- status 가 SUCCESS일때만 버튼이 생성된다. ( Rest를 위한 버튼 ) -->
				<c:if test="${status eq 'SUCCESS' }">
					<div class="service_button_con">
						<div id="add-cover-btn" class="update_image_btn_con" onclick="updateIntro()">
							<div class="add_menu_icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="add_menu_btn_title">작성 완료</div>
						</div>
					</div>
				</c:if>
				</div>
			
			<!-- text content -->
				<div class="shop_text_intro">
					<p id="intro-text" class="shop_text_view">
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
			
		</div>


		<!-- 서비스 메뉴 뷰(등록된 서비스 메뉴) -->
	<!-- status 가 SUCCESS일때만 등록된 서비스메뉴 영역이 생성된다. ( Rest를 위한 영역 ) -->
	<c:if test="${status eq 'SUCCESS' }">
		<div class="current_menu_con">

			<!-- title -->
			<div class="shop_info_title_con">
				<div>
					<span class="shop_info_title">등록된 서비스 메뉴</span> 
					<i id="update-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
					<div id="update-help-msg"></div>
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
		</c:if>
		</div>
	

		<!-- 서비스 메뉴 생성(서비스 등록) -->
		
		<div class="create_menu_con">
		

		<!-- title -->
			<div class="shop_info_title_con">
				<div>
					<span class="shop_info_title">서비스 등록</span>
					<i id="post-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
					<div id="post-help-msg"></div>
				</div>
			<!-- 버튼 -->
				<div class="service_button_con">
				<!-- 배달 서비스 활성화 -->
					<div id="delivery-btn" class="delivery_menu_btn_con" onclick="activateVisualization()">
						<div class="add_menu_icon_con">
							<i id="delivery-icon" class="fas fa-toggle-off"></i>
						</div>
						<div class="add_menu_btn_title">퀵 서비스</div>
					</div>
				<!-- 메뉴 추가 -->	
					<div id="add-item-btn" class="add_menu_btn_con">
						<div class="add_menu_icon_con">
							<i class="fas fa-plus-square"></i>
						</div>
						<div class="add_menu_btn_title">메뉴 추가</div>
					</div>
					
					<!-- complete button -->
					<!-- status 가 SUCCESS일때만 버튼이 생성된다. ( Rest를 위한 버튼 ) -->
					<c:if test="${status eq 'SUCCESS' }">
					<div id="update-item-btn" class="complete_menu_btn_con" onclick="addService()">
						<div class="add_menu_icon_con">
							<i class="fas fa-check-square"></i>
						</div>
						<div class="add_menu_btn_title">등록 완료</div>
					</div>
					</c:if>
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
						<!-- POST 형식일 때만 확인 버튼을 활성화 시켜준다.	-->
						<c:if test="${status eq 'FAIL' }">
							<li class="service_confirm">확인</li>
						</c:if>
						
						<li class="service_cancle">삭제</li>
					</ul>
				</div>

				<div id="add-item-list" class="add_item_list">
					<div class="single_item_selector">
						<div class="first_item_prop">
						<!-- BManagementVO > maincategory -->
							<select id="main-category" class="service_selector" name="maincategory" onchange="selectOption(this)">
								<option hidden="true" disabled selected>서비스 타입 선택</option>
								<option value="selectedDirect" class="selectedDirect">직접입력</option>
							</select>
							<!-- 직접입력 선택시 -->
							<input type="text" class="direct_type_input" name="maincategory" placeholder="서비스 입력" style="display: none">
						</div>
						
						<div class="second_item_prop">
						<!-- BManagementVO > subcategory -->
							<select id="sub-category" class="service_selector" name="subcategory" onchange="selectOption(this)">
								<option hidden="true" disabled selected>세부 서비스 유형 선택</option>
								
							<!--	
								<option value="">type1</option>
								<option value="">type2</option>
								<option value="">type3</option>
								<option value="">type4</option>
								<option value="">type5</option>
							-->
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
		
		
		
		
		<!-- 상품 수령 방법(세탁물 수령 방법) -->
		
		
		<div class="return_menu_con">
		

		<!-- 목차 -->
			<div class="shop_info_title_con">
				<div>
					<span class="shop_info_title">세탁물 수령 방법</span>
					<i id="return-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
					<div id="return-help-msg"></div>
				</div>
			<!-- 버튼 -->
				<div class="service_button_con">
					<!-- status 가 SUCCESS일때만 버튼이 생성된다. ( Rest를 위한 버튼 ) -->
					<c:if test="${status eq 'SUCCESS' }">
					<div id="complete-return-option" class="complete_menu_btn_con"  onclick="updateDelivery()">
						<div class="add_menu_icon_con">
							<i class="fas fa-check-square"></i>
						</div>
						<div class="add_menu_btn_title">수정 완료</div>
					</div>
					</c:if>
				</div>
			</div>
			
			
		<!-- 수취 선택 -->
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


		</div>
		
	
	<!-- 주소 확인 & 변경 -->
		<div class="address_update_con">		
			<div class="shop_info_title_con">
				<div>
					<span class="shop_info_title">매장 주소</span>
					<i id="address-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
					<div id="address-help-msg"></div>
				</div>
			<!-- 버튼 -->
				<div class="service_button_con">
					<div id="complete-address-option" class="complete_menu_btn_con"  onclick="updateAddress()">
						<div class="add_menu_icon_con">
							<i class="fas fa-check-square"></i>
						</div>
						<div class="add_menu_btn_title">변경 완료</div>
					</div>
				</div>
			</div>
			
		<!-- 주소지 변경 -->
			<div class="address_input_con form">
				<div class="address_wrapper">
					<h3>주소</h3>
					<div class="main_address_input_wrapper">
						<input id="main-address" class="main_address_input" type="text" name="mainlocation" value="${mainAddress }" 
							onfocus="openAddressSearch()">
						<input id="main-location" type="hidden" name="maplocation">
						<button class="address_search_button" onclick="openAddressSearch()">주소 찾기</button>
					</div>
					<h3>상세주소</h3>
					<div class="detail_address_input_wrapper">
						<input id="detail-address" class="detail_address_input" type="text" name="detaillocation" value="${detailAddress }">
					</div>
				</div>
				<div class="preview_wrapper">
					<h3>입력한 주소</h3>
					<div id="preview-map" class="location_preview"></div>
				</div>
			</div>
		</div>
		
		
		
	<!-- [50줄] 여는 태그  세션의 상태가 FAIL이면 POST 형식   -->
	<!-- 	SUCCESS이면 REST형식으로 처리해준다. -->
	<!-- 	[전체 폼]에 대한 c:if문 -->
	
		<c:if test="${status eq 'FAIL' }">
	<!-- 전체 form submit -->
			<div>
				<input type="submit" value="입력 완료">
			</div>
			</form>

		</c:if>
		
		
	
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
<<<<<<< HEAD

	<script type="text/javascript">
		// DB에서 받아오는 Defaultcategory List<String> 배열
		let defaultCategory = ${defaultcategory};
		let menuCategories = ${menuCategories};
		console.log(menuCategories);
	</script>
=======
>>>>>>> branch 'master' of https://github.com/lgu3877/DrumTong/
	<!-- 초기 셋팅 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementOnLoad.js"></script>
	
	<!-- 이미지 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementImage.js"></script>

	<!-- 소개글 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementIntroText.js"></script>

	<!-- 서비스 매뉴 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementMenuList.js"></script>

	<!-- 서비스 메뉴 옵션 -->
	<script type="text/javascript">
		// DB에서 받아오는 Defaultcategory List<String> 배열
		const defaultCategory = ${defaultcategory};
		const menucategories = ${menuCategories};
		const bImageList = ${bImageList};
		console.log(bImageList);
		console.log(defaultCategory);
		console.log(menuCategories);
		
		
		/* const object = new Object();
		for (let i = 0; i < defaultCategory.length; i++) {
			const mainOption = defaultCategory[i];
			const subOption = subCategory[defaultCategory[i]];
			
			// object 정의
			object[mainOption] = subOption !== undefined ? subOption : "값 없음";		
		} */
		
		createOptions(menuCategories); // MenuList > Dropdown category
	</script>

	<!-- 배달 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementReturnItem.js"></script>
	
	<!-- 도움말 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementHelpMsg.js"></script>
	
	<!-- 주소 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementAddress.js"></script>	
	
	<!-- 비동기 update (Axios) -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementUpdate.js"></script>
	
</body>
</html>