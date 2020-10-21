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
						<span>
							<c:choose>
								<c:when test="${empty bLogin }">
									<a href="${cpath }/business/membership/businessLogin/">로그인</a>
								</c:when>
								<c:otherwise>
									<a href="${cpath }/business/membership/businessLogOut/">로그아웃</a>
								</c:otherwise>
							</c:choose>
						</span> <span>/</span>
						<span><a  href="${cpath }/business/membership/businessSignUp/">회원가입</a></span>
						<div id="menu" class="menu">
							<a id="link1"> ${InformationList != null ? selectEstName : '매장 선택' } </a>
							<div id="menulist" class="menulist">
							<c:choose>
								<c:when test="${InformationList != null }">
									<c:forEach items="${InformationList }" var="list">
										<div onclick="location.href='${cpath}/business/selectEST/${list.estid }/'">${list.brandnaming }</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div>매장 없음</div>
								</c:otherwise>
							</c:choose>
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