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
    <!-- account find css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessAccountFind.css"> 	  	
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css">
	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  	
  	<!-- Axios -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>


<body>


	<%@ include file="../main/businessHeader.jsp"%>


	<section>
		<!-- Login -->
		<div class="search_inner">

			<!-- Account Search -->
			<div class="account_searchbox">
				<div class="search_title title">아이디 찾기</div>
				<div class="search_option_con">
					<ul>
					
					<!-- Name & Email -->

					<li class="search_options" onclick='openForm("email-search")'><i id="email-search-icon" class="fas fa-angle-down"></i><div>이메일로 찾기</div></li>
					<li id="email-search" class="search_input_con" style="display: none">
						<form action="${cpath }/business/membership/businessIDFind/" method="POST">
							<input type="hidden" name="option" value="NameEmail" />
							<div>
								<div class="search_input_label">이름</div>
								<input class="single_input" type="text" name="name" required="required" placeholder="이름을 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">이메일</div>
								<input class="single_input" type="text" name="email" required="required" placeholder="이메일을 적어주세요." />
							</div>
							<div>
								<input class="single_input" type="submit" value="확인" />
							</div>
						</form>
					</li>
					<!-- Name & PhoneNumber -->
					<li class="search_options" onclick='openForm("hp-search")'><i id="hp-search-icon" class="fas fa-angle-down"></i><div>전화번호로 찾기</div></li>
					<li id="hp-search" class="search_input_con" style="display: none">
						<form action="${cpath }/business/membership/businessIDFind/" method="POST" onsubmit='return phoneNumCheck("name-phone-search")'>
							<input type="hidden" name="option" value="NamePhoneNum" />
							<div>
								<div class="search_input_label">이름</div>
								<input class="single_input" type="text" name="name" required="required" placeholder="이름을 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">전화번호<span class="search_input_sublabel">('-'을 제외한 숫자로 적어주세요.)</span></div>
                
								<input id="name-phone-search" class="single_input" type="text" name="phonenum" required="required" oninvalid="this.setCustomValidity('11자리만 입력해주세요')" placeholder="예) 01012345678" maxlength="11"/>
							  <!-- error message -->
									<div id="name-phone-search-error" class="red-mark"></div>
              </div>
							<div>
								<input class="single_input" type="submit" value="확인" />
							</div>
						</form>
					</li>
					<!-- Name & Birth & Gender -->
					<li class="search_options" onclick='openForm("birth-search")'><i id="birth-search-icon" class="fas fa-angle-down"></i><div>생년월일로 찾기</div></li>
					<li id="birth-search" class="search_input_con" style="display: none">
						<form action="${cpath }/business/membership/businessIDFind/" method="POST">
							<input type="hidden" name="option" value="NameBirth" />
							<div>
								<div class="search_input_label">이름</div>
								<input class="single_input" type="text" name="name" required="required" placeholder="이름을 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">생년월일</div>
								<div class="birth_input_con">
									<select id="birthyear-option" class="birth_input" required="required" name="birth">
										<option hidden="true">년</option>
									</select>
									<!-- <input class="birth_input" type="text" name="birth" placeholder="년" /> -->
									<select class="birth_input" name="birth" required="required">											
										<option hidden="true">월</option>
										<option value="01">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<option value="06">6월</option>
										<option value="07">7월</option>
										<option value="08">8월</option>
										<option value="09">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option>
									</select>
                  <input class="birth_input" type="number" name="birth" placeholder="일" min="1" max="31" />
								</div>
							</div>
							<div class="search_gender_select">
								<!-- <div class="radio_input_con"> -->
								<input class="radio_input" id="male_radio" type="radio" name="genderboolean" value="M"/>
								<label id="male_label" class="gender_label male_select" for="male_radio" onclick="radioCheck('male')" >남성</label>
								<input class="radio_input" id="female_radio" type="radio" name="genderboolean" value="W"/>
								<label id="female_label" class="gender_label female_select" for="female_radio" onclick="radioCheck('female')" >여성</label>
							</div>
							<div>
								<input class="single_input" type="submit" value="확인" />
							</div>
						</form>
					</li>
					<!-- BusinessNumber & Email -->
					<li class="search_options" onclick='openForm("bEmail-search")'><i id="bEmail-search-icon" class="fas fa-angle-down"></i><div>사업자 등록번호(이메일)로 찾기</div></li>
					<li id="bEmail-search" class="search_input_con" style="display: none">
						<form action="${cpath }/business/membership/businessIDFind/" method="POST">
							<input type="hidden" name="option" value="CRNEmail" />
							<div>
								<div class="search_input_label">이메일</div>
								<input class="single_input" type="text" required="required" name="email" placeholder="이메일을 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">사업자등록번호<span class="search_input_sublabel">('-'을 제외한 숫자로 적어주세요.)</span></div>
								<input class="single_input" type="text" required="required" name="delegatecrn" placeholder="예)123412341234" />
							</div>
							<div>
								<input class="single_input" type="submit" value="확인" />
							</div>
						</form>
					</li>
					<!-- BusinessNumber & PhoneNumber -->
					<li class="search_options" onclick='openForm("bPhone-search")'><i id="pPhone-search-icon" class="fas fa-angle-down"></i><div>사업자 등록번호(전화번호)로 찾기</div></li>
					<li id="bPhone-search" class="search_input_con" style="display: none">
						<form action="${cpath }/business/membership/businessIDFind/" method="POST">
							<input type="hidden" name="option" value="CRNPhone" />
							<div>
								<div class="search_input_label">전화번호<span class="search_input_sublabel">('-'을 제외한 숫자로 적어주세요.)</span></div>
								<input class="single_input" type="text" required="required" name="phonenum" placeholder="예)01012345678" />
							</div>
							<div>
								<div class="search_input_label">사업자등록번호<span class="search_input_sublabel">('-'을 제외한 숫자로 적어주세요.)</span></div>
								<input class="single_input" type="text" required="required" name="delegatecrn" placeholder="예)123412341234" />
							</div>
							<div>
								<input class="single_input" type="submit" value="확인" />
							</div>
						</form>
					</li>
				</ul>
			</div>
		</div>
		<!-- Password Search -->
			<div class="account_searchbox">
				<div class="search_title title">비밀번호 찾기</div>
				<div class="search_option_con">
					<ul>
					
					<!-- ID & Email & PhoneNumber for Password -->
					<li class="search_options" onclick='openForm("PwPhone-search")'><i id="PwPhone-search-icon" class="fas fa-angle-down"></i><div>전화번호로 찾기</div></li>
					<li id="PwPhone-search" class="search_input_con" style="display: none">
						<form action="${cpath }/business/membership/businessPWFind/" method="POST" onsubmit="return false">
							<input type="hidden" name="option" value="phoneNameID" />
							<div>
								<div class="search_input_label">아이디</div>
								<input class="single_input" type="text" name="id" placeholder="아이디를 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">이름</div>
								<input class="single_input" type="text" name="name" placeholder="이름을 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">전화번호<span class="search_input_sublabel">('-'을 제외한 숫자로 적어주세요.)</span></div>
								<div class="phone_auth_con">
									<input id="auth_phone_input" class="auth_input" type="text" name="phonenum" placeholder="예)01012345678" maxlength="11"/>
									<button id="auth_phone_btn" class="phone_auth_btn" type="button" onclick="authInput('auth_phone')">인증번호 받기</button>
								</div>
							</div>
							<div id="auth_phone_div">
								
							</div>
							<div>
								<input id="auth_phone_confirm" class="single_input" type="submit" value="확인"  disabled="disabled"/>
							</div>
						</form>
					</li>
					<!-- ID & Email for Password -->
					<li class="search_options" onclick='openForm("PwEmail-search")'><i id="PwEmail-search-icon" class="fas fa-angle-down"></i><div>이메일로 찾기</div></li>
					<li id="PwEmail-search" class="search_input_con" style="display: none">
						<form action="${cpath }/business/membership/businessPWFind/" method="POST" onsubmit="return false">
							<input type="hidden" name="option" value="emailID" />
							<div>
								<div class="search_input_label">아이디</div>
								<input class="single_input" type="text" name="id" placeholder="아이디를 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">이메일</div>
								<div class="email_auth_con">
									<input id="auth_email_input" class="auth_input" type="text" name="email" placeholder="이메일을 적어주세요." maxlength="30"/>
									<button id="auth_email_btn" class="email_auth_btn" type="button" onclick="authInput('auth_email')">인증번호 받기</button>
								</div>
							</div>
							<div id="auth_email_div">
								
							</div>
							<div>
								<input id="auth_email_confirm" class="single_input" type="submit" value="확인" disabled="disabled"/>
							</div>
						</form>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</section>

	<!-- Account Search -->
	<script type="text/javascript" src="${cpath }/business/js/businessAccountSearch.js"></script>
	
	<!-- footer -->
	<%@ include file="../main/businessFooter.jsp"%>

</body>
</html>
	