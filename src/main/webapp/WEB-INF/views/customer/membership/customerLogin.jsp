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
    <title>customerDrumtong :: customerBoardRead</title>
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet" type="text/css">
    <link rel="stylesheet" href="${cpath }/customer/css/customerStyle.css">
    <link rel="stylesheet" href="${cpath }/customer/css/membership/customerMembership.css">
	
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<!-- Axios script -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<!-- javascript cpath -->
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		function getContextPath() {
		    return sessionStorage.getItem("contextpath");
		}
	</script>
    <!-- 스크립트 영역 -->
    <script type="text/javascript" src="${cpath }/customer/js/membership/customerLogin.js"></script>
   	<script type="text/javascript" src="${cpath }/customer/js/main/customerHeader.js"></script>
</head>

<body> 
<%@ include file="../main/customer_Header.jsp"%>

    <!-- 본문 영역 -->
    <section class="section-SangJae">
      <div class="login">
        <form method="POST" id="loginForm" action="${cpath }/customer/membership/customerLogin/POST/">
          <img src="https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/customer/img/logo4.png" class="login-logo" />
          <div class="login-alert">메세지</div>
          <div class="login-input">
            <input type="text" name="id" id="userid" class="login-input-boxs" onkeyup="loginEnter()"  autocomplete="off"/>
            <input type="password" name="pw" id="userpw" class="login-input-boxs"  onkeyup="loginEnter()"/>

            <div class="login-check">
              <label><input type="checkbox" name="storeid" id="storeid" class="login-storeid" />자동 로그인</label>
              <a href="#" class="login-idFind">ID/PW 찾기</a>
            </div>

            <div class="login-buttons">
              <input type="button" value="login" id="loginSubmit" class="login-input-buttons" />
              <input type="button" value="Join" id="loginJoin" class="login-input-buttons" />
            </div>
          </div>
        </form>
      </div>
    </section>

    <!-- 스크립트 영역 -->
    <script>
     	document.getElementById('loginSubmit').addEventListener('click', function(){ logiinSubmit('synchronous');});
     	
     	function loginEnter() {
  		  if (window.event.keyCode == 13)
  			logiinSubmit('synchronous');
     	}
  	</script> 
    
       	</body>
</html>