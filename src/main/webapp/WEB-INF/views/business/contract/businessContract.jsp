<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>businessContaract :: Laundry</title>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css"> 
    <link rel="stylesheet" href="${cpath }/business/css/contract/businessContract.css"> 
     	
    <!-- Font -->
   <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>
    <%@ include file="../main/businessHeader.jsp" %>

	<div class="marginauto" style="width: 900px; height: 1000px; border: 1px">
	
	<div class="marginauto" style="height: 15%; text-align: left;">
		<h1 style="font-size: 32pt; margin-left: 20px;">온라인 계약</h1>
	<hr>
	</div>	
	<div  class="marginauto" style="height: 85%; width: 100%">	
		<div style="text-align: left;" id="iconDiv">
			<i class="fas fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
		</div>
    	<img id="prevBtn" style="position: fixed; width: 70px; top: 45%; left: 0; z-index: 9999;" src="${cpath }/resources/business/img/prev_button.png" onclick="prevButton()">
    	<img id="nextBtn" style="position: fixed; width: 70px; top: 45%; right: 0; z-index: 9999;" src="${cpath }/resources/business/img/next_button.png" onclick="nextButton()">
    	<form  class="marginauto" style="width: 800px; height: 800px;">
        	<%@ include file="./businessContract1.jsp" %>
        	<%@ include file="./businessContract2.jsp" %>
        	<%@ include file="./businessContract3.jsp" %>
        	<%@ include file="./businessContract4.jsp" %>
        	<%@ include file="./businessContract5.jsp" %>
    	</form>
    </div>
    

    
	</div>
	
<script>
	var iconDiv = document.getElementById('iconDiv');
	console.log(iconDiv.children.length);
	
    var container = document.querySelectorAll('form div.container');
    console.log('길이 : ' + container.length);
    
	function prevButton() {
		for(i = 1; i < container.length; i++) {
			if(container[i].style.display == '') {
				container[i].style.display = 'none';
				container[i - 1].style.display = '';
				break;
			}
		}
		for(j = 1; j < iconDiv.children.length; j++) {
			if(iconDiv.children[j].className == 'fas fa-circle fa-3x') {
				iconDiv.children[j].className = 'far fa-circle fa-3x';
				iconDiv.children[j - 1].className = 'fas fa-circle fa-3x';
				break;
			}
		}
	}

	function nextButton() {
		for(i = 0; i < container.length - 1; i++) {
			if(container[i].style.display == '') {
				container[i].style.display = 'none';
				container[i + 1].style.display = '';
				break;
			}
		}
		for(j = 0; j < iconDiv.children.length - 1; j++) {
			if(iconDiv.children[j].className == 'fas fa-circle fa-3x') {
				iconDiv.children[j].className = 'far fa-circle fa-3x';
				iconDiv.children[j + 1].className = 'fas fa-circle fa-3x';
				break;
			}
		}
	}
	
	// 어째서 getElementById 적용이 되지 않는가?
	function preCheck(obj) {

		var preA = obj.parentNode.querySelector('#preA');
		var preB = obj.parentNode.querySelector('#preB');
		
		if(preA.checked === true && preB.checked === true) {
			nextButton();
		}
		else
			alert('약관을 모두 동의하시길 바랍니다');
	}

    
</script>

</body>
</html>