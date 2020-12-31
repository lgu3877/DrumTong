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
					<h1 id="cardbank"></h1>
					<select id="cardbanksel" style="display: none">
						<option selected>카드를 선택하세요</option>
						<option value='삼성카드'>삼성카드</option>
						<option value='신한카드'>신한카드</option>
						<option value='현대카드'>현대카드</option>
						<option value='외환카드'>외환카드</option>
						<option value='하나카드'>하나카드</option>
						<option value='롯데카드'>롯데카드</option>
						<option value='전북카드'>전북카드</option>
						<option value='제주카드'>제주카드</option>
						<option value='광주카드'>광주카드</option>
						<option value='씨티카드'>씨티카드</option>
						<option value='NH카드'>NH카드</option>
						<option value='조흥(강원)카드'>조흥(강원)카드</option>
					</select>
				<div id="carddiv1" class="flex1">
					<input type="text" readonly="readonly" maxlength="4" placeholder="OOOO" onkeyup="inputnumck(this)">
					<input type="text" readonly="readonly" maxlength="4" placeholder="OOOO" onkeyup="inputnumck(this)">
					<input type="text" readonly="readonly" maxlength="4" placeholder="OOOO" onkeyup="inputnumck(this)">
					<input type="text" readonly="readonly" maxlength="4" placeholder="OOOO" onkeyup="numck(this)">
				</div>
				<div id="carddiv2" class="flex1">
					<input type="text" maxlength="2" placeholder="YY" id="cardyear" onkeyup="numck(this)" readonly >
					<h1 style="text-align: center; width: 5%;">/</h1>
					<input type="text"  maxlength="2"  placeholder="MM"  id="cardmonth"  onkeyup="numck(this)" readonly >
					<h1 style="width: 10%; margin-left: 15px">CVC</h1>
					<input type="text"  maxlength="3" placeholder="OOO" id="cardcvc"  onkeyup="numck(this)" readonly >
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
				<h1 id="accountbank"></h1>
					<select id="accountbanksel" style="display: none">
						<option selected>카드를 선택하세요</option>
						<option value='Sinhan'>신한은행</option>
						<option value='Kyungnam'>경남은행</option>
						<option value='KB'>국민은행</option>
						<option value='IBK'>기업은행</option>
						<option value=Nonghyup>농협은행</option>
						<option value='Busan'>부산은행</option>
					</select>
				<div class="flex3">
					<input type="text" readonly placeholder="계좌번호 입력('-' 제외)" onkeyup="numck(this)" maxlength="25">
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
		inputsubtitle();
	}

	function inputcardnum() {	// 카드번호를 input에 넣는 함수
		let carddiv1 = $('#carddiv1');
		let carddiv2 = $('#carddiv2').children('input');
		let cardnum = (paymentList.cardnum).split('-');
		for (i = 0; i < carddiv1.children().length; i++) {
			 carddiv1.children().eq(i).val(cardnum[i]);
		}
		carddiv2.eq(0).val(paymentList.cardyear);
		carddiv2.eq(1).val(paymentList.cardmonth);
		carddiv2.eq(2).val(paymentList.cardcvc);
	}
	
	function inputaccountnum() {	// 계좌번호를 input에 넣는 함수
		let accountinput = $('#accountdiv').find('input');
		accountinput.val(paymentList.accountnum);
	}
	
	function inputsubtitle() {		// 은행 및 카드 종류 입력하기
		$('#cardbank').html(paymentList.cardbank);
		$('#accountbank').html(paymentList.accountbank);
	}
	
	function cardChange(obj) {		// 카드번호 변경 폼 활성화
 		cardclone = $('#carddiv').find('input').clone();
 		
 		$('#carddiv').find('select').css('border', '3px solid #3088F9');
		$('#carddiv').find('input').removeAttr('readonly');
		$('#carddiv').find('input').css('backgroundColor', 'white');
		$('#carddiv').find('input').css('border', '3px solid #3088F9');
		obj.setAttribute('onclick', 'cardSubmit(this)');
		obj.innerHTML = '전송';
		$('#carddiv').find('input').val('');
		
		$('#cardbank').css('display', 'none');
		$('#cardbanksel').css('display', '');
	}
	
	function cardSubmit(obj) {		// 카드번호 변경
	
		let cardConfirm = confirm('정말로 카드번호를 변경하시겠습니까?');
		if (cardConfirm == false) {
			return false;
		}
		
		let exit = true;
		let cardnumsum = '';
		$('#carddiv1').find('input').each(function(index, item) {	// index : 반복문의 i처럼 생각해라 // item : for in 처럼
			cardnumsum += $(item).val();
			if(index < 3)
				cardnumsum += '-';
			
			if(($(item).val()).length < 4) {
				alert('카드번호를 전부 채워주시길 바랍니다');
				exit = false;
				return false;
			}
		})
		$('#carddiv2').find('input').each(function(index, item) {
			if($(item).val().length < $(item).attr('maxLength')) {
				exit = false;
			}
		})	
		
		
		if(!exit)
			return false;
				
		let ob={
					'cardbank' : $('#cardbanksel').val(),
					'cardnum' : cardnumsum,
					'cardyear' : $('#cardyear').val(),
					'cardmonth' : $('#cardmonth').val(),
					'cardcvc' : $('#cardcvc').val(),
		      	};
		
        const axPost = async (ob) => {   // async : 비동기 실행 함수
            await axios.post('/drumtong/business/subManagement/BPayment/rest/updateCard/' , ob)
            // 정상
       		.then( (response) => {
            const data = response.data;
            
            if (data == false) {
            	return false;
            }
            else {
            	$('#carddiv').find('select').css('border', '');
	    		$('#carddiv').find('input').css('backgroundColor', '#adb8c0');
	    		$('#carddiv').find('input').css('border', '');
    			obj.setAttribute('onclick', 'cardChange(this)');
    			obj.innerHTML = '변경';
    			$('#cardbank').css('display', '');
    			$('#cardbank').html($('#cardbanksel option:selected').val());
    			$('#cardbanksel').css('display', 'none');
            }
             })
          }
		return axPost(ob);			
	}
	
	
	function accountChange(obj) {	// 계좌번호 번호 폼 활성화
		accountclone = $('#accountdiv').find('input').clone();
 		
		$('#accountdiv').find('select').css('border', '3px solid #3088F9');
		$('#accountdiv').find('input').removeAttr('readonly');
		$('#accountdiv').find('input').css('backgroundColor', 'white');
		$('#accountdiv').find('input').css('border', '3px solid #3088F9');
		obj.setAttribute('onclick', 'accountSubmit(this)');
		obj.innerHTML = '전송';
		$('#accountdiv').find('input').val('');
		
		$('#accountbank').css('display', 'none');
		$('#accountbanksel').css('display', '');
	}
	
	function accountSubmit(obj) {	// 계좌번호 서브밋
		
		let acConfirm = confirm('정말로 계좌번호를 변경하시겠습니까?');
		if (acConfirm == false) {
			return false;
		}
		
		let ob={
				'accountbank' : $('#accountbanksel option:selected').val(),
				'accountnum' : $('#accountdiv').find('input').val(),
	      	};
		
		  const axPost = async (ob) => {   // async : 비동기 실행 함수
	            await axios.post('/drumtong/business/subManagement/BPayment/rest/updateAccount/' , ob)
	            // 정상
	       		.then( (response) => {
	            const data = response.data;
	            
	            if (data == false) {
	            	return false;
	            }
	            else {
	            	$('#accountdiv').find('select').css('border', '');
	        		$('#accountdiv').find('input').css('backgroundColor', '#adb8c0');
	        		$('#accountdiv').find('input').css('border', '');
	        		obj.setAttribute('onclick', 'accountChange(this)');
	        		obj.innerHTML = '변경';
	        		
	        		$('#accountbank').css('display', '');
	    			$('#accountbank').html($('#accountbanksel option:selected').val());
	        		$('#accountbanksel').css('display', 'none');
	            }
	             })
	          }
			return axPost(ob);			
	}
	
	function inputnumck(obj) {	// 카드번호 숫자만 입력될 수 있도록 'onkeyup'
		numck(obj);
		if(obj.value.length > 3) {
			obj.nextElementSibling.focus();
		}
	}
	
	function numck(obj) {	// 숫자 이외의 값이 입력되면 제거
		let pattern = /[^(0-9)]/gi;   // 숫자이외는 제거
// 		 /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9)]/gi;   // 특수문자 제거
		if(isFinite(obj.value) == false) {
			alert('숫자만 입력할 수 있습니다');
			return  obj.value = (obj.value).replace(pattern,"");
		}
	}
</script>


</body>
</html>