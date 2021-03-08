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
 	<%-- <link rel="stylesheet" href="${cpath }/business/css/submanagement/businessCardAccountManagement.css"> --%>
	
	<!-- contents css (revised) -->
 	<link rel="stylesheet" href="${cpath }/business/css/submanagement/businessPaymentManagement.css">

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

	<!-- 카드 -->
	<!-- 
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
						<input type="text" readonly="readonly" maxlength="4"
							placeholder="OOOO" onkeyup="inputnumck(this)"> <input
							type="text" readonly="readonly" maxlength="4" placeholder="OOOO"
							onkeyup="inputnumck(this)"> <input type="text"
							readonly="readonly" maxlength="4" placeholder="OOOO"
							onkeyup="inputnumck(this)"> <input type="text"
							readonly="readonly" maxlength="4" placeholder="OOOO"
							onkeyup="numck(this)">
					</div>
					<div id="carddiv2" class="flex1">
						<input type="text" maxlength="2" placeholder="YY" id="cardyear"
							onkeyup="numck(this)" readonly>
						<h1 style="text-align: center; width: 5%;">/</h1>
						<input type="text" maxlength="2" placeholder="MM" id="cardmonth"
							onkeyup="numck(this)" readonly>
						<h1 style="width: 10%; margin-left: 15px">CVC</h1>
						<input type="text" maxlength="3" placeholder="OOO" id="cardcvc"
							onkeyup="numck(this)" readonly>
					</div>
				</div>
				<div class="flex2">
					<button onclick="cardChange(this)">변경</button>
				</div>
				<div class="interiorLine"></div>
			</div>
		</div>
	 -->
		
		<!-- 카드 수정본 -->
		<div class="container">
			<div class="subtitle_container">
				<span class="subtitle">카드관리</span>
			</div>
			<div class="content_contaienr form">
				<div id="carddiv">
				<!-- 카드사 이름 -->
					<h1 id="cardbank"></h1>
					
				<!-- 카드사 선택  -->
					<div id="cardbankcon" class="flex1" style="display: none">
						<div class="card_input_title">
							카드사
						</div>
						<select id="cardbanksel">
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
					</div>
					
				<!-- 카드번호 16자리 (4 * 4) -->
					<div class="flex1">
						<div class="card_input_title">
							카드번호
						</div>
						<div id="carddiv1" class="card_number_input_con">
							<input type="text" readonly="readonly" maxlength="4" placeholder="1234" onkeyup="inputnumck(this)"> 
							<input type="text" readonly="readonly" maxlength="4" placeholder="1234" onkeyup="inputnumck(this)"> 
							<input type="text" readonly="readonly" maxlength="4" placeholder="1234" onkeyup="inputnumck(this)"> 
							<input type="text" readonly="readonly" maxlength="4" placeholder="1234" onkeyup="numck(this)">
						</div>
					</div>
				
				<!-- 카드만료일 (YY / MM) -->
					<div class="flex1">
						<div class="card_input_title">
							카드만료일
						</div>
						<div id="carddiv2" class="card_exdate_input">
							<input type="text" maxlength="2" placeholder="YY" id="cardyear" onkeyup="numck(this)" readonly>
							<div>/</div>
							<input type="text" maxlength="2" placeholder="MM" id="cardmonth" onkeyup="numck(this)" readonly>
						</div>
					</div>
					
				<!-- CCV -->
					<div class="flex1">
						<div class="card_input_title">
							CCV
						</div>
						<div id="carddiv3">
							<input type="text" maxlength="3" placeholder="ccv" id="cardcvc" onkeyup="numck(this)" readonly>
						</div>
					</div>
					
				</div>
				
				<!-- 버튼 -->
				<div class="flex2">
					<button onclick="cardChange(this)">변경</button>
				</div>
			</div>
		</div>

	<!-- 계좌 -->
		<div class="container">
			<div class="subtitle_container">
				<span class="subtitle">계좌관리</span>
			</div>
			<div class="content_contaienr form">
				<div id="accountdiv">
				<!-- 계좌명 -->
					<h1 id="accountbank"></h1>
						
				<!-- 계좌선택 > 은행 리스트  -->
					<div id="accountbankcon" class="flex1" style="display: none">
						<div class="bank_input_title">
							은행명
						</div>			
						<select id="accountbanksel">
							<option selected>카드를 선택하세요</option>
							<option value='Sinhan'>신한은행</option>
							<option value='Kyungnam'>경남은행</option>
							<option value='KB'>국민은행</option>
							<option value='IBK'>기업은행</option>
							<option value=Nonghyup>농협은행</option>
							<option value='Busan'>부산은행</option>
						</select>
					</div>
				<!-- 계좌번호 입력 input -->
					<div class="flex3">
						<div class="bank_input_title">
							계좌번호
						</div>
						<input type="text" readonly placeholder="계좌번호 입력('-' 제외)" onkeyup="numck(this)" maxlength="25">
					</div>
				</div>
				
			<!-- 버튼 -->
				<div class="flex2">
					<button onclick="accountChange(this)">변경</button>
				</div>
			</div>
		</div>
		
	<!-- 계좌 백업 -->
	<!-- 
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
						<input type="text" readonly placeholder="계좌번호 입력('-' 제외)"
							onkeyup="numck(this)" maxlength="25">
					</div>
				</div>
				<div class="flex2">
					<button onclick="accountChange(this)">변경</button>
				</div>
				<div class="interiorLine"></div>
			</div>
		</div>
	 -->
	 
	</section>

	<!-- 전역변수 & 초기 실행 & 공통함수 -->
	<script type="text/javascript">
		// 전역변수
		const paymentList = ${paymentList};
		let accountclone = null;
		let imagesrcList = null;
		let cardclone = null;

		// 초기실행
		window.onload = () => {
			fillCardInfo();
			inputAccountNumber();
			inputsubtitle();
		};
	
		// 공통함수
		function inputsubtitle() {		// 은행 및 카드 종류 입력하기
			$('#cardbank').html(paymentList.cardbank);
			$('#accountbank').html(paymentList.accountbank);
		}
	
	
		function numck(obj) {	// 숫자 이외의 값이 입력되면 제거
			let pattern = /[^(0-9)]/gi;   // 숫자이외는 제거
//			 /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9)]/gi;   // 특수문자 제거
			if(isFinite(obj.value) == false) {
				alert('숫자만 입력할 수 있습니다');
				return  obj.value = (obj.value).replace(pattern,"");
			}
		}
	</script>
	
	<!-- 카드 -->
	<script type="text/javascript" src="${cpath }/business/js/submanagement/businessCard.js"></script>

	<!-- 계좌 -->
	<script type="text/javascript" src="${cpath }/business/js/submanagement/businessBankAccount.js"></script>

	<!-- 비동기 요청 -->
	<script type="text/javascript" src="${cpath }/business/js/submanagement/businessPaymentUpdate.js"></script>

</body>
</html>