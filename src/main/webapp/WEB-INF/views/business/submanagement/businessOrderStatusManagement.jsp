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
		
		<i id="searchlogo" class="fas fa-list-ul fa-3x"></i>
		<div id="searchdiv">
			<input type="text">
			<button>검색</button>
		</div>
		<div class="outerdiv" >
			
			<div class="upperbtn">
				<i class="fas fa-chevron-circle-up fa-4x" onclick="upperbtn()"></i>
			</div>
			
			<h1 style="font-size: 36pt">주문현황</h1>
			
			<div class="typeSelect">
				<button onclick="chStatus(this, 'r')">요청</button>
				<div></div>
				<button onclick="chStatus(this, 'p')">처리중</button>
				<div></div>
				<button onclick="chStatus(this, 's')">완료</button>
			</div>
			
			<div style="width: 700px; height: 30px; margin: 0 auto; display: flex; align-items: center; margin-bottom: 25px; margin-top: 10px">
				<input type="date" style="width: 40%; height: 100%; font-size: 14pt; text-align: center; border: 3px solid #3088F9; font-weight: bold">
				<div style="width: 20%"></div>
				<input type="date" style="width: 40%; height: 100%; font-size: 14pt; text-align: center; border: 3px solid #3088F9; font-weight: bold">
			</div>
			
			<div class="clonediv" id="clonediv0">
			
			<div class="outerstatus1"></div>
			<div class="outerstatus2"><h1></h1></div>
			<div class="nulldiv"></div>
			
			<div class="container" onclick="openDetail(this)">
				<h1 class="containerName"></h1>
				<h1 class="requesttype"></h1>
				<div class="contentdiv">
					<div class="halfdiv">
						<div>
							<h1>주문일시</h1>
							<p class="purchasedate"></p>
						</div>
						<div>
							<h1>주문유형</h1>
							<p class="maincategory"></p>
						</div>
					</div>
					<div class="halfdiv">
						<div>
							<h1>배송일시</h1>
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
	
	<div id="modalback"></div>
	<div id="modal">
		<h1>가게 이름<a class="close"><i class="far fa-times-circle fa-3x"></i></a></h1>
		<h2>주문 번호</h2>
		<hr class="titlehr">
			<div>완료 예정<span id="ableday"></span></div>
			<div>배송 일시<span id="deliverydate"></span></div>
			<div>받은 날짜<span id="pickupdate"></span></div>
		<hr>
			<div>메인 카테고리<span id="maincategory"></span></div>
			<div>서브 카테고리<span  id="subcategory"></span></div>
		<hr>
			<div>메뉴명<span  id="menuname"></span></div>
			<div>구매 개수<span id="menuamount"></span></div>
			<div>메뉴 금액<span  id="menuprice"></span></div>
			<div>메뉴 총금액<span  id="sumprice"></span></div>
		<hr>
			<div>요청 사항<span id="requests"></span></div>
		<hr>
			<div>기본 금액<span id="originalprice"></span></div>
			<div>쿠폰 금액<span id="discountprice"></span></div>
			<div>배달 금액<span id="quickprice"></span></div>
		<hr>
			<div>총 개수<span id="totalamount"></span></div>
			<div>총 금액<span  id="totalprice"></span></div>
		<hr>
	</div>
	
	<script type="text/javascript">
		
		
		let orderList = ${orderList};
		let clonecontainer = $('#clonediv0');
		let pageFilter = '';
		
 		window.onload = function() {
 			originclone();
  			insertDiv();
  			
  			$('div.outerdiv').find('.container').each(function(index, item) {
  				$(item).hover(function() {
  					$(item).parent().find('.outerstatus1').css('transform', 'translate(0, -20px)');
  					$(item).parent().find('.outerstatus1').css('transition', 'all 1s ease 0s');
  					$(item).parent().find('.outerstatus1').css('backgroundColor', '#3088F9');
  					$(item).parent().find('.outerstatus2').css('transform', 'translate(0, -20px)');
  					$(item).parent().find('.outerstatus2').css('transition', 'all 1s ease 0s');
  					$(item).parent().find('.outerstatus2').css('backgroundColor', '#3088F9');
  					$(item).parent().find('.outerstatus2 h1').css('color', 'white');
  					
  				}, function() {
  					$(item).parent().find('.outerstatus1').css('transform', '');
  					$(item).parent().find('.outerstatus1').css('transition', 'all 0s ease 0s');
  					$(item).parent().find('.outerstatus2').css('transform', '');
  					$(item).parent().find('.outerstatus2').css('transition', 'all 0s ease 0s');
  					$(item).parent().find('.outerstatus2').css('backgroundColor', 'white');
  					$(item).parent().find('.outerstatus2 h1').css('color', '');
  				})
  			})
  		}
 		
 		function originclone() {
 			
 			$('#clonediv0').children('.outerstatus2').children('h1').html(orderList[0].status);
 			$('#clonediv0').find('.containerName').html('주문번호 : ' + orderList[0].salecode);
 			$('#clonediv0').find('.requesttype').html(orderList[0].requesttype);
 			$('#clonediv0').find('p.purchasedate').html(orderList[0].purchasedate);
 			$('#clonediv0').find('p.deliverydate').html(orderList[0].deliverydate);
 			$('#clonediv0').find('p.totalprice').html(orderList[0].totalprice);
 			
			const array = [];
			for(j = 0; j < (orderList[0].bDetailSalesVOList).length; j++) {
				array.push((orderList[0].bDetailSalesVOList)[j].maincategory);
			}			
			const setarray0 = [];
			for (k = 0; k < Array.from(new Set(array)).length; k++) {
				setarray0.push(Array.from(new Set(array))[k]);
				if (k > 0)
					setarray0.push(' / ');
			}			
  			$('#clonediv0').find('p.maincategory').html(setarray0);
 		}
		
 		
 		function insertDiv() {	// 클론 div를 이용하여 다른 명세서들 출력
 			for(i = 1; i < orderList.length; i++) {
 			
 				$('.outerdiv').append('<div class="clonediv" id="clonediv' + i + '">' + clonecontainer.html() + '</div>');
 				$('#clonediv' + i).children('.outerstatus2').children('h1').html(orderList[i].status);
 				$('#clonediv' + i).find('.containerName').html('주문번호 : ' + orderList[i].salecode);
 				$('#clonediv' + i).find('.requesttype').html(orderList[i].requesttype);
 				$('#clonediv' + i).find('p.purchasedate').html(orderList[i].purchasedate);
 				$('#clonediv' + i).find('p.deliverydate').html(orderList[i].deliverydate);
 				$('#clonediv' + i).find('p.totalprice').html(orderList[i].totalprice);
			
				const array = [];
				for(j = 0; j < (orderList[i].bDetailSalesVOList).length; j++) {
					array.push((orderList[i].bDetailSalesVOList)[j].maincategory);
				}			
				const setarray = [];
				for (k = 0; k < Array.from(new Set(array)).length; k++) {
					setarray.push(Array.from(new Set(array))[k]);
					if (k > 0)
						setarray.push(' / ');
				}			
 	 			$('#clonediv' + i).find('p.maincategory').html(setarray);
 			}
 		}
 		

		function openDetail(obj) {		// 모달 활성화
// 			console.log('아이디 : ', obj.parentNode.id);
// 			console.log('replace : ', (obj.parentNode.id).replace('clonediv',''));
			modalexitkey = obj.parentNode.id;
			let detailob = orderList[(obj.parentNode.id).replace('clonediv','')];
			
			$('#modal').find('#ableday').html(detailob.ableday);
			$('#modal').find('#deliverydate').html(detailob.deliverydate);
			$('#modal').find('#pickupdate').html(detailob.pickupdate);
			$('#modal').find('#requests').html(detailob.requests);
			$('#modal').find('#originalprice').html(detailob.originalprice + '원');
			$('#modal').find('#totalprice').html(detailob.totalprice + '원');
			$('#modal').find('#totalamount').html(detailob.totalamount + '개');
			$('#modal').find('#discountprice').html('(-) ' + detailob.discountprice + '개');
			$('#modal').find('#quickprice').html('(+) ' + detailob.quickprice + '개');
			
			// bDetailSalesVOList 는 volist 수정 후 작업재개!!
				$('#modal').find('#maincategory').html(detailob.bDetailSalesVOList[0].maincategory);
				$('#modal').find('#subcategory').html(detailob.bDetailSalesVOList[0].subcategory);
				$('#modal').find('#menuname').html(detailob.bDetailSalesVOList[0].name);				// vo 속성이랑 이름 다르게 했음
				$('#modal').find('#menuamount').html(detailob.bDetailSalesVOList[0].amount + '개');				// vo 속성이랑 이름 다르게 했음
				$('#modal').find('#menuprice').html(detailob.bDetailSalesVOList[0].menuprice + '원');
				$('#modal').find('#sumprice').html(detailob.bDetailSalesVOList[0].sumprice + '원');

			
			$('#modal').fadeIn(300);
			$('#modalback').fadeIn(300);
			
		}
		
		function upperbtn() {	// 맨 위로 이동하는 버튼
			$('html, body').animate({scrollTop : 0},800);
		}
		
		function chStatus(obj, filter) {	// 필터 버튼

			if(pageFilter.indexOf(filter) == -1)
				pageFilter += filter;

			obj.className = 'selectedStatus';
			obj.setAttribute("onclick", "deleteStatus(this,'"  + filter + "')");
		}
		
		function deleteStatus(obj, filter) {
			console.log('obj : ', obj);
			console.log('filter : ', filter);
			
			if(pageFilter.indexOf(filter) == -1)
				pageFilter.replace(filter, '');
			
			obj.className = '';
			obj.setAttribute("onclick", "chStatus(this, '" + filter + "')")
		}
		
		$('#searchlogo').on('click', function() {
				if($('#searchdiv').css('visibility') == 'hidden')
					$('#searchdiv').css('visibility', 'visible');
				else
					$('#searchdiv').css('visibility', 'hidden');
		});
		
 		$('.close').on('click', function() {	// 모달 비활성화
				$('#modal').fadeOut(300);
				$('#modalback').fadeOut(300);
		});
		
		$(document).keyup(function(e) {		// esc 키 누르면 모달 비할성화
		   if (e.keyCode == 27 || e.which == 27 ) {
				$('#modal').fadeOut(300);
				$('#modalback').fadeOut(300);
		   }
		});
		
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