<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<c:choose>
	<c:when test="${empty bLogin }">
		<c:set var="preLink" value="membership/businessLogin/"/>
		<c:set var="preBtName" value="로그인하기" />
		<c:set var="preStatus" value="isNotLogin"/>
	</c:when>
	<c:when test="${selectEST == '' || empty selectEST}">
		<c:set var="preLink" value="contract/businessContract/"/>
		<c:set var="preBtName" value="온라인 계약하기" />
		<c:set var="preStatus" value="isNotContract"/>
	</c:when>
	<c:when test="${selectEST.status=='FAIL' }">
		<c:set var="preLink" value="mainmanagement/businessShopManagement/"/>
		<c:set var="preBtName" value="매장 등록" />
		<c:set var="preStatus" value="${selectEST.status }"/>
	</c:when>
	<c:when test="${selectEST.status=='PROCESS' }">
		<c:set var="preLink" value="mainmanagement/businessScheduleManagement/"/>
		<c:set var="preBtName" value="일정 등록" />
		<c:set var="preStatus" value="${selectEST.status }"/>
	</c:when>
	<c:when test="${selectEST.premiumboolean=='N' }">
		<c:set var="preLink" value="contract/businessPremiumAd/"/>
		<c:set var="preBtName" value="프리미엄 광고" />
		<c:set var="preStatus" value="${selectEST.status }"/>
	</c:when>
	<c:otherwise>
		<c:set var="preLink" value=""/>
		<c:set var="preBtName" value="Finish" />
		<c:set var="preStatus" value="${selectEST.status }"/>
	</c:otherwise>
</c:choose>
<!DOCTYPE html>
 
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
   <!-- title -->
     <title>businessMain :: Laundry</title>
     
    <!-- global css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <!-- header css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <!-- inner login css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css">         
   
   <!-- Font -->
   <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   <!-- icon -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   <!-- css -->
   <link rel="stylesheet" href="${cpath }/business/css/businessMainPreview.css">
   <link rel="stylesheet" href="${cpath }/business/css/businessInnerNav.css">
   <link rel="stylesheet" href="${cpath }/business/css/businessModal.css">
   
   <!-- Axios -->
   <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>     
     



<!-- body -->
<body onload="javascript:openPopup('${cpath}/business/mainCover/')">	<!-- popup(1) 팝업 동작순서 -->
	
	<!-- header(navbar) -->
	<%@ include file="businessHeader.jsp" %>
	<input type="hidden" style="display: none" id="bpersonid" value="${bLogin.bpersonid }">
	<!-- section -->
	<section>
		<!-- Preview -->
		<%@ include file="businessMainPreview.jsp" %> 
	
		<!-- Inner Navigation -->
		<%@ include file="businessInnerNav.jsp" %>

		<!-- slider -->
		<div style="width: 100%; height: 30%; margin-top: 10px">
			<div class="marginzero inlineBlock slide" style="position:relative ;width: 50%;height: 100%; background-color: yellow; float: left;" id="slideDiv">
				<img src="${cpath }/resources/business/img/slide/laundry1_02.jpg" class="item">
				<img src="${cpath }/resources/business/img/slide/laundry1_03.jpg" style="display: none" class="item">
				<img src="${cpath }/resources/business/img/slide/laundry1_04.jpg" style="display: none" class="item">
				<img src="${cpath }/resources/business/img/slide/laundry1_05.jpg" style="display: none" class="item">
				<img src="${cpath }/resources/business/img/slide/laundry1_06.jpg" style="display: none" class="item">	
				<img id="prevBtn" style="position: absolute; width: 10%; top: 40%; left: 0; z-index: 9999; display: none" src="${cpath }/resources/business/img/arrow/prev_button.png" onclick="prevButton()">
				<img id="nextBtn" style="position: absolute; width: 10%; top: 40%; right: 0; z-index: 9999; display: none" src="${cpath }/resources/business/img/arrow/next_button.png" onclick="nextButton()">			
			</div>
		
		<!-- Login Include -->
		<%@ include file="businessMainLogin.jsp" %> 
		
		</div>

	</section>
		
	<!-- footer -->
	<%@ include file="businessFooter.jsp" %>
	
	<!-- 온라인 계약 모달(다시 쓰기, 어서쓰기) -->

	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
			</div>
			<div class="modal-body">
<!-- 				<p>전에 작성하신 입력 정보(매장관리)가 남아있습니다.</p> -->
<!-- 				<p>입력하신 정보를 저장하고, 매장 일정관리 페이지에서 이서서 작성하시겠습니까?</p> -->
			</div>
			<div class="modal-footer">
				<button class="btn_blue">
<!-- 				처음부터 다시 작성하기 -->
				</button>
				<button class="btn_red">
<!-- 				이어서 작성하기 -->
				</button>				
			</div>
		</div>
	</div>
	<script type="text/javascript">
  		 let preLink = '${preLink}';
  		 let preBtName = '${preBtName}';
  		 let preStatus = '${preStatus}';
  		 
  		 let ModalCheck = '${ModalCheck}';
  		 
	</script>
	<!-- main cover(slider) -->
	<script type="text/javascript" src="${cpath }/business/js/main.js"></script>
<!-- 	모달창 띄우기(영경&건욱) -->
	<script type="text/javascript" src="${cpath }/business/js/modal.js"></script>
	   <!-- main cover cookie -->
   
   <script type="text/javascript"> 
// 	 console.log('estid : ', document.querySelector('#bpersonid').value);s
   	 
     function getCookie(name) { 
        var cookie = document.cookie;
        
        // 하루동안 보지 않기를 선택하면 cookiePause = N 으로 출력된다
        if (cookie !== "") { 
           var cookie_array = cookie.split("; ");
           for ( var index in cookie_array) { 
              var cookie_name = cookie_array[index].split("=");
              if (cookie_name[0] == "cookiePause") { 
                 return cookie_name[1]; 
                 } 
           }
        }
     } 


     function openPopup(url) { // popup(2) : 팝업 동작순서
        var cookieCheck = getCookie("cookiePause");
        
        // mainCover.jsp - closePopup 명령어 참조
        if (cookieCheck != "N" && document.querySelector('#bpersonid').value != '')	// 쿠키에 값이 "N"이라고 들어가 있지 않을때와 로그인이 안되었을 때에는 비활성화
           window.open(url, '', 'width=960,height=640,left=0,top=0'); // 팝업창을 윈도우에서 열어주는 명령어	-> url :  popup(1) 팝업 동작순서
        }
     </script>
</body>
</html>