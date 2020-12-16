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
		
		<div class="outerdiv" >
			<h1 style="font-size: 36pt">주문현황</h1>
			
			<div class="clonediv" id="clonediv0">
			
			<div class="outerstatus1"></div>
			<div class="outerstatus2"><h1></h1></div>
			<div class="nulldiv" style=""></div>
			
			<div class="container" onclick="openDetail(this)">
				<h1 class="containerName"></h1>
				<h1 class="requesttype"></h1>
				<div class="contentdiv">
					<div class="halfdiv">
						<div>
							<h1>주문일</h1>
							<p class="purchasedate"></p>
						</div>
						<div>
							<h1>주문유형</h1>
							<p></p>
						</div>
					</div>
					<div class="halfdiv">
						<div>
							<h1>배송일</h1>
							<p  class="deliverydate"></p>
						</div>
						<div>
							<h1>주문금액</h1>
							<p  class="totalprice"></p>
						</div>
						<div class="middleBorder"></div>			
					</div>
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
	
	    console.log(${orderList});
		
		let clonecontainer = $('#clonediv0');
		let orderList = ${orderList};
		console.log('요청타입 : ', orderList[0].requesttype);
		console.log('요청사항 : ', orderList[0].request);
		
 		window.onload = function() {
 			$('#clonediv0').children('.outerstatus2').children('h1').html(orderList[0].status);
 			$('#clonediv0').find('.containerName').html('주문번호 : ' + orderList[0].salecode);
 			$('#clonediv0').find('.requesttype').html(orderList[0].requesttype);
 			$('#clonediv0').find('p.purchasedate').html(orderList[0].purchasedate);
 			$('#clonediv0').find('p.deliverydate').html(orderList[0].deliverydate);
 			$('#clonediv0').find('p.totalprice').html(orderList[0].totalprice);
 		}
		
 		for(i = 1; i < orderList.length; i++) {
 			$('.outerdiv').append('<div class="clonediv" id="clonediv' + i + '">' + clonecontainer.html() + '</div>');
 			
 			$('#clonediv' + i).children('.outerstatus2').children('h1').html(orderList[i].status);
 			$('#clonediv' + i).find('.containerName').html('주문번호 : ' + orderList[i].salecode);
 			$('#clonediv' + i).find('.requesttype').html(orderList[0].requesttype);
 			$('#clonediv' + i).find('p.purchasedate').html(orderList[0].purchasedate);
 			$('#clonediv' + i).find('p.deliverydate').html(orderList[0].deliverydate);
 			$('#clonediv' + i).find('p.totalprice').html(orderList[0].totalprice);
 			
 			for(i = 0; i < (orderList[0].bDetailSalesVOList).length; i++) {
 				
 			}
 			
 			
 		}
		
		function openDetail(obj) {
			$('#modal').fadeIn(300);
			$('#modalback').fadeIn(300);
		}
		
		$('#modal, .close').on('click', function() {
			$('#modal').fadeOut(300);
			$('#modalback').fadeOut(300);
		})
		
		
		$(document).ready(function() {
    	$(window).scroll( function(){
        $('.clonediv').each( function(i){
            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
//             console.log('$(this).offset().top : ', $(this).offset().top);
//             console.log('$(this).outerHeight() : ', $(this).outerHeight());	// 고정
//             console.log('$(window).scrollTop() : ', $(window).scrollTop());
//             console.log('$(window).height() : ', $(window).height());		// 고정
            if( bottom_of_window > bottom_of_object ){
                $(this).animate({'opacity':'1'},500);
            }
        }); 
    });
});

	</script>
</body>
</html>