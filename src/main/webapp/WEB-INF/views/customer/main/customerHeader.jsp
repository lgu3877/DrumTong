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
	<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
    <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script type="text/javascript" src="${cpath }/customer/js/main/customerHeader.js"></script>
	<script type="text/javascript" src="${cpath }/customer/js/laundry/customerSearch.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/account/customerPayAndCopon.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/account/customerJoinChange.js"></script>
    <script src="https://kit.fontawesome.com/7522a35233.js" crossorigin="anonymous"></script>
	
</head>
<body>
	
	<header>
        <a href="${cpath }/"><i class="fa fa-cloud" aria-hidden="true"></i></a>
        
        <div class="mainMenu">
            
            <ul class="menu">
                <li>
                    <a href="#" class="middleMenu" onclick="middleMenuClick()">한글</a>
                </li>
            </ul>

            <ul class="menu" >
                <li>
                    <a href="#" class="middleMenu">메뉴</a>
                </li>
            </ul>   

            <ul class="menu">
                <li>
                    <a href="#" class="middleMenu">메늉</a>
                </li>
            </ul>

            <ul class="menu">
                <li>
                    <a href="${cpath }/customer/membership/customerSignUp/" class="middleMenu">회원가입</a>
                </li>
            </ul>  

            <ul class="menu">
                <li class="headerLogin">
                	<c:choose>
                		<c:when test="${empty Login}">
                			<a href="${cpath }/customer/membership/customerLogin/" class="middleMenu middleMenu2 ">로그인</a>
                		</c:when>
                		
                		<c:when test="${not empty Login}">
                			<a href="${cpath }/" class="middleMenu middleMenu2 ">내 계정</a>
                			
                			<ul class="mypage">
		                        <div class="listButtons">
		                            <li class="mypageList"><a href="#" class="listButton">즐겨찾기</a></li>
		                            <li class="mypageList"><a href="#" class="listButton">주문내역</a></li>
		<!--                             <li class="mypageList"><a href="#" class="listButton">계정</a></li> -->
		                            <li class="mypageList"><a href="${cpath }/customer/membership/customerLogOut/" class="listButton">로그아웃</a></li>
		                        </div>
		                    </ul>
                		</c:when>
                	</c:choose>
                	
                    
                </li>
            </ul> 
        </div>
    </header>
	
