<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sub_header_con">
	<div class="member_menu">
		<span class="member_options" onclick='location.href="${cpath}/business/membership/businessAccountInfo/"'>
			<i class="far fa-user"></i>&nbsp;개인정보수정
		</span>
		<span class="member_options" onclick='location.href="${cpath }/business/membership/businessLogOut/"'>
			<i class="fas fa-sign-in-alt"></i>&nbsp;로그아웃
		</span>
		<div id="menu" class="menu">
			<a id="link1"> 매장 선택 </a>
			<div id="menulist" class="menulist">
				<c:forEach items="${InformationList }" var="list">
					<div onclick="location.href='${cpath}/business/selectEST/${list.estid }/'">${list.brandnaming }</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<hr>