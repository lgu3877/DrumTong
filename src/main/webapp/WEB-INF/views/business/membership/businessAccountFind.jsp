<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/businessHeader.jsp"%>


<section>
	<!-- Login -->
	<div class="search_inner">
	
	<!-- Result Testing View -->
	<ul>
		<li><a href="${cpath }/business/membership/businessIDFindTest/">아이디 찾기 결과</a></li>
		<li><a href="${cpath }/business/membership/businessPWFindTest/">비밀번호 재설정</a></li>
	</ul>
	
	<!-- Account Search -->
		<div class="account_searchbox">
			<div class="search_title title">아이디 찾기</div>
			<div class="search_option_con">
				<ul>
					<!-- Name & Email -->
					<li class="search_options" onclick='openForm("email-search")'><i id="email-search-icon" class="fas fa-angle-down"></i><div>이메일로 찾기</div></li>
					<li id="email-search" class="search_input_con" style="display: none">
						<form action="${cpath }/business/membership/businessIDFind/" method="GET">
							<input type="hidden" name="option" value="NameEmail" />
							<div>
								<div class="search_input_label">이름</div>
								<input class="single_input" type="text" name="name" placeholder="이름을 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">이메일</div>
								<input class="single_input" type="text" name="email" placeholder="이메일을 적어주세요." />
							</div>
							<div>
								<input class="single_input" type="submit" value="확인" />
							</div>
						</form>
					</li>
					<!-- Name & PhoneNumber -->
					<li class="search_options" onclick='openForm("hp-search")'><i id="hp-search-icon" class="fas fa-angle-down"></i><div>전화번호로 찾기</div></li>
					<li id="hp-search" class="search_input_con" style="display: none">
						<form method="POST">
							<div>
								<div class="search_input_label">이름</div>
								<input class="single_input" type="text" name="name" placeholder="이름을 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">전화번호<span class="search_input_sublabel">('-'을 제외한 숫자로 적어주세요.)</span></div>
								<input class="single_input" type="text" name="phonenum" placeholder="예)01012345678" />
							</div>
							<div>
								<input class="single_input" type="submit" value="확인" />
							</div>
						</form>
					</li>
					<!-- Name & Birth & Gender -->
					<li class="search_options" onclick='openForm("birth-search")'><i id="birth-search-icon" class="fas fa-angle-down"></i><div>생년월일로 찾기</div></li>
					<li id="birth-search" class="search_input_con" style="display: none">
						<form method="POST">
							<div>
								<div class="search_input_label">이름</div>
								<input class="single_input" type="text" name="name" placeholder="이름을 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">생년월일</div>
								<div class="birth_input_con">
									<select id="birthyear-option" class="birth_input">
										<option hidden="true">년</option>
									</select>
									<!-- <input class="birth_input" type="text" name="birth" placeholder="년" /> -->
									<select class="birth_input" name="birth">											
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
									<input class="birth_input" type="text" name="birth" placeholder="일" />
								</div>
							</div>
							<div class="search_gender_select">
								<!-- <div class="radio_input_con"> -->
								<input class="radio_input" id="male_radio" type="radio" name="gender" value="M"/>
								<label id="male_label" class="gender_label male_select" for="male_radio" onclick="radioCheck('male')" >남성</label>
								<input class="radio_input" id="female_radio" type="radio" name="gender" value="F"/>
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
						<form method="POST">
							<div>
								<div class="search_input_label">이메일</div>
								<input class="single_input" type="text" name="email" placeholder="이메일을 적어주세요." />
							</div>
							<div>
								<div class="search_input_label">사업자등록번호<span class="search_input_sublabel">('-'을 제외한 숫자로 적어주세요.)</span></div>
								<input class="single_input" type="text" name="phonenum" placeholder="예)123412341234" />
							</div>
							<div>
								<input class="single_input" type="submit" value="확인" />
							</div>
						</form>
					</li>
					<!-- BusinessNumber & PhoneNumber -->
					<li class="search_options" onclick='openForm("bPhone-search")'><i id="pPhone-search-icon" class="fas fa-angle-down"></i><div>사업자 등록번호(전화번호)로 찾기</div></li>
					<li id="bPhone-search" class="search_input_con" style="display: none">
						<form method="POST">
							<div>
								<div class="search_input_label">전화번호<span class="search_input_sublabel">('-'을 제외한 숫자로 적어주세요.)</span></div>
								<input class="single_input" type="text" name="phonenum" placeholder="예)01012345678" />
							</div>
							<div>
								<div class="search_input_label">사업자등록번호<span class="search_input_sublabel">('-'을 제외한 숫자로 적어주세요.)</span></div>
								<input class="single_input" type="text" name="phonenum" placeholder="예)123412341234" />
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
						<form method="POST">
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
								<input class="single_input" type="submit" value="확인" />
							</div>
						</form>
					</li>
					<!-- ID & Email for Password -->
					<li class="search_options" onclick='openForm("PwEmail-search")'><i id="PwEmail-search-icon" class="fas fa-angle-down"></i><div>이메일로 찾기</div></li>
					<li id="PwEmail-search" class="search_input_con" style="display: none">
						<form method="POST">
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
								<input class="single_input" type="submit" value="확인" />
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

<%@ include file="../main/businessFooter.jsp"%>

	