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
			<ul>
				<li class="outer-li">
					<a class="outer-li-a" title="A">
						A<i class="fas fa-chevron-down"></i>
					</a>
					<ul style="display: none;">
						<li class="inner-li">
							<a class="inner-li-a">
								<i class="fas fa-chevron-right"></i>A-1
							</a>
							<ul style="display: none">
								<li class="inner-inner-li">A-1-1</li>
								<li class="inner-inner-li">A-1-2</li>
								<li class="inner-inner-li">A-1-2</li>
							</ul>
						</li>
						<li class="inner-li">
							<a class="inner-li-a">
								<i class="fas fa-chevron-right"></i>A-2
							</a>
							<ul style="display: none">
								<li class="inner-inner-li">A-2-1</li>
								<li class="inner-inner-li">A-2-2</li>
								<li class="inner-inner-li">A-2-2</li>
							</ul>
						</li>
				
						<li class="inner-li">
							<a class="inner-li-a">
								<i class="fas fa-chevron-right"></i>A-3
							</a>
							<ul style="display: none">
								<li class="inner-inner-li">A-3-1</li>
								<li class="inner-inner-li">A-3-2</li>
								<li class="inner-inner-li">A-3-2</li>
							</ul>
						</li>
					</ul>
				</li>
				
				<li class="outer-li">
					<a class="outer-li-a" title="B">
						B<i class="fas fa-chevron-down"></i>
					</a>
					<ul style="display: none;">
						<li class="inner-li">
							<a class="inner-li-a">
								<i class="fas fa-chevron-right"></i>B-1
							</a>
							<ul style="display: none">
								<li class="inner-inner-li">B-1-1</li>
								<li class="inner-inner-li">B-1-2</li>
								<li class="inner-inner-li">B-1-3</li>
							</ul>
						</li>
						<li class="inner-li"><i class="fas fa-chevron-right"></i>B-2</li>
						<li class="inner-li"><i class="fas fa-chevron-right"></i>B-3</li>
						<li class="inner-li"><i class="fas fa-chevron-right"></i>B-4</li>
					</ul>
				</li>
				
				<li class="outer-li">
					<a class="outer-li-a" title="C">
						C<i class="fas fa-chevron-down"></i>
					</a>
					<ul style="display: none;">
						<li class="inner-li"><i class="fas fa-chevron-right"></i>C-1</li>
						<li class="inner-li"><i class="fas fa-chevron-right"></i>C-2</li>
						<li class="inner-li"><i class="fas fa-chevron-right"></i>C-3</li>
						<li class="inner-li"><i class="fas fa-chevron-right"></i>C-4</li>
					</ul>
				</li>
				<li class="outer-li">
					<a class="outer-li-a" title="D">
						D<i class="fas fa-chevron-down"></i>
					</a>
					<ul style="display: none;">
						<li class="inner-li"><i class="fas fa-chevron-right"></i>D-1</li>
						<li class="inner-li"><i class="fas fa-chevron-right"></i>D-2</li>
						<li class="inner-li"><i class="fas fa-chevron-right"></i>D-3</li>
						<li class="inner-li"><i class="fas fa-chevron-right"></i>D-4</li>
					</ul>
				</li>
			</ul>
		</div>
		
		<div style="width: 700px; height: 800px; float: left; padding: 50px 25px 0px 50px">
			<p class="content-path" style="color: #8E929F; text-align: left; padding: 0 0 15px 0">컨텐츠의 패스 경로를 알려줍니다</p>
		
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