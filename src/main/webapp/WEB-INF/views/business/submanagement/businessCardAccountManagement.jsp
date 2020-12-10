<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
 
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: businessCardAccountManagement</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- content css -->
 	<link rel="stylesheet" href="${cpath }/business/css/submanagement/businessCardAccountManagement.css">

	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
	<!-- jQuery CDN -->   	
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
     

<!-- body -->
<body>
	
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
		<!-- sub-header(membership) -->
		<%@ include file="../main/businessSubHeader.jsp" %>
		
		<div>
		<h1 class="subtitle">카드관리</h1>
		<div class="container">
			<div id="carddiv">
				<img id="cardimg">
				<div id="carddiv1" class="flex1">
					<input type="text" readonly="readonly" maxlength="4" placeholder="OOOO">
					<input type="text" readonly="readonly" maxlength="4" placeholder="OOOO">
					<input type="text" readonly="readonly" maxlength="4" placeholder="OOOO">
					<input type="text" readonly="readonly" maxlength="4" placeholder="OOOO">
				</div>
				<div id="carddiv2" class="flex1">
					<input type="text" readonly maxlength="2" placeholder="YY">
					<h1 style="text-align: center; width: 5%;">/</h1>
					<input type="text"  readonly maxlength="2"  placeholder="MM">
					<h1 style="width: 10%; margin-left: 15px">CVC</h1>
					<input type="text"  readonly maxlength="3" placeholder="OOO">
				</div>
			</div>
			<div class="flex2">
				<button onclick="cardChange(this)">변경</button>				
			</div>
			<div class="interiorLine"></div>		
		</div>
		</div>
		
		<div>
		<h1 class="subtitle">계좌관리</h1>
		<div class="container">
			<div id="accountdiv">
				<img id="accountimg">
				<div class="flex3">
					<input type="text" readonly placeholder="계좌번호 입력('-' 제외)">
				</div>
			</div>
			<div class="flex2">
				<button onclick="accountChange(this)">변경</button>				
			</div>
			<div class="interiorLine"></div>		
		</div>
		</div>
	</section>


<script type="text/javascript">

	let paymentLis = null;
	let imagesrcList = null;
	let cardclone = null;
	let accountclone = null;
	
	window.onload = function() {
		
		paymentList = ${paymentList};
		inputcardnum();
		inputaccountnum();
		inputimg();
		console.log('window.location.href :', window.location.href);
		console.log('document.location :', document.location);
		console.log('window.location.hostname :', window.location.hostname);
	}

	function inputcardnum() {
		let carddiv1 = $('#carddiv1');
		let carddiv2 = $('#carddiv2').children('input');
		let cardnum = (paymentList.cardnum).split('-');
		for (i = 0; i < carddiv1.children().length; i++) {
// 			 console.log(bankdiv.find('input').eq(i).val());		// 하위의 하위까지 찾아내기
//  		 console.log(bankdiv.children().eq(i).val());			// 하위만 찾아내기
			 carddiv1.children().eq(i).val(cardnum[i]);
		}
		
		carddiv2.eq(0).val(paymentList.cardyear);
		carddiv2.eq(1).val(paymentList.cardmonth);
		carddiv2.eq(2).val(paymentList.cardcvc);
	}
	
	function inputaccountnum() {
		let accountinput = $('#accountdiv').find('input');
		accountinput.val(paymentList.accountnum);
	}
	
	function inputimg() {
		$('#accountimg').attr('src', '${cpath }/resources/business/img/bank/' + paymentList.accountbank + '.jpg');
		$('#cardimg').attr('src', '${cpath }/resources/business/img/bank/' + paymentList.accountbank + '.jpg');
	}
	
	function cardChange(obj) {
 		cardclone = $('#carddiv').find('input').clone();
 		
		$('#carddiv').find('input').removeAttr('readonly');
		$('#carddiv').find('input').css('backgroundColor', 'white');
		obj.setAttribute('onclick', 'cardSubmit(this)');
		obj.innerHTML = '전송';
		$('#carddiv').find('input').val('');
	}
	
	function cardSubmit(obj) {
		$('#carddiv').find('input').css('backgroundColor', 'grey');
		obj.setAttribute('onclick', 'cardChange(this)');
		obj.innerHTML = '변경';
 		
		cardclone.each(function(index, item) {	// index : 반복문의 i처럼 생각해라 // item : for in 처럼
			$('#carddiv').find('input').eq(index).val($(item).val());
		})
	}
	
	function accountChange(obj) {
		accountclone = $('#accountdiv').find('input').clone();
 		
		$('#accountdiv').find('input').removeAttr('readonly');
		$('#accountdiv').find('input').css('backgroundColor', 'white');
		obj.setAttribute('onclick', 'accountSubmit(this)');
		obj.innerHTML = '전송';
		$('#accountdiv').find('input').val('');
	}
	
	function accountSubmit(obj) {
		$('#accountdiv').find('input').css('backgroundColor', 'grey');
		obj.setAttribute('onclick', 'accountChange(this)');
		obj.innerHTML = '변경';
 		
		$('#accountdiv').find('input').val(accountclone.val());
	}
</script>


</body>
</html>