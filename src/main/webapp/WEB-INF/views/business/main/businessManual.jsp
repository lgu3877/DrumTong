<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>businessMain :: Manual</title>
	<!-- global css -->
     <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">

 	<!-- header css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
	<!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessManual.css">

</head>
<body>
	<!-- header(navbar) -->
	<%@ include file="businessHeader.jsp" %>
	
	<section>
		<div class="manual-container">
			<%@ include file="businessManualSideBar.jsp" %>
		</div>
		
		<!-- 여기서부터 페이지별로 따로 만들어야합니다 -->
		<div style="width: 700px; height: 800px; float: left; padding: 50px 25px 0px 50px">
			<p class="content-path" style="color: #8E929F; text-align: left; padding: 0 0 15px 0; margin: 0">컨텐츠의 패스 경로를 알려줍니다</p>
			<h1 class="content-title" style="text-align: left; font-size: 32px; margin: 0">
				제목이 들어가는 태그
			</h1>
		</div>
	</section>
		
	<!-- footer -->
	<%@ include file="businessFooter.jsp" %>
	
	<script type="text/javascript">
	
		var updown = document.querySelectorAll('.outer-li-a');
		for(let i = 0; i < updown.length; i++) {
			updown[i].addEventListener('click', function() {
				if(this.parentNode.querySelector('ul').style.display == 'none') {
					this.parentNode.querySelector('.outer-li-a i').style.transform = 'rotate(-180deg)';
					this.parentNode.querySelector('ul').style.display = 'block';
				}
				else {
					this.parentNode.querySelector('.outer-li-a i').style.transform = 'rotate(0)';
					this.parentNode.querySelector('ul').style.display = 'none';
				}
			});
		}
		
		var rightdown = document.querySelectorAll('.inner-li-a');
		for(let j = 0; j < rightdown.length; j++) {
			rightdown[j].addEventListener('click', function() {
				if(this.parentNode.querySelector('ul').style.display == 'none') {
					this.parentNode.querySelector('.inner-li-a i').style.transform = 'rotate(90deg)';
					this.parentNode.querySelector('ul').style.display = 'block';
				}
				else {
					this.parentNode.querySelector('.inner-li-a i').style.transform = 'rotate(0)';
					this.parentNode.querySelector('ul').style.display = 'none';
				}
			});
		}
		
	</script>
</body>
</html>