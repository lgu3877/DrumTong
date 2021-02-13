<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
 
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>customerDrumtong :: customerMenu</title>
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet" type="text/css">
    <link rel="stylesheet" href="${cpath }/customer/css/customerStyle.css">
    <link rel="stylesheet" href="${cpath }/customer/css/account/customerMenu.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<script type="text/javascript" src="${cpath }/customer/js/main/customerHeader.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://kit.fontawesome.com/7522a35233.js" crossorigin="anonymous"></script>
	 
</head>

<body>

<%@ include file="../main/customer_Header.jsp"%>

<!-- 본문 영역 -->
<section class="section-SangJae section-menu">

  <div class="userMenu-row">
    <div class="userMenu" onclick="location.href='${cpath }/customer/account/customerJoinChange/'">
      <i class="fas fa-portrait"></i>
      <div class="userMenu-context">
        <h2>사용자 정보 <i class="fas fa-chevron-right"></i></h2>
        회원정보 수정, 회원탈퇴
      </div>
    </div>
    
    
    <div class="userMenu" onclick="location.href='${cpath }/customer/account/customerPayAndCoupon/'">
      <i class="fas fa-portrait"></i>
      <div class="userMenu-context" id="userInfo">
        <h2>결제 및 쿠폰 <i class="fas fa-chevron-right"></i></h2>
        결제수단 등록, 쿠폰조회
      </div>
    </div>
    
    <div class="userMenu" onclick="location.href='#'">
      <i class="fas fa-portrait"></i>
      <div class="userMenu-context">
        <h2>알림 <i class="fas fa-chevron-right"></i></h2>
        알림설정
      </div>
    </div>
  </div>
  
  <div class="userMenu" onclick="location.href='${cpath }/customer/account/customerBookmark/'">
      <i class="fas fa-portrait"></i>
      <div class="userMenu-context">
        <h2>즐겨찾기 <i class="fas fa-chevron-right"></i></h2>
        즐겨찾기
      </div>
  </div>
  
  <div class="userMenu" onclick="location.href='${cpath }/customer/account/customerOrderList/'">
      <i class="fas fa-portrait"></i>
      <div class="userMenu-context">
        <h2>주문 목록 <i class="fas fa-chevron-right"></i></h2>
        주문 목록
      </div>
  </div>
  
  
  
</section>

<!-- 스크립트 영역 -->
<script></script>

<%@ include file="../main/customerFooter.jsp" %>

</body>
</html>