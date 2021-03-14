<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>businessMain :: Cover</title>
	<style type="text/css">

		.none {
			display: none;
		}
		
		.cookiebutton {
			width: 300px;
			height: 50px;
			font-size: 18pt;
			font-weight: bold;
		}
	</style>
	<script type="text/javascript">

	 
	// 쿠키 만료시간 정하기
	function setCookieTime(name, value) {
	    var date = new Date();
	    date.setHours(23);
	    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + date.toGMTString() + ";";
	    // 쿠키 이름(name)과 value 값을 연결짓기
	    // path 로 쿠키가 사용될 범위 지정해주기
	    // expires 로 만료시간 설정하기
	    // 나중에 domain 까지 완료되면 domail도 쿠키속성에 넣도록 하자
	}

	// 쿠키를 삭제하는 명령어
	// popupYN 쿠키에 "N" 이라는 값을 입력하고 1일 동안 유지시킨다
    function deletePopup() { //  popup(4) 팝업 동작순서
        	setCookieTime("cookiePause", "N");	// 쿠키생성하기
            self.close();
    }
	
	</script>
</head>
<body id="maincover">

	<div class="maincover active">
		<img src="https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/business/img/maincover/maincover1.jpg" style="width: 100%;">
	</div>
	<div class="maincover">
		<img src="https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/business/img/maincover/maincover2.jpg" style="width: 100%">
	</div>
	<div class="maincover">
		<img src="https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/business/img/maincover/maincover3.jpg" style="width: 100%">
	</div>
	<div class="maincover">
		<img src="https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/business/img/maincover/maincover4.jpg" style="width: 100%">
	</div>
	<div class="maincover">
		<img src="https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/business/img/maincover/maincover5.jpg" style="width: 100%">
	</div>
	<div class="maincover" style="padding-top: 200px; text-align: center;">
		<h1>우리 세탁소를 소개하마!</h1>
		<h1>닥치고 잘 읽어보거라!</h1>
		<h1>근데 아직 공지사항 없으니까!</h1>
		<h1>닥치고 동의나 하거라!</h1>
		<input type="button" id="check" onclick="deletePopup()" value="시작하기" class="cookiebutton">	<!--  popup(3) 팝업 동작순서 : 쿠키 생성하는 명령어 활성화 -->
	</div>
	<img id="prevBtn" style="position: absolute; top: 45%; left: 0; z-index: 9999; width: 5%; opacity: 0.6; display: none" src="${cpath }/resources/business/img/arrow/prev_button.png" onclick="prevCover()">
	<img id="nextBtn" style="position: absolute; top: 45%; right: 0; z-index: 9999; width: 5%; opacity: 0.6; display: none" src="${cpath }/resources/business/img/arrow/next_button.png" onclick="nextCover()">
</body>

<script type="text/javascript">


	var maincovers = document.querySelectorAll('.maincover');
	for(i = 1; i < maincovers.length;i++) {
		maincovers[i].className= 'maincover none';
	}
	
	function prevCover() {
		for(i = 1; i < maincovers.length;i++) {
			if(maincovers[i].className == 'maincover active') {
				maincovers[i].className = 'maincover none';
				maincovers[i - 1].className = 'maincover active';
				break;
			}
		}
	}

	function nextCover() {
		for(i = 0; i < maincovers.length - 1;i++) {
			if(maincovers[i].className == 'maincover active') {
				maincovers[i].className = 'maincover none';
				maincovers[i + 1].className = 'maincover active';
				break;
			}
		}			
	}
	
	function activeButton() {
		document.getElementById('prevBtn').style.display = '';
		document.getElementById('nextBtn').style.display = '';
	}

	function deactiveButton() {
		document.getElementById('prevBtn').style.display = 'none';
		document.getElementById('nextBtn').style.display = 'none';
	}
	
	if (document.addEventListener) {
		document.getElementById('maincover').addEventListener('mouseover',activeButton);
		document.getElementById('maincover').addEventListener('mouseout',deactiveButton);		
	}
</script>

</html>
