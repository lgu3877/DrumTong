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
  	<link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet" type="text/css">
    <link rel="stylesheet" href="${cpath }/customer/css/customerStyle.css">
    <link rel="stylesheet" href="${cpath }/customer/css/customerStyleDohyun.css">
    <link rel="stylesheet" href="${cpath }/customer/css/customerStyleSangJae.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
    <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script type="text/javascript" src="${cpath }/customer/js/main/customerHeader.js"></script>
    <script src="https://kit.fontawesome.com/7522a35233.js" crossorigin="anonymous"></script>
	
	<!-- AXIOS -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
	<!-- javascript cpath -->
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		function getContextPath() {
		    return sessionStorage.getItem("contextpath");
		}
	</script>
	<style type="text/css">
		.notice_area_1 {
			float: left;
			margin-right: 15px;
		}
		.notice_area_2 {
			float: left;
		}
	</style>	   	
</head>
<body>
	
	<header>
<%--         <a href="${cpath }/"><img class="logo" src="${cpath }/resources/customer/img/logo1.png"></img></a> --%>
<%--         <a href="${cpath }/"><img class="logo" src="${cpath }/resources/customer/img/logo2.png"></img></a> --%>
        <a href="${cpath }/"><img class="logo" src="https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/customer/img/logo3.png"></img></a>
<%--         <a href="${cpath }/"><img class="logo" src="${cpath }/resources/customer/img/logo4.png"></img></a> --%>
        
        <div class="mainMenu">
            
            <ul class="menu">
                <li>
                    <a href="#" class="middleMenu" onclick="middleMenuClick()">한글</a>
                </li>
            </ul>

            <ul class="menu" >
                <li>
                    <a href="#" class="middleMenu">메뉴1</a>
                </li>
            </ul>   

            <ul class="menu">
                <li>
                    <a href="#" class="middleMenu">메뉴2</a>
                </li>
            </ul>
            
            
                <c:if test="${empty cLogin}">
            <ul class="menu">
                <li>
                    <a href="${cpath }/customer/membership/customerSignUp/" class="middleMenu">회원가입</a>
                </li>
            </ul>  
				</c:if>
            <ul class="menu">
            	
                <li class="headerLogin">
                		<c:if test="${empty cLogin}">
                			<a href="${cpath }/customer/membership/customerLogin/" class="middleMenu middleMenu2 ">로그인</a>
                		</c:if>
                		
                		<c:if test="${not empty cLogin}">
                			<a href="${cpath }/customer/account/customerMenu/" class="middleMenu middleMenu2 ">내 계정</a>
                			
                			<ul class="mypage">
		                        <div class="listButtons">
		                            <li class="mypageList"><a href="${cpath }/customer/account/customerBookmark/" class="listButton">즐겨찾기</a></li>
		                            <li class="mypageList"><a href="${cpath }/customer/account/customerOrderList/" class="listButton">주문내역</a></li>
		<!--                             <li class="mypageList"><a href="#" class="listButton">계정</a></li> -->
		                            <li class="mypageList"><a href="${cpath }/customer/membership/customerLogOut/" class="listButton">로그아웃</a></li>
		                        </div>
		                    </ul>
                		</c:if>
                	
                    
                </li>
            </ul> 
        </div>
    </header>
	
