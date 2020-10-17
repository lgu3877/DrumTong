<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>customerMain :: Laundry</title>
  	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
  	<link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
	  	<link rel="stylesheet" href="${cpath }/business/css/businessLogin.css">
  	
  	 <link
   		 rel="stylesheet"
   		 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />

  	
  	<script type="text/javascript"> 
  	function getCookie(name) { 
  		var cookie = document.cookie;
  		console.log('쿠키 : ' + document.cookie);
  		
  		// 하루동안 보지 않기를 선택하면 cookiePause = N 으로 출력된다
  		if (document.cookie != "") { 
  			var cookie_array = cookie.split("; ");
  			for ( var index in cookie_array) { 
  				var cookie_name = cookie_array[index].split("=");
  				if (cookie_name[0] == "cookiePause") { 
  					return cookie_name[1]; 
  					} 
  			}
  		}
  	} 
  	
  	function openPopup(url) { 
  		var cookieCheck = getCookie("cookiePause");
  		
  		// mainCover.jsp - closePopup 명령어 참조
  		if (cookieCheck != "N")
  			window.open(url, '', 'width=960,height=640,left=0,top=0') 
  		}
  	</script>

</head>
<body onload="javascript:openPopup('${cpath}/business/mainCover')">

	<header>
		<div class="h_wrapper">
			<div class="h_left_con">
				<a href="${cpath }/business/"><img src="${cpath }/resources/business/img/businessLogo.png" /></a>
			</div>
			<div class="h_right_con">
				<div class="h_right_upper">
					<div class="member_menu">
						<span><a href="${cpath }/business/membership/businessLogin/">Login</a></span> <span>/</span> <span>Sign-up</span> <span>
							<select>
								<option>매장선택</option>
								<option>A</option>
								<option>B</option>
								<option>C</option>
						</select>
							<button onclick="#">개인정보수정</button>
						</span>
					</div>
				</div>
				<div class="h_right_lower">
					<div>subMenu</div>
					<div>subMenu</div>
					<div>subMenu</div>
					<div>subMenu</div>
				</div>
			</div>
		</div>
		
		<hr>	
	
	</header>
	
