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
			
			<div class="topdatediv">
				<input type="date">
				<div style="width: 20%"></div>
				<input type="date">
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
			
			<div class="sidecontainer">
				<div>
					<button onclick="checkrequest(this)">처&nbsp&nbsp리</button>
				</div>
				<div>
					<button onclick="checkcancle(this)">취&nbsp&nbsp소</button>
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
		
		<div class="detailattr">
			<h1 style="border-left: 1px solid #afafaf">메뉴</h1>
			<h1>수량</h1>
			<h1>배달 가격</h1>
			<h1>단일 가격</h1>
			<h1>합계 가격</h1>
		</div>
		<div class="detailmenus" id="detailmenus">
			<div class="clonedetail" id="clonedetail0">
				<p class="pmain"><span class="psubmain"></span></p>
				<div class="outerdetail">
					<div class="innerdetail">
					<i class="fas fa-motorcycle fa-x"></i>
						<h3></h3>
						<h3></h3>
						<h3 style="text-align: right"></h3>
						<h3 style="text-align: right"></h3>
						<h3 style="text-align: right"></h3>
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
		    <div class="popupactive" id="popupactive">
		    	<button onclick="checkcancle(this)">취소</button>
		    	<div style="width: 20%"></div>
		    	<button onclick="checkrequest(this)">처리</button>
		    </div>
		<hr>
	</div>
	
	<script type="text/javascript">
		
		let orderList = ${orderList};							// 서버에서 가져오는 주문현황 리스트
		let clonecontainer = $('#clonediv0');					// id="clonediv0" 복사 -> 오리지널 주문현황 카드
																// 이 복사한 개체를 이용하여 다른 카드들의 폼을 자동으로 형성함
		let detailmenus = $('#detailmenus').clone();			
	 	let innerclone = $('#detailmenus').find('.outerdetail').clone();	// 모달 -> 상세주문(=메뉴명, 가격, 개수 등등) 폼의 오리지널을 복사
																			// 복사한 개체를 이용하여 모달에서 상세주문 부분들을 자동으로 형성함
		let pageFilter = '';		// 아직 미구현
		
		console.log(orderList);
		
 		window.onload = function() {
 			originclone();	// 메인화면에서 나타나는 메인 주문형황 카드들의 오리지날이 되는 폼에 들어가야할 값을 입력함
  			insertDiv();	// 오리지널 메인 주문현황 카드를 복사하여 나머지 메인 주문현황 카드들을 생성함
  			
  			$('div.outerdiv').find('.container').each(function(index, item) {	// 메인 주문내역(=container) 위의 라벨에도 똑같이 :hover 효과주기 위해서 
  				$(item).hover(function() {	// 메인 주문현황 카드에 마우스를 올릴때 애니메이션 효과
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
 		
 		function originclone() {	// 메인 주문현황 카드 중에서 오리지널에 해당하는 하나의 카드에 들어갈 값을 입력
 									// 따라서, orderList[0] 의 값들만을 사용함
 									
 			$('#clonediv0').find('.containerName').html('주문번호 : ' + orderList[0].salecode);
 			
			switch (orderList[0].status) {			// 주문상태
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
 			
 			switch (orderList[0].requesttype) {		// 주문유형
			case 'VISIT':
				$('#clonediv0').find('.requesttype').html('매장방문');	
				break;
			default:
				$('#clonediv0').find('.requesttype').html('배달');
				break;
			}
 			
 			$('#clonediv0').find('p.purchasedate').html(orderList[0].purchasedate);		// 주문일자
 			$('#clonediv0').find('p.deliverydate').html(orderList[0].deliverydate);		// 배송일자
 			$('#clonediv0').find('p.totalprice').html(numberWithCommas(orderList[0].totalprice) + '원');			// 총가격
 			
			let mcategoryorigin = '';		// 메인 카테고리
			for(key in Object.keys(orderList[0].maincategory)) {
				mcategoryorigin += Object.keys(orderList[0].maincategory)[key] + ' / '; 	// '메인A / 메인B / 메인C / ' 
			}
			
			if(mcategoryorigin.slice(0, -2).length < 10)
				$('#clonediv0').find('p.maincategory').html(mcategoryorigin.slice(0, -2));		// '메인A / 메인B / 메인C'
			else
				$('#clonediv0').find('p.maincategory').html(mcategoryorigin.substring(0, 10) + '...');
			
			$('#clonediv0').find('.sidecontainer').find('button').each(function(index, item) {
				$(item).attr('name', orderList[0].salecode);
			});
 		}
		
 		
 		function insertDiv() {	// 오리지널 메인 주문현황 카드(=orderList[0]의 정보를 담은 카드)를 이용하여 다른 카드들 생성
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
 				$('#clonediv' + i).find('p.totalprice').html(numberWithCommas(orderList[i].totalprice) + '원');
			
 				
 				let mcategoryclone = '';
 				for(key in Object.keys(orderList[i].maincategory)) {
 					mcategoryclone += Object.keys(orderList[i].maincategory)[key] + ' / ';
 				}
 				
 				if(mcategoryclone.slice(0, -2).length < 10)
	 				$('#clonediv' + i).find('p.maincategory').html(mcategoryclone.slice(0, -2));
 				else
 					$('#clonediv' + i).find('p.maincategory').html(mcategoryclone.substring(0, 10) + '...');
 				
 				$('#clonediv' + i).find('.sidecontainer').find('button').each(function(index, item) {
 					$(item).attr('name', orderList[i].salecode);
 				});
 			}
 		}
 		
 	    function openDetail(obj) {      // 상세한 주문현황 정보를 제공하는 모달 활성화
 	    	  				
 	         let detailob = orderList[(obj.parentNode.id).replace('clonediv','')];
 	         // 메인 주문형황 카드를 클릭했을 때, 그 카드가 가지고 있는 id 값에서 마지막 숫자값만 가지고 옴
 	         // 그 숫자를 이용해서 orderList[] 를 가지고 온다
 	         
 	         let totalquickprice = 0;	// 전체 배달가격 객체 
 	         let count = 0;
 	         let i = 0;
 	         
 	         $('#popupactive').children('button').each(function(index, item) {
 	        	 $(item).attr('name', detailob.salecode);
 	         });
 	         
 	         // 1차 메인카테고리 HashMap array
 	            for(mainkey in Object.keys(detailob.maincategory)) {
 	              
 	               // HashMap [maincategory]를  단일 객체로 분리시켜줍니다.
 	               let inputMainKey = Object.keys(detailob.maincategory)[mainkey];
 	               // orderList[숫자].maincategory 를 HashMap 형태를 가지고 있음
 	               // 그래서, Object.keys()로 키값을 가지고 온 후, 키값을 사용하여 .maincategory의 값을 호출함
 	               
 	               // 서브 카테고리들
 	               let subcategories = detailob.maincategory[inputMainKey];	// 서브메뉴
 	               // 위에서 호출한 값을 키값으로 사용하여 배열형태의 서브카테고리를 가지고 온다
 	               // 즉, 메인카테고리(1) / 서브카테고리(n)	-> 1:n의 관계가 성립되고 있음
 	               
 	               let j = 0; 
 	               // 2차 서브카테고리 HashMap 해제
 	               for(subkey in Object.keys(subcategories)){
 	                    
 	                  if(i != 0 || j != 0) {
 	                     // HashMap [subcategory]를  단일 객체로 분리시켜줍니
	 	                   detailmenus.find('.clonedetail').attr('id', 'clonedetail' + (count + 1));
 		                   $('#clonedetail' + count).after(detailmenus.html()); 
 	    	               count++;
 	                  }
 	                  
 	                 let inputSubKey = Object.keys(subcategories)[subkey];
 	                 let mainmenus = subcategories[inputSubKey];
 	                     
 	                 // after은 선택한 영역 뒤에 추가시켜줍니다.
 	                 // 메인 메뉴 이름  <div> 영역에 추가하기  
 	                 $('#clonedetail' + count).find('.pmain').html(inputMainKey + '<span class="psubmain"></span>');
 	                     
 	                 // 서브값 넣기
 	                  $('#clonedetail' + count).find('.psubmain').html('(' + inputSubKey + ')');
 	                  
 	                  for ( z = 0; z < mainmenus.length; z++ ) {
 	                	totalquickprice += mainmenus[z].quickprice;	// 총 배달가격 계산
 	                	  
 	                    if(z > 0)	// 만약 서브카테고리에 저장된 메뉴가 1개보다 많을 때 사용
	  						$('#clonedetail' + count).find('.outerdetail').append(innerclone.html());
 	                     
 	                     $('#clonedetail' + count).find('.innerdetail').children('h3').each(function(index, item) {
 	                    	 if(mainmenus[z].quickprice == 0)	// 배달가격이 0원이면 오토바이 안보이기
 	                    		$('#clonedetail' + count).find('i').css('display', 'none');
 	                    	 
 	                        switch (index) {
 	                           case 0:
 	                              $('#clonedetail' + count).find('.outerdetail').children('.innerdetail').eq(z).children('h3').eq(index).html(mainmenus[z].name);
 	                              	break;
 	                              
 	                           case 1:
 	                              $('#clonedetail' + count).find('.outerdetail').children('.innerdetail').eq(z).children('h3').eq(index).html(mainmenus[z].amount + '개');
 	                       		    break;
 	                           case 2:
 	                        	  $('#clonedetail' + count).find('.outerdetail').children('.innerdetail').eq(z).children('h3').eq(index).html(numberWithCommas(mainmenus[z].quickprice) + '원');
 		                           break;
 	                           case 3:
 	                              $('#clonedetail' + count).find('.outerdetail').children('.innerdetail').eq(z).children('h3').eq(index).html(numberWithCommas(mainmenus[z].menuprice) + '원');
 		                           break;
 	                           case 4:
 	                              $('#clonedetail' + count).find('.outerdetail').children('.innerdetail').eq(z).children('h3').eq(index).html(numberWithCommas(mainmenus[z].sumprice + mainmenus[z].quickprice) + '원');
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
 	         $('#modal').find('#originalprice').html(numberWithCommas(detailob.originalprice) + '원');
 	         $('#modal').find('#discountprice').html('(-) ' + numberWithCommas(detailob.discountprice) + '원');
 	         $('#modal').find('#quickprice').html('(+) ' + numberWithCommas(totalquickprice) + '원');
 	         $('#modal').find('#totalprice').html(numberWithCommas(detailob.totalprice) + '원');
 	         $('#modal').find('#totalamount').html(detailob.totalamount + '개');
 	         
 	         $('#modal').fadeIn(300);
 	         $('#modalback').fadeIn(300);
 	         
 	      }

 	  	function numberWithCommas(x) {		// 천단위 콤마
 			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	 	}


		function upperbtn() {	// 맨 위로 이동하는 버튼
			$('html, body').animate({scrollTop : 0},2000);
		}
		
		function chStatus(obj, filter) {	// 필터 버튼
											// 상단의 처리, 요청중, 완료 버튼을 클릭하면 배경색이 하늘색으로 변함
			if(pageFilter.indexOf(filter) == -1)
				pageFilter += filter;

			obj.className = 'selectedStatus';
			obj.setAttribute("onclick", "deleteStatus(this,'"  + filter + "')");
		}
		
		function deleteStatus(obj, filter) {	// 필터 버튼
												// 상단의 처리, 요청중, 완료 버튼을 클릭하면 배경색이 흰색으로 변함
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
				exitremove();
		});
		
		$(document).keyup(function(e) {		// esc 키 누르면 모달 비할성화
		   if (e.keyCode == 27 || e.which == 27 ) {
				$('#modal').fadeOut(300);
				$('#modalback').fadeOut(300);
				exitremove();
		   }
		});
		
		function exitremove() {	// 모달 비활성화 할때에 모달에 있는 내용들 지워주는 역할
			for(i = $('#detailmenus').children('.clonedetail').length; 1 < i; i--) {
				// 메인 카테고리가 여러가지 있다면, clonedetail 이라는 이름을 가진 				
				$('#detailmenus').children('.clonedetail').eq(i - 1).remove();
			}
			if(1 < $('#detailmenus').children('.clonedetail').find('.innerdetail').length) {
				$('#detailmenus').children('.clonedetail').find('.innerdetail').each(function(index, item) {
					if(index != 0)
						$(item).remove();
				});
			}
		}
		
		function checkcancle(obj) {			// 주문취소 confirm 실행문
			let checkcancle = confirm('주문을 취소하시겠습니까?');
			if(checkcancle == true)
				window.open('./PopUpWindow/cancle/' + obj.name + '/', '주문취소팝업', 'width=700px,height=620px,scrollbars=yes');
		}
		
		function checkrequest(obj) {		// 주문처리 confirm 실행문
			let checkrequest = confirm('주문을 수락하시겠습니까?');
			if(checkrequest == true)
				window.open('./PopUpWindow/process/' + obj.name + '/', '주문처리팝업', 'width=700px,height=620px,scrollbars=yes');
		}
		
		// offset	: 페이지 상단으로부터 선택된 요소가 보이는 절대위치를 나타내주는 함수
		// positio	: 부모 객체로부터 떨어진 상대값을 리턴한다
		
		$(document).ready(function() {
    	$(window).scroll( function(){
        $('.clonediv').each( function(i){
            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
//             console.log('$(this).offset().top : ', $(this).offset().top);	// 각각의 clonediv 클래스를 갖는 객체들의 절대위치
//             console.log('$(this).outerHeight() : ', $(this).outerHeight());	// 고정
//             console.log('$(window).scrollTop() : ', $(window).scrollTop());	// 스크롤의 현재 위치
//             console.log('$(window).scrollTop() : ', $(window).width());		// 브라우저 폭 길이 : 고정
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