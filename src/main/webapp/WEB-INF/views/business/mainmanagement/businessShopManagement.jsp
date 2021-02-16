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
	<!-- header css 처음 등록할 때 쓸 헤더입니다. ( status ne 'SUCCESS' )-->
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
	
	<script type="text/javascript">
		const bImageList = ${bImageList};
		const bManagement = ${bManagement};
		const bMenu = ${bMenu};
		
		console.log(bImageList);
		
		const defaultCategory = ${defaultcategory};
		const menuCategories = ${menuCategories};
		
		const sido = ${sido};
		
// 		const initialAreas = ${deliveryAreas};
// 		const deliveryAreas = ${deliveryAreas};
		let deliveryAreas = ${deliveryAreas};
		const status = '${status}';
		console.log(status);
		console.log(deliveryAreas);
// 		let deliveryAreas = JSON.parse(JSON.stringify(initialAreas));
		console.log(deliveryAreas);
	</script>
</head>
     

<!-- body -->
<body>
	
	
	<!-- 	온라인 계약이 진행 중인 상태이면은 기본 헤더를 보여준다 -->
	<c:if test="${status ne 'SUCCESS' }">
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

	<c:if test="${status ne 'SUCCESS' }">
			<form method="POST" enctype="multipart/form-data">
	</c:if>
		
		<!-- 매장 소개(사진 & 글) -->
		
		<div class="shop_introduction">
		
			<input type="hidden" name="saveType" value="businessStoreImage">
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
				
			<!-- image viewer as long as cover image is already uploaded when you visit this page for modification -->
				<div id="main-image-con" class="main_image_con">
					<img id="main-image" class="shop_image_view">	
				</div>
				
			<!-- Sub Slider -->
				<div style="position: relative;">
				
				<!-- 이미지 슬라이더 -->
					<ul id="image-preview" class="shop_image_slider"></ul>


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
				<div class="shop_text_intro" id="introductionArea">
					<p id="intro-text" class="shop_text_view">
						이곳은 당신이 작성한 매장 소개글을 확인할 수 있는 칸입니다. 작성한 글이 마음에 들지 않을 경우 아래 '작성하기'버튼을 통해 기존에 작성하신 글을 수정하시거나 새로운 내용의 소개글을 작성하실 수 있습니다.
					</p>
				</div>

			<!-- add store introduction -->
				<div id="intro-modal-btn" class="intro_add_con" onclick="openIntroModal()">
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
					<div id="update-list-btn" class="add_menu_btn_con" onclick="modifyMenuService()">
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
							<th scope="cols">메뉴 이름</th>
							<th scope="cols">가격(배달비)</th>
							<th scope="cols">소요시간(시간)</th>
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
				
				<div id="posted-service-list" class="form"></div>
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
				<!-- 메뉴 추가 -->	
					<div id="add-item-btn" class="add_menu_btn_con" onclick="createAddService()">
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

			<!-- 메뉴 수정 모달 -->
			<div class="category_modal_btn" onclick="openCategoryModal()">카테고리 수정</div>
				
			<div class="create_menu form">
			<!-- head -->
				<div style="display: block">
					<ul class="customize_menu_head">
						<li class="service_main">서비스 유형</li>
						<li class="service_sub">서비스 타입</li>
						<li class="service_details">메뉴 이름</li>
						<li class="service_price">가격(배달비)</li>
						<li class="service_time">소요시간(시간)</li>
						<!-- POST 형식일 때만 확인 버튼을 활성화 시켜준다.	-->
						
						<c:if test="${status ne 'SUCCESS' }">
							<li class="service_confirm">확인</li>
						</c:if> 
						
						<li class="service_cancle">삭제</li>
					</ul>
				</div>

			<!-- 서비스 등록 input -->
				<div id="add-item-list" class="add_item_list"></div>
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
					<li id="agencies" onclick="checkContent(this)">
					<!-- BManagementVO > deliverytype > AGENCIES -->
						<input class="returnOptions" type="checkbox" name="deliverytype" value="AGENCIES"> 
						<i class="fas fa-window-close"></i>
						<span>배달 대행업체 이용</span>
					</li>
					<!-- BManagementVO > deliverytype > SELF -->
					<li id="self" onclick="checkContent(this)">
						<input class="returnOptions" type="checkbox" name="deliverytype" value="SELF" >
						<i class="fas fa-window-close"></i>
						<span>배달 서비스 제공</span>
					</li>
					<!-- BManagementVO > deliverytype > VISIT -->
					<li id="visit" class="disabled_checkbox">
						<input class="returnOptions" type="checkbox" name="deliverytype" value="VISIT">
						<i class="fas fa-window-close"></i>
						<span>방문수령</span>
					</li>
				</ul>
			</div>
		</div>
		


	<!-- 배달 지역 설정 및 수정 -->
		<div class="delivery_menu_con">
		<!-- 목차 -->
			<div class="shop_info_title_con">
				<div>
					<span class="shop_info_title">배달 지역 관리</span>
					<i id="delivery-help" class="far fa-question-circle" style="font-weight: 600">도움말</i>
					<div id="delivery-help-msg"></div>
				</div>
			<!-- 버튼 -->
				<div class="service_button_con">
					<!-- status 가 SUCCESS일때만 버튼이 생성된다. ( Rest를 위한 버튼 ) -->
					<c:if test="${status eq 'SUCCESS' }">
					<div class="complete_menu_btn_con"  onclick="updateDeliveryArea()">
						<div class="add_menu_icon_con">
							<i class="fas fa-check-square"></i>
						</div>
						<div class="add_menu_btn_title">수정 완료</div>
					</div>
					</c:if>
				</div>
			</div>
			
			
		<!-- 설정된 배달가능지역 보기  & 배달 지역 설정  -->
			
			<div class="delivery_menu">
				<!-- 접근 제한 뷰  [건욱] -->
				<div id="accessDenied" >
					해당 기능을 활성화 시키기 위해서는 <br> [세탁물 수령 방법] 기능에서 "배달 대행업체 이용" 혹은  "배달 서비스 제공" 중 <br> 하나의 기능이라도 체크가 되어있어야 합니다.
				</div>
				
			<!-- 배달가능지역 뷰 -->
				<div id="delivery-area-view" class="delivery_area_view_con"></div>
				
			<!-- 배달지역 입력 -->
				<div class="delivery_area_set_wrap form">
					<div class="delivery_area_set_con">
					<!-- 시/도 선택 -->
						<select id="major-area-selector" class="area_selector" name="sido" onchange="createMinorOptions()">
							<option hidden selected>시/도 선택</option>
						</select>
					<!-- 시/군/구 선택 -->
						<select id="minor-area-selector" class="area_selector" name="sigungu" onchange="createDetailOptions()">
							<option hidden selected>시/군/구 선택</option>
						</select>
					</div>
				<!-- 읍/면/동 선택 -->
					<div id="detail-area-selector" class="town_selector_con"></div>
				</div>
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
			<c:if test="${status eq 'SUCCESS' }">
				<div class="service_button_con">
					<div id="complete-address-option" class="complete_menu_btn_con"  onclick="updateAddress()">
						<div class="add_menu_icon_con">
							<i class="fas fa-check-square"></i>
						</div>
						<div class="add_menu_btn_title">변경 완료</div>
					</div>
				</div>
			</c:if>
			</div>
			
			
		<!-- 주소지 변경 -->
			<div class="address_input_con form" id="locationArea">
				<div class="address_wrapper">
					<h3>주소</h3>
					<div class="main_address_input_wrapper">
						<input id="main-address" class="main_address_input" type="text" name="mainlocation" value="${mainAddress }" 
							onfocus="openAddressSearch()">
						<input type="button" class="address_search_button" onclick="openAddressSearch()" value="주소 찾기">
					</div>
					<h3>상세주소</h3>
					<div class="detail_address_input_wrapper">
						<input id="detail-address" class="detail_address_input" type="text" name="detaillocation" value="${detailAddress }">
						<input id="latitude" type="hidden" name="latitude">
						<input id="longitude" type="hidden" name="longitude">
						<input id="town-code" type="hidden" name="emdcode">
					</div>
				</div>
				<div class="preview_wrapper">
					<h3>입력한 주소</h3>
					<div id="preview-map" class="location_preview"></div>
				</div>
			</div>
		</div>
		
<!-- footer -->
	<%-- <%@ include file="../main/businessFooter.jsp" %> --%>

<!-- Intro Modal  -->
	<div id="intro-modal" class="intro_modal">
	<!-- Modal content -->
		<div class="intro_content_con">
			<span class="intro_close" onclick="closeIntroModal()">&times;</span>
			<div class="intro_content">
			<!-- BManagementVO > introduction -->
				<textarea id="intro-modal-textarea" class="store_intro_input" name="introduction" maxlength="500" placeholder="매장 소개글을 적어주세요." autofocus style="resize: none;" maxlength="300"></textarea>
				<input class="store_intro_btn" type="button" value="작성완료" onclick='comfirmIntro()' >
			</div>
		</div>
	</div>

<!-- Category Modal  -->
	<div id="category_modal" class="category_modal" style="display: none;">
		<div class="category_modal_content">
			<span id="category-close">&times;</span>
			<div class="category_modal_title">
				메뉴를 수정하실 수 있습니다.
			</div>
			<div id="category-list" class="category_content">
				
			</div>
		</div>
	</div>

<!-- Modal > 서비스 메뉴 수정 -->
	<div id="modify-menu-modal" class="modify_menu_modal" style="display: none"></div>

		
	<!-- [50줄] 여는 태그  세션의 상태가 FAIL이면 POST 형식   -->
	<!-- 	SUCCESS이면 REST형식으로 처리해준다. -->
	<!-- 	[전체 폼]에 대한 c:if문 -->
	
		<c:if test="${status ne 'SUCCESS' }">
	<!-- 전체 form submit -->
			<div class="submit_con">
				<input class="submit_btn" id="submitbt" type="button" value="다음 단계로" onclick="checkExceptionBeforeSubmit()">
			</div>
			</form>

		</c:if>
		
		
	
	</section>
		
		
<!-- footer -->
	<%-- <%@ include file="../main/businessFooter.jsp" %> --%>
	
	
	<script type="text/javascript">
		//랜덤 String 생성
		function generateRandomString(length) {
			let result = "";
			const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
			const charArray = characters.split("");
				
			for (let i = 0; i < length; i++) {
				result += charArray[Math.ceil(Math.random() * (characters.length - 1))];
			}
			
			// 동일한 난수가 생성되엇을 경우(로또 맞을 확률)
			if (document.getElementById(result)) {
				alert("축하드립니다. 17,067,655,527,413,216e+89의 확률을 뚫으셨습니다.");
				location.reload();
				return;
			}
			
			return result;
		}
		
		// 가격에 콤마(,) 삽입
		function insertComma(string) {
			const reversedString = string.split("").reverse().join("");
			const commaAttached = reversedString.replace(/(.{3})/g,"$1,");
			
			const array = commaAttached.split("").reverse();
			
			if (array[0] === ",") {
				array.shift();
			}
			
			return array.join("");
		}
		
		// 객체 복사(deep copy)
		function deepCopyObject(object) {
			let clone = {};
			for (let key in object) {
				if( typeof (object[key]) == "object" && object[key] != null)
					clone[key] = deepCopyObject(object[key]);
				else
					clone[key] = object[key];
			}
			return clone;
		}
	</script>
	
	<!-- 예외 체크 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementExceptionCheck.js"></script>
	
	
	<!-- 이미지 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementImage.js"></script>

	<!-- 소개글 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementIntroText.js"></script>

	<!-- 서비스 매뉴(view) -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementMenuList.js"></script>

	<!-- 서비스 매뉴(input) -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementMenuRegister.js"></script>

	<!-- 배달 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementReturnItem.js"></script>

	<!-- 배달 지역 설정 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementDeliveryArea.js"></script>
	
	<!-- 도움말 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementHelpMsg.js"></script>
	
	<!-- 주소 -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementAddress.js"></script>	
	
	<!-- 비동기 update (Axios) -->
	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagementUpdate.js"></script>
	
	<script type="text/javascript">
	
		// [건욱] 함수를 실행했을 때 오류가 발생하면 사용자에게 오류 메시지를 반환하는 함수입니다.
		function  expressMessageOnTryCatch (functionList) {
			
			let errMSG = "";
			
			for (let key in functionList) {
				try {
					functionList[key];
				}
				catch (error) {
					switch (key) {
					
						case 'updatePhoto' : errMSG += "매장 사진 ";
							break;
							
						case 'updateIntro' : errMSG += "매장 소개글 ";
							break;
							
						case 'addService' : errMSG += "매장 메뉴 ";
							break;
							
						case 'updateDelivery' : errMSG += "배달 지역 ";
							break;
							
						case 'updateAddress' : errMSG += "매장 주소 ";
							break;
							
						case 'updateStatus' : errMSG += "매장 상태 ";
							break;
					}
				}
				
				
			}
			return (errMSG === "") ? "" : errMSG += "오류가 발생했습니다. 재시도 부탁드립니다.";
			
		}
			
		// [건욱]
		// errMSG에 값이 있을 경우에 경고창을 사용자에게 띄워주는 함수입니다.
		function expressAlert (errMSG) {
			if(errMSG !== ""){
				alert(errMSG); 
				return false;
			}
			
			return true;
				
		}
		
		function locationBoolean(result) {
			result ? location.href = "drumtong/business/mainmanagement/businessScheduleManagement/" : "";
		}
	
// 		// [건욱] 
		// PROCESS 일 때 수정된 데이터를 업데이트 시켜주는 함수.
		if(status === "PROCESS") {
			console.log('실행 프로세스');
			document.getElementsByClassName("submit_btn").onclick = function () {
				
				const functionList = {
						
						// 매장 사진 업데이트	
						"updatePhoto" : updatePhoto(),
						
						// 매장 소개글 업데이트
						"updateIntro" : updateIntro(),
						
						// 매장 메뉴 업데이트
						"addService" : addService(),
						
						// 배달 지역 업데이트
						"updateDelivery" : updateDelivery(),
						
						// 매장 주소 업데이트
						"updateAddress" : updateAddress(),
						
						// 매장 status 값 "SUCCESS" 업데이트 
						"updateStatus" : updateStatus(),
						
				}
				
				// 함수를 실행했을 때 오류가 발생하면 사용자에게 오류 메시지를 반환하는 함수입니다
				let errMSG = expressMessageOnTryCatch(functionList);
				
				// 알터창을 표출해줍니다.
				let result = expressAlert(errMSG);
				
				locationBoolean(result);
				
				
			}
		}
		
// 		function updateStatus() {
			
// 		}
	</script>
</body>
</html>