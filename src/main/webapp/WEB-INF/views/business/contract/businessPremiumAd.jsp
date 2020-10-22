<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- title -->
  	<title>Login :: Laundry</title>
  	
  	<!-- global css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <!-- header css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <!-- preminumAd css -->
    <link rel="stylesheet" href="${cpath }/business/css/contract/businessPreminumAd.css"> 	  	
	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	
	<!-- Axios -->
	<!-- <script src="https://unpkg.com/axios/dist/axios.min.js"></script> -->
</head>


<body>
	
	<!-- header -->
	<%@ include file="../main/businessHeader.jsp"%>

	<!-- Premium Contract -->
	<section>
	
		<div class="ad_contract_con">
			<!-- title -->
			<div class="ad_contract_title">
				<p>프리미엄 광고 서비스 신청</p>
			</div>
			
			<!-- form -->
			<form class="ad_contract_form" action="#" method="POST">
				<!-- card info input -->
				<div class="ad_contract_card_input_con">	
					<div>
					<!-- card company input -->
						<div class="card_input_title"><i class="fas fa-credit-card"></i>카드회사<span class="red-mark">*</span></div>
						<div>
							<select class="card_company_select" name="cardbank">
								<option hidden="true">등록하실 카드회사를 선택해주세요.</option>
								<option value="신한">신한</option>
								<option value="현대">현대</option>
								<option value="하나">하나</option>
								<option value="우리">우리</option>
								<option value="국민">국민</option>
								<option value="농협">농협</option>
								<option value="롯데">롯데</option>
								<option value="기타">기타</option>
							</select>
						</div>	
					<!-- card number input -->	
						<div class="card_input_title"><i class="fas fa-digital-tachograph"></i>카드번호<span class="red-mark">*</span></div>
						<div class="card_number_con">
							<input class="card_number_input" type="text" name="cardnum1" maxlength="4" placeholder="****" />
							<input class="card_number_input" type="text" name="cardnum2" maxlength="4" placeholder="****"/>
							<input class="card_number_input" type="text" name="cardnum3" maxlength="4" placeholder="****" />
							<input class="card_number_input" type="text" name="cardnum4" maxlength="4" placeholder="****" />
						</div>
						<div class="input_subcon">
					<!-- ex-date input -->
							<div class="input_subcon_left">
								<div class="card_input_title"><i class="far fa-calendar-alt"></i>카드만료(년/월)<span class="red-mark">*</span></div>
								<div class="input_subcon">
									<input class="card_exdate_input" type="text" name="cardnum1" maxlength="2" placeholder="YY" />
									<input class="card_exdate_input" type="text" name="cardnum2" maxlength="2" placeholder="MM" />
								</div>
							</div>
					<!-- ccv input -->
							<div class="input_subcon_right">
								<div class="card_input_title"><i class="fab fa-expeditedssl"></i>CCV<span class="red-mark">*</span></div>
								<div class="input_subcon">
									<input class="card_ccv_input" type="text" name="cardnum1" maxlength="3" placeholder="***" />
								</div>
							</div>	
						</div>
					</div>
					<div class="ad_agree_con">
						<div class="ad_agree_context">
							<p>
								<span class="ad_agree_title"><b>제28조(자동이체결제)</b></span><br>
								① 카드사는 회원의 카드이용대금을 제27조의 결제일에 자동이체결제계좌(단, 통장분실/도난
								기타의 사유로 계좌가 변경될 경우에는 변경 후의 계좌)에서 예금통장, 지급청구서 없이 자동으로 인출하여 결제할 수
								있습니다. ② 제1항의 자동이체결제계좌가 대출이 가능한 계좌인 경우에는 그 약정한도 내에서 결제계좌 개설기관과
								회원이 약정한 출금우선순위에 의하여 자동인출하여 결제합니다. ③ 이용대금결제일 현재 잔액부족으로 카드사의 청구금액
								전부를 결제할 수 없는 때에는 이용대금 결제일 이후 매 영업일 또는 카드사가 정하는 출금일에 결제하지 않은
								금액(지연배상금 포함)을 제1항 및 제2항의 방법에 따라 인출, 결제금액에 충당할 수 있습니다. ④ 제1항 내지
								제3항에도 불구하고, 결제계좌 개설기관의 영업 마감시간(16시) 이후에 입금된 금액은 결제계좌 개설기관의 사정에
								따라 자동인출되지 않을 수 있습니다. 회원은 자동납부 업무 마감시간 이후 카드사의 홈페이지 등에서 즉시결제 또는
								송금납부(가상계좌 입금 등)를 통해 당일 결제를 할 수 있습니다. ⑤ 제27조제1항의 카드이용대금 결제일이 토요일
								또는 공휴일인 경우에는 카드이용대금 결제일 이후 최초 도래하는 은행 영업일에 처리합니다.
							</p>
						</div>
						<!-- agreement checkbox -->
						<div class="card_agree_title">
							<label>
								<span>월 정기 결제 서비스를 이용합니다.</span>
								<input class="card_agree_chbox" type="checkbox" name="agree" value="adAgree">
							</label>
						</div>
					</div>
					<!-- submit -->
					<div>
						<div>
							<input class="ad_contract_submit_btn" type="submit" value="확인" />
						</div>		
					</div>
				</div>
			</form>
		</div>
		
	</section>
	
	<!-- footer -->
	<%@ include file="../main/businessFooter.jsp"%>

	<script type="text/javascript">
		// auto focus shift for card number
		document.getElementById('').keyup(function() {
			let charLimit = this.getAttribute("maxlength");
			console.log(charLimit);
		})
		
		
		
		/* $('.input-num-size').keyup (function () {
        var charLimit = $(this).attr("maxlength");
        console.log(charLimit);
        if (this.value.length >= charLimit) {
            console.log(this.value.length);
            $(this).next().next().next('.input-num-size').focus();
            return false;
        }
    }); */
		
		// sum of card numbers
		
		// sum of card ex-date
		
	</script>

</body>
</html>