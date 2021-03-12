<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>businessContaract :: businessPremiumCancel</title>
	<!-- global css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <!-- header css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <!-- preminumCancel css -->
    <link rel="stylesheet" href="${cpath }/business/css/contract/businessPremiumCancel.css"> 	  	
	
	<!-- Axios -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
	<!-- javascript cpath -->
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		function getContextPath() {
		    return sessionStorage.getItem("contextpath");
		}
	</script>
</head>
<body>
	<%@ include file="../main/businessHeader.jsp" %>

	<section style="position: relative;">
		<div id="white-cover"></div>
		<div class="ad_cancel_con">
			<div class="calcel_contract_title">
				<p>프리미엄 광고 계약 해지</p>
			</div>
	
			<div class="ad_cancel_agree_con">
				<div class="ad_cancel_agree_context">
					<p>
						<strong>드럼통 법조 - 계약해지</strong><br>
						① 카드사는 회원의 카드이용대금을 제27조의 결제일에 자동이체결제계좌(단, 통장분실/도난 기타의 사유로 계좌가
						변경될 경우에는 변경 후의 계좌)에서 예금통장, 지급청구서 없이 자동으로 인출하여 결제할 수 있습니다. <br>② 제1항의
						자동이체결제계좌가 대출이 가능한 계좌인 경우에는 그 약정한도 내에서 결제계좌 개설기관과 회원이 약정한 출금우선순위에
						의하여 자동인출하여 결제합니다.<br> ③ 이용대금결제일 현재 잔액부족으로 카드사의 청구금액 전부를 결제할 수 없는 때에는
						이용대금 결제일 이후 매 영업일 또는 카드사가 정하는 출금일에 결제하지 않은 금액(지연배상금 포함)을 제1항 및
						제2항의 방법에 따라 인출, 결제금액에 충당할 수 있습니다.<br> ④ 제1항 내지 제3항에도 불구하고, 결제계좌 개설기관의
						영업 마감시간(16시) 이후에 입금된 금액은 결제계좌 개설기관의 사정에 따라 자동인출되지 않을 수 있습니다. 회원은
						자동납부 업무 마감시간 이후 카드사의 홈페이지 등에서 즉시결제 또는 송금납부(가상계좌 입금 등)를 통해 당일 결제를 할
						수 있습니다.<br> ⑤ 제27조제1항의 카드이용대금 결제일이 토요일 또는 공휴일인 경우에는 카드이용대금 결제일 이후 최초
						도래하는 은행 영업일에 처리합니다.
					</p>
				</div>
				
				<div class="check_cancel_title">
					<label>
						<span>프리미엄 광고 계약 해지에 동의하시겠습니까?</span>
						<input type="checkbox" name="cancel-agree" value="cancel" id="cancel-agree">
					</label>
				</div>
				
				<div class="final_cancel_button">
					<input type="button" value="해지" onclick="checkAgree()">
				</div>
				
<!-- 				<div id="cancel-modal" style="position: absolute; top:0; left:0; width: 500px; height: 0px; background: red; transition: all 1s ease"> -->
				<div id="cancel-modal" style="visibility: hidden">
					<div class="cancel_modal_title">
						<p>비밀번호 재확인</p>
					</div>
					<div class="ad_cancel_agree_con">
						<div class="ad_cancel_agree_context" style="overflow: hidden !important;">
							<div class="agree_context_div">
								<div class="agree_context_title">
									비밀번호
								</div>
								<div class="agree_context_input">
									<input type="text" name="pw" placeholder="비밀번호를 입력해주세요">						
								</div>
							</div>
							<div class="agree_context_div">
								<div class="agree_context_title">
									비밀번호 확인
								</div>
								<div class="agree_context_input">
									<input type="text" name="pwck" placeholder="비밀번호를 다시 입력해주세요">						
								</div>
							</div>
							<div class="modal_button_div">
								<!-- 아래 태그에 비동기 접속하는 함수 구현하여 계약해지 -->
								<input type="button" class="agree_button" value="확인" onclick="#">
								<input type="button" class="agree_button" value="취소" onclick="modalCancel()">
							</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
	</section>
	
	<script type="text/javascript">
	
// 		document.getElementById('cancel-modal').style.height = '500px';	// modal 눌러서 나타나게 할 때
// 		document.getElementById('cancel-modal').style.height = '700px';
	
		function checkAgree() {
			if(document.getElementById('cancel-agree').checked === false)
				alert('프리미엄 광고 계약 해지에 동의하여 주십시오');
			else {
				const cancel_check = confirm('계약을 정말로 해지하시겠습니까?');
				if(cancel_check) {
					document.getElementById('white-cover').style.visibility = 'visible';
					document.getElementById('white-cover').style.width = '0';
					document.getElementById('white-cover').style.height = '0';
					document.getElementById('cancel-modal').style.visibility = 'visible';
				}
			}			
		}
		
		function modalCancel() {
			const modal_cancel_check = confirm('계약 해지 작업을 취솧시겠습니까?');
			if(modal_cancel_check) {
				history.go(0);
			}
		}
		
	</script>
</body>
</html>