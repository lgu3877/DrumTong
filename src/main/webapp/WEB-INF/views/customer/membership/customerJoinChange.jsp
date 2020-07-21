<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>

<section class="section_Joinchange">
	<h1 class="join_mainName">개인정보 수정</h1>
	<article class="join_change">

		<form>
			<p class="join_name">아이디</p>
			<input class="join_inputbox" type="text" name="id" placeholder="ID"
				required>
		</form>
		<hr>

		<form>
			<p class="join_name">비밀번호</p>
			<input class="join_inputbox" type="password" name="password"
				placeholder="password" required>
			<button class="join_button">수정</button>
		</form>
		<hr>

		<form>
			<p class="join_name">이름</p>
			<input class="join_inputbox" type="text" name="name" placeholder="이름"
				required>
			<button class="join_button">수정</button>
		</form>
		<hr>

		<form>
			<p class="join_name">성별</p>
			<select class="join_inputbox join_gender" required>
				<option value="">선택</option>
				<option value="man">남성</option>
				<option value="woman">여성</option>
			</select>
		</form>
		<hr>

		<form>
			<p class="join_name">생년월일</p>
			<input class="join_inputbox" type="date" name="birthday"
				placeholder="생년월일">
		</form>
		<hr>

		<form>
			<p class="join_name">전화번호</p>
			<input class="join_inputbox join_pnum" type="text" name="phonenum"
				placeholder="전화번호"> <input class="join_pum_ok" type="submit"
				name="phonemun_ok" value="인증하기"></input>
		</form>
		<hr>


		<form>
			<p class="join_name">이메일</p>
			<input class="join_inputbox" type="email" name="email"
				placeholder="E-mail">
		</form>
		<hr>

		<form>
			<p class="join_name">주소</p>
			<input class="join_inputbox join_joso" type="text" name="email"
				placeholder="우편번호"> <input class="join_joso_ok"
				type="submit" name="joso_select" value="주소찾기"></input> <input
				class="join_inputbox" type="text" name="joso_realjoso"
				placeholder="상세주소">
		</form>
		<hr>

		<!-- <div class="join_cmp">
                <input class="join_complete" type="submit" name="joso_complete" value="확인"></input>
            </div> -->

	</article>
</section>




<%@ include file="../main/customerFooter.jsp"%>