<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: businessOrderStatusManagemnet</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- businessStatisticsManagement css -->
	<link rel="stylesheet" href="${cpath }/business/css/submanagement/businessOrderStatusManagement.css">
	
	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   	
   	<!-- jQuery CDN -->   	
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<!-- jQuery Modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>
<body>
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
	
	<!-- sub-header(membership) -->
	<%@ include file="../main/businessSubHeader.jsp" %>
		
		<div class="outerdiv">
			<h1 style="font-size: 36pt">주문현황</h1>
			
			
			<div class="container" id="container" onclick="openDetail(this)">
				<h1 class="containerName">주문번호 : AAA-154332e</h1>
				<div class="contentdiv">
					<div class="halfdiv">
						<div>
							<h1>구매날짜</h1>
							<p>2020-11-18</p>
						</div>
						<div>
							<h1>유형</h1>
							<p>런닝화</p>
						</div>
					</div>
					<div class="halfdiv">
						<div>
							<h1>배송날짜</h1>
							<p>2020-11-28</p>
						</div>
						<div>
							<h1>주문금액</h1>
							<p>28,000원</p>
						</div>
						<div class="middleBorder"></div>			
					</div>
				</div>
			</div>
		
		</div>

	</section>
	
	<div id="modalback" style="position: fixed; width: 100%; height: 100%; left: 0; top: 0; background:rgba(0,0,0,0.5); display: none"></div>
	<div id="modal" style="position: fixed; width: 50%; height: 50%; left: 25%; top: 25%; display: none; background: white">
		<a href="#" class="close">X</a>
	</div>
	
	<script type="text/javascript">
		
		let clonecontainer = $('div.container');
		
 		for(i = 0; i < 5; i++) {
 			$('.outerdiv').append('<div class="container"  onclick="openDetail(this)">' + clonecontainer.html() + '</div>');
 			$('.outerdiv').children('div.container').eq(i + 1).attr('id', 'container' + i);
 			if(i % 2 == 0) {
 				$('.outerdiv').children('div.container').eq(i + 1).css({'marginRight': '0', 'marginLeft': '500px'});
 			}
 		}
		
		function openDetail(obj) {
// 			$('#modal').html('333333');
			$('#modal').fadeIn(300);
			$('#modalback').fadeIn(300);
		}
		
		$('#modal, .close').on('click', function() {
			$('#modal').fadeOut(300);
			$('#modalback').fadeOut(300);
		})
		
		
		$(document).ready(function() {
    	$(window).scroll( function(){
        $('.container').each( function(i){
            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            console.log('$(this).offset().top : ', $(this).offset().top);
            console.log('$(this).outerHeight() : ', $(this).outerHeight());	// 고정
            console.log('$(window).scrollTop() : ', $(window).scrollTop());
            console.log('$(window).height() : ', $(window).height());		// 고정
            if( bottom_of_window > bottom_of_object ){
                $(this).animate({'opacity':'1'},500);
            }
        }); 
    });
});

	</script>
</body>
</html>