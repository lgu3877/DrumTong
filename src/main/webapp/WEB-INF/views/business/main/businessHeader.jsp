<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<header>
		<div class="h_wrapper">
			<div class="h_left_con">
				<a href="${cpath }/business/"><img
					src="${cpath }/resources/business/img/businessLogo.png" /></a>
			</div>
			<div class="h_right_con title">
				<div class="h_right_upper">
					<div class="member_menu">
							<a href="${cpath }/business/membership/businessLogin/">로그인</a></span> <span>/</span>
						<span>회원가입</span>
						<div id="menu" class="menu">
							<a href="#" id="link1"> 매장선택 </a>
							<div id="menulist" class="menulist">
								<div>Option1</div>
								<div>Option2</div>
								<div>Option3</div>
								<div>Option4</div>
								<div>Option5</div>
							</div>
						</div>
						<button onclick="location.href='${cpath}/business/membership/businessAccountInfo/'">개인정보수정</button>
					</div>
				</div>
				<div class="h_right_lower">
					<div>메뉴 1</div>
					<div>메뉴 2</div>
					<div>메뉴 3</div>
					<div>메뉴 4</div>
				</div>
			</div>
		</div>

		<hr>

	</header>