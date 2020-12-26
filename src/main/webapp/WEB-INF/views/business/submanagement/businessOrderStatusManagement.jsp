<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<button onclick="searching(this)">검색</button>
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
			<div class="in-modal">완료 예정<span id="ableday"></span></div>
			<div class="in-modal">배송 일시<span id="deliverydate"></span></div>
			<div class="in-modal">받은 날짜<span id="pickupdate"></span></div>
		<hr>
<!-- 			<div class="in-modal">메인 카테고리<span id="maincategory"></span></div> -->
<!-- 			<div class="in-modal">서브 카테고리<span  id="subcategory"></span></div> -->
<!-- 		<hr> -->
<!-- 			<div class="in-modal">메뉴명<span id="menuname"></span></div> -->
<!-- 			<div class="in-modal">구매 개수<span id="menuamount"></span></div> -->
<!-- 			<div class="in-modal">메뉴 금액<span  id="menuprice"></span></div> -->
<!-- 			<div class="in-modal">메뉴 총금액<span  id="sumprice"></span></div> -->
<!-- 		<hr> -->
<!-- 		<div class="detailmenus"> -->
<!-- 			<div class="clonedetail" id="clonedetail0"> -->
<!-- 				<p class="pmain"></p> -->
<!-- 				<p class="psubmain"></p> -->
<!-- 				<div class="outerdetail"> -->
<!-- 					<div class="innerdetail"> -->
<!-- 						<h3>메뉴명</h3> -->
<!-- 						<h3>가격</h3> -->
<!-- 						<h3>수량</h3> -->
<!-- 						<h3>부분합계</h3> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		<div class="detailattr">
			<h1 style="width: 25%; color: #cacece; font-size: 16pt; text-align: center;border-right: 1px solid #afafaf; border-left: 1px solid #afafaf">메뉴</h1>
			<h1 style="width: 25%; color: #cacece; font-size: 16pt; text-align: center;border-right: 1px solid #afafaf">단일 가격</h1>
			<h1 style="width: 25%; color: #cacece; font-size: 16pt; text-align: center;border-right: 1px solid #afafaf">수량</h1>
			<h1 style="width: 25%; color: #cacece; font-size: 16pt; text-align: center;border-right: 1px solid #afafaf">합계 가격</h1>
		</div>
		<div class="detailmenus" id="detailmenus">
			<div class="clonedetail" id="clonedetail0">
				<p class="pmain"><span class="psubmain"></span></p>
	
				<div class="outerdetail">
					<div class="innerdetail">
						<h3>메뉴명</h3>
						<h3>가격</h3>
						<h3>수량</h3>
						<h3>부분합계</h3>
					</div>
				</div>
			</div>
		</div>
		<hr>
			<div class="in-modal">요청 사항<span id="requests"></span></div>
		<hr>
			<div class="in-modal">기본 금액<span id="originalprice"></span></div>
			<div class="in-modal">쿠폰 금액<span id="discountprice"></span></div>
			<div class="in-modal">배달 금액<span id="quickprice"></span></div>
		<hr>
			<div class="in-modal">총 개수<span id="totalamount"></span></div>
			<div class="in-modal">총 금액<span  id="totalprice"></span></div>
		<hr>
	</div>
	
	<script type="text/javascript">
		
		let orderList = ${orderList};
		let clonecontainer = $('#clonediv0');
		let detailmenus = $('#detailmenus').clone();
	 	let innerclone = $('#detailmenus').find('.outerdetail').clone();
		let pageFilter = '';
		
		console.log(orderList);
		
 		window.onload = function() {
 			originclone();
  			insertDiv();
  			
  			$('div.outerdiv').find('.container').each(function(index, item) {	// 메인 주문내역(=container) 위의 라벨에도 똑같이 :hover 효과주기 위해서 
  				$(item).hover(function() {
  					$(item).parent().find('.outerstatus1').css('transform', 'translate(0, -20px)');
  					$(item).parent().find('.outerstatus1').css('transition', 'all 1s ease 0s');
  					$(item).parent().find('.outerstatus2').css('transform', 'translate(0, -20px)');
  					$(item).parent().find('.outerstatus2').css('transition', 'all 1s ease 0s');
  					
  				}, function() {
  					$(item).parent().find('.outerstatus1').css('transform', '');
  					$(item).parent().find('.outerstatus1').css('transition', 'all 0s ease 0s');
  					$(item).parent().find('.outerstatus2').css('transform', '');
  					$(item).parent().find('.outerstatus2').css('transition', 'all 0s ease 0s');
  				})
  			})
  		}
 		
 		function originclone() {	// 복사(=clone)한 html을 이용하여 모든 주문내역 반복문으로 생성
 			
 			$('#clonediv0').find('.containerName').html('주문번호 : ' + orderList[0].salecode);
 			
			switch (orderList[0].status) {
			case 'REQUEST':
				$('#clonediv0').children('.outerstatus2').children('h1').html('요청');
				break;
			case 'PROCESSING':
				$('#clonediv0').children('.outerstatus2').children('h1').html('처리중');
				break;
			case 'SUCCESS':
				$('#clonediv0').children('.outerstatus2').children('h1').html('완료');
				break;
			}
 			
 			switch (orderList[0].requesttype) {
			case 'VISIT':
				$('#clonediv0').find('.requesttype').html('매장방문');	
				break;
			default:
				$('#clonediv0').find('.requesttype').html('배달');
				break;
			}
 			
 			$('#clonediv0').find('p.purchasedate').html(orderList[0].purchasedate);
 			$('#clonediv0').find('p.deliverydate').html(orderList[0].deliverydate);
 			$('#clonediv0').find('p.totalprice').html(orderList[0].totalprice);
 			
			let inputmcategory = '';
			let mcategoryorigin = '';
			for(key in Object.keys(orderList[0].maincategory)) {
				mcategoryorigin += Object.keys(orderList[0].maincategory)[key] + ' / ';
			}
			$('#clonediv0').find('p.maincategory').html(mcategoryorigin.slice(0, -2));
			
// 			for(key in Object.keys(orderList[1].maincategory)) {
// 				let inputkey = Object.keys(orderList[1].maincategory)[key];
// 				console.log('확인1 : ', inputkey);
// 				console.log('확인2 : ', Object.keys(orderList[1].maincategory[inputkey][0]));
// 				inputmcategory += orderList[1].maincategory[inputkey];
// 				console.log('key : ', key);
// 				if((key + 1) != orderList[1].maincategory.length) {
// 					inputmcategory += '/'
// 				}
// 			}	
				
// 			const setarray0 = [];
// 			for (k = 0; k < Array.from(new Set(array)).length; k++) {
// 				setarray0.push(Array.from(new Set(array))[k]);
// 				if (k > 0)
// 					setarray0.push(' / ');
// 			}			
//   		$('#clonediv0').find('p.maincategory').html(setarray0);
 		}
		
 		
 		function insertDiv() {	// 클론 div를 이용하여 다른 명세서들 출력
 			for(i = 1; i < orderList.length; i++) {
 			
 				$('.outerdiv').append('<div class="clonediv" id="clonediv' + i + '">' + clonecontainer.html() + '</div>');
 				$('#clonediv' + i).find('.containerName').html('주문번호 : ' + orderList[i].salecode);
 				$('#clonediv' + i).children('.outerstatus2').children('h1').html(orderList[i].status);
 				switch (orderList[i].status) {
 				case 'REQUEST':
 					$('#clonediv' + i).children('.outerstatus2').children('h1').html('요청');
 					break;
 				case 'PROCESSING':
 					$('#clonediv' + i).children('.outerstatus2').children('h1').html('처리중');
 					break;
 				case 'SUCCESS':
 					$('#clonediv' + i).children('.outerstatus2').children('h1').html('완료');
 					break;
 				}
 				
 	 			switch (orderList[i].requesttype) {
 				case 'VISIT':
 					$('#clonediv' + i).find('.requesttype').html('매장방문');	
 					break;
 				default:
 					$('#clonediv' + i).find('.requesttype').html('배달');
 					break;
 				}
 				
 				$('#clonediv' + i).find('p.purchasedate').html(orderList[i].purchasedate);
 				$('#clonediv' + i).find('p.deliverydate').html(orderList[i].deliverydate);
 				$('#clonediv' + i).find('p.totalprice').html(orderList[i].totalprice);
			
 				
 				let mcategoryclone = '';
 				for(key in Object.keys(orderList[i].maincategory)) {
 					mcategoryclone += Object.keys(orderList[i].maincategory)[key] + ' / ';
 				}
 				$('#clonediv' + i).find('p.maincategory').html(mcategoryclone.slice(0, -2));
 			}
 		}
 		

		function openDetail(obj) {		// 모달 활성화
// 			console.log('아이디 : ', obj.parentNode.id);
// 			console.log('replace : ', (obj.parentNode.id).replace('clonediv',''));
			modalexitkey = obj.parentNode.id;
			let detailob = orderList[(obj.parentNode.id).replace('clonediv','')];
			
			console.log('디테일 오비');
			console.log(detailob);
			
			let count = 0;
			let i = 0;
			// 1차 메인카테고리 HashMap array
		      for(mainkey in Object.keys(detailob.maincategory)) {
		         
		    	 
		    	 
		         
		    	 
		         // HashMap [maincategory]를  단일 객체로 분리시켜줍니다.
		         let inputMainKey = Object.keys(orderList[1].maincategory)[mainkey];
		         
		         
		         console.log();
		         console.log('메인카테고리 단일 값');
		         console.log(inputMainKey);
		         console.log();
		         
		         
		         
		         // 서브 카테고리들
		         let subcategories = orderList[1].maincategory[inputMainKey][0];
		         
		         
		         console.log();
		         console.log('서브카테고리 배열의 값');
		         console.log(subcategories)
		         console.log();
		         
		         
		         let j = 0; 
		         // 2차 서브카테고리 HashMap 해제
		         for(subkey in Object.keys(subcategories)){
		         	  
		            
		         	if(i != 0 || j != 0) {
			            // HashMap [subcategory]를  단일 객체로 분리시켜줍니
			           
			          detailmenus.find('.clonedetail').attr('id', 'clonedetail' + (count + 1));   //삭제하는 것도 맡들어야 함
                  	  $('#clonedetail' + count).after(detailmenus.html()); 
			            
			          count++;
		         	}
		         	
		            let inputSubKey = Object.keys(subcategories)[subkey];
			            
			            
			        console.log();
			        console.log('서브카테고리 단일의 값');
			        console.log(inputSubKey);
			        console.log();
			            
					
			            
			        let mainmenus = subcategories[inputSubKey];
		         		
			     	// after은 선택한 영역 뒤에 추가시켜줍니다.
			        // 메인 메뉴 이름  <div> 영역에 추가하기  
			        $('#clonedetail' + count).find('.pmain').html(inputMainKey + '<span class="psubmain"></span>');
			         	
		        	// 서브값 넣기
		            $('#clonedetail' + count).find('.psubmain').html('(' + inputSubKey + ')');
		         	
		            for ( z = 0; z < mainmenus.length; z++ ) {
		               
		               console.log('12세부메뉴 단일 값 : ' + z);
		               console.log(mainmenus[z].name);
		               console.log(mainmenus[z]);
		               
		               console.log(mainmenus[z].quickprice);
		               let quickprice = ( mainmenus[z].quickprice === 0 ) ? '' : mainmenus[z].quickprice + '원';
		               console.log('quick : ' + quickprice);
		               
		               
		               
		               $('#clonedetail' + count).find('.innerdetail').children('h3').each(function(index) {
		            	   switch (index) {
		                     case 0:
		               			$('#clonedetail' + count).find('.outerdetail').children('.innerdetail').eq(z).children('h3').eq(index).html(mainmenus[z].name);
		               			break;
		               			
		                     case 1:
		               			$('#clonedetail' + count).find('.outerdetail').children('.innerdetail').eq(z).children('h3').eq(index).html(mainmenus[z].menuprice + '원');
					   			break;
					   			
		                     case 2:
		               			$('#clonedetail' + count).find('.outerdetail').children('.innerdetail').eq(z).children('h3').eq(index).html(mainmenus[z].amount + '개');
					   			break;
					   			
		                     case 3:
		               			$('#clonedetail' + count).find('.outerdetail').children('.innerdetail').eq(z).children('h3').eq(index).html(mainmenus[z].sumprice + '원');
		               			break;
		            	   }
		               
		            });
		            j++;
		         }
		       i++;  
		      }
		    }
			
			
			
			$('#modal').find('#ableday').html(detailob.ableday);
			$('#modal').find('#deliverydate').html(detailob.deliverydate);
			$('#modal').find('#pickupdate').html(detailob.pickupdate);
			$('#modal').find('#requests').html(detailob.requests);
			$('#modal').find('#originalprice').html(detailob.originalprice + '원');
			$('#modal').find('#totalprice').html(detailob.totalprice + '원');
			$('#modal').find('#totalamount').html(detailob.totalamount + '개');
			$('#modal').find('#discountprice').html('(-) ' + detailob.discountprice + '개');
			$('#modal').find('#quickprice').html('(+) ' + detailob.quickprice + '개');
			
			let mcategorymodal = '';
			let mcatespan = 0;
 			for(key in Object.keys(detailob.maincategory)) {
 				mcategorymodal += Object.keys(detailob.maincategory)[key] + '<br>';
 				mcatespan++;
 			}
			$('#modal').find('#maincategory').html(mcategorymodal);
			$('#modal').find('#maincategory').parent('div').css('height', (30 * mcatespan) + 'px');
			
			let subcategorymodal = '';
			let subcatespan = 0;

			
			let subpath1 = Object.keys(detailob.maincategory);			// 맵 경로 저장
			
// 			for(i = 0; i < Object.keys(detailob.maincategory).length; i++) {	// 선택한 클론div로부터 메인 카테고리들 들고오기
// // 				console.log('반복문1 : ' , subpath1[i]);	// 메인카테고리 출력
// // 				console.log('반복문2 : ' , detailob.maincategory[subpath1[i]][0]);	// 메인카테고리의 키값 가져와서 메인카테고리 안의 value 가져오기
// 																					// 서브메뉴 가져오기
// // 				console.log('길이 : ' , Object.keys(detailob.maincategory[subpath1[i]][0]).length);	// 서부메뉴 키값 길이 가져오기
// 				for(j = 0; j < Object.keys(detailob.maincategory[subpath1[i]][0]).length; j++) {
// // 					console.log('반복문3 : ', Object.keys(detailob.maincategory[subpath1[i]][0]));
// 					subcategorymodal += Object.keys(detailob.maincategory[subpath1[i]][0])[j] + '(' + subpath1[i] + ')' + '<br>';
// 					subcatespan++;
// 				}
// 			}
			$('#modal').find('#subcategory').html(subcategorymodal);
			$('#modal').find('#subcategory').parent('div').css('height', (30 * subcatespan) + 'px');
			
			
			   
			// bDetailSalesVOList 는 volist 수정 후 작업재개!!
// 				$('#modal').find('#maincategory').html(detailob.bDetailSalesVOList[0].maincategory);
// 				$('#modal').find('#subcategory').html(detailob.bDetailSalesVOList[0].subcategory);
// 				$('#modal').find('#menuname').html(detailob.bDetailSalesVOList[0].name);				// vo 속성이랑 이름 다르게 했음
// 				$('#modal').find('#menuamount').html(detailob.bDetailSalesVOList[0].amount + '개');				// vo 속성이랑 이름 다르게 했음
// 				$('#modal').find('#menuprice').html(detailob.bDetailSalesVOList[0].menuprice + '원');
// 				$('#modal').find('#sumprice').html(detailob.bDetailSalesVOList[0].sumprice + '원');

			
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
		
		function searching(obj) {	// 주문번호 검색 기능
			
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
				for(i = $('#detailmenus').children('.clonedetail').length; 1 < i; i--) {
					console.log($('#detailmenus').children('.clonedetail').eq(i - 1).html());
					$('#detailmenus').children('.clonedetail').eq(i - 1).remove();
				}
		});
		
		$(document).keyup(function(e) {		// esc 키 누르면 모달 비할성화
		   if (e.keyCode == 27 || e.which == 27 ) {
				$('#modal').fadeOut(300);
				$('#modalback').fadeOut(300);
		   }
		});
	
		
		// offset	: 페이지 상단으로부터 선택된 요소가 보이는 절대위치를 나타내주는 함수
		// positio	: 부모 객체로부터 떨어진 상대값을 리턴한다
		
		$(document).ready(function() {
    	$(window).scroll( function(){
        $('.clonediv').each( function(i){
            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
//                console.log('$(this).offset().top : ', $(this).offset().top);	// 각각의 clonediv 클래스를 갖는 객체들의 절대위치
//             console.log('$(this).outerHeight() : ', $(this).outerHeight());	// 고정
//             console.log('$(window).scrollTop() : ', $(window).scrollTop());	// 스크롤의 현재 위치
//            console.log('$(window).scrollTop() : ', $(window).width());		// 브라우저 폭 길이 : 고정
//             console.log('$(window).height() : ', $(window).height());		// 브라우저 높이 길이 : 고정
//             if( bottom_of_window > bottom_of_object ){
            if( bottom_of_window > $(this).offset().top ){
                $(this).animate({'opacity':'1'},3000);
            }
        }); 
    });
});

	</script>
</body>
</html>