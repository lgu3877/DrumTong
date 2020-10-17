<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/businessHeader.jsp"%>

<section>
	<div class="pw_reset_con">
		<form class="pw_reset_view" method="POST">
			<div class="pw_reset_title title">비밀번호 재설정</div>
			<div class="pw_reset_content">
				<p>
					기존의 비밀번호를 변경합니다. 
					보안을 위해 최소 10자리에서 20자리까지의 영문, 숫자의 조합으로 구성해주세요.
				</p>
				<div class="pw_reset_input_con">
					<div class="pw_reset_input_con">
						<div class="pw_reset_input_title">새로운 비밀번호</div>
						<input type="password" name="password" placeholder="사용하실 비밀번호를 입력해주세요." maxlength="20" required />
					</div>
					<div class="pw_reset_input_con">
						<div class="pw_reset_input_title">비밀번호 재입력</div>
						<input type="password" name="confrimPassword" placeholder="정확한 입력을 위해 다시 한 번 입력해주세요." maxlength="20" required />
					</div>
					<input type="submit" value="변경하기" />
				</div>
			</div>
		</form>
	</div>
</section>

<%@ include file="../main/businessFooter.jsp"%>
