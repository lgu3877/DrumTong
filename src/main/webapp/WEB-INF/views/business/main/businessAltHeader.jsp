<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<div class="h_wrapper">
	
	<!-- 헤더 왼쪽(home icon) -->
		<div class="h_left_con">
			<a href="${cpath }/business/"> <img
				src="${cpath }/resources/business/img/main/businessLogo.png" />
			</a>
		</div>
		
	<!-- 헤더 오른쪽(메뉴) -->
		<div class="h_right_con title">
		
		<!-- 오른쪽 상단(main + member menu) -->
			<div class="h_right_upper flex flex_end pt-10">
				<div class="h_right_upper_main_menu">
					<div onclick='location.href="${cpath}/business/contract/businessContract/"'>온라인 계약</div>
					<div onclick='location.href="${cpath}/business/businessIntroduceService/"'>서비스 소개</div>
					<div>메뉴 3</div>
				</div>
				<div class="member_menu">
					<c:choose>
						<c:when test="${empty bLogin }">
							<span class="upper_options"
								onclick='location.href="${cpath }/business/membership/businessLogin/"'>
								<i class="fas fa-sign-in-alt"></i>&nbsp;로그인
							</span>
							<span class="upper_options"
								onclick='location.href="${cpath }/business/membership/businessSignUp/"'>
								<i class="fas fa-file-signature"></i>&nbsp;회원가입
							</span>
						</c:when>

						<c:otherwise>
							<c:if test="${not empty selectEST.brandnaming }">
								<span class="upper_options" style="cursor: default;">[${selectEST.brandnaming }]</span>
								<b>사장님, 반갑습니다.</b>&nbsp;&nbsp;&nbsp; 
							</c:if>
							<span class="upper_options"
								onclick='location.href="${cpath}/business/membership/businessAccountInfo/"'>
								<i class="far fa-user"></i>&nbsp;개인정보수정
							</span>
							<span class="upper_options"
								onclick='location.href="${cpath }/business/membership/businessLogOut/"'>
								<i class="fas fa-sign-in-alt"></i>&nbsp;로그아웃
							</span>

							<div id="menu" class="menu">
								<a id="link1"> 매장 선택</a>
								<div id="menulist" class="menulist">

									<c:choose>
										<c:when
											test="${InformationList != null && selectEST.brandnaming != '' && not empty selectEST.brandnaming}">
											<c:forEach items="${InformationList }" var="list">
												<div
													onclick="location.href='${cpath}/business/selectEST/${list.estid }/'">${list.brandnaming }</div>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<div>매장 없음</div>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
		<!-- 오른쪽 하단 (slide menu)-->
			<div class="h_right_lower">
				<div class="h_right_lower_menu pointer">layout</div>
				<div class="h_right_lower_menu pointer">layout</div>
				<div class="h_right_lower_menu pointer">layout</div>
				<div class="h_right_lower_menu pointer">layout</div>
			</div>
		</div>
	</div>
</header>