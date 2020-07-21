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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
    <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            // alert("Asd");
            $('.laundryLists').slick({
                infinite: true,				// 무한 반복 옵션
                slidesToShow: 5,			// 한 화면에 보여질 컨텐츠 개수
                slidesToScroll: 1,			// 스크롤 한번에 움직일 컨텐츠 개수
                autoplay: true,				// 자동 스크롤 사용 여부
                autoplaySpeed:3000,			// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
                dots: true,					// 스크롤바 아래 점으로 페이지네이션 여부
                pauseOnHover : true,		// 슬라이드 이동시 마우스 호버하면 슬라이더 멈추게 설정
            });
        });
    </script>
</head>
<body>
	
	<header>
        <a href="${cpath }/customer/"><i class="fa fa-cloud" aria-hidden="true"></i></a>
        
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
                    <a href="#" class="middleMenu">메뉴우</a>
                </li>
            </ul>  

            <ul class="menu">
                <li class="login">
                    <a href="" class="middleMenu middleMenu2 ">로그인</a>
                    <ul class="mypage">
                        <div class="listButtons">
                            <li class="mypageList"><a href="#" class="listButton">즐겨찾기</a></li>
                            <li class="mypageList"><a href="#" class="listButton">주문내역</a></li>
                            <li class="mypageList"><a href="#" class="listButton">계정</a></li>
                            <li class="mypageList"><a href="#" class="listButton">로그아웃</a></li>
                        </div>
                    </ul>
                </li>
            </ul>
        </div>
    </header>
	
