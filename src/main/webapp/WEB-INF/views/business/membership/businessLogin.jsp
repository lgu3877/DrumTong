<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/businessHeader.jsp"%>


<section>
	<!-- Login -->
	<div class="single_page_login">
		<div class="login_title">
			<p>로그인</p>
		</div>
		<form class="single_page_login_form">
			<div class="single_page_login_input_con" action="#" method="POST">
				<div>
					<div class="input_title text-left">
						아이디<span class="red-mark">*</span>
					</div>
					<input type="text" placeholder="아이디를 입력해주세요.">
				</div>
				<div>	
					<div class="input_title text-left">
						비밀번호<span class="red-mark">*</span>
					</div>
					<input type="password" placeholder="비밀번호를 입력해주세요.">
					<div class="single_store_id_con">
						<label style="cursor: pointer">
							<input type="checkbox" name="storeId">
							<span style="margin-left: -6px">아이디 기억하기</span>
						</label>
					</div>
				</div>	
				<div>
					<input class="single_page_login_btn" type="button" value="로그인" />
				</div>
			</div>
			<div class="login_search_con">
				<div>
					<a href="${cpath }/business/membership/businessAccountFind/">아이디/비밀번호 찾기 </a>
				</div>
				<div>
					<a href="#">회원가입</a>
				</div>
			</div>
		</form>
	</div>
</section>

<%@ include file="../main/businessFooter.jsp"%>
