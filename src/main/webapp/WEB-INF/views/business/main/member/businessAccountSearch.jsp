<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../businessHeader.jsp"%>


<section>
	<!-- Login -->
	<div class="search_inner">
		<div class="search_con">
			<div class="search_box">
				<ul class="search_nav">
					<li class="nav_id_search"><a href="#">아이디 찾기</a></li>
					<li class="nav_pw_search"><a href="#">비밀번호 찾기</a></li>
				</ul>
				<p class="serach_text_guide">
					아이디를 잊어버리셨나요?<br>아래의 형식에 맞춰 정보를 입력해주세요.
				</p>
				<div class="search_form_wrapper">
					<form class="search_form">
						<div class="search_input_con">
							<p>이름<span class="red-mark">*</span></p>
							<input type="text" name="userName" placeholder="이름을 입력해주세요." required autofocus
								maxlength="10" />
						</div>
						<div class="search_input_con">
							<p>아이디(이메일)<span class="red-mark">*</span></p>
							<input type="text" name="userId" placeholder="이메일을 입력해주세요." required maxlength="20" />
						</div>
						<div class="search_birtyday_con">
							<p>생년월일<span class="red-mark">*</span></p>
							<ul>
								<li><input type="text" name="birthYear" placeholder="년"
									required maxlength="4" /></li>
								<li><select name="birthMonth">
										<option value="none" hidden>월</option>
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
								</select></li>
								<li><input type="text" name="birthDay" placeholder="일"
									required maxlength="2" /></li>
							</ul>
						</div>
						<div>
							<input type="submit" value="확인" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../businessFooter.jsp"%>
