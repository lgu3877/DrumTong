<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/businessHeader.jsp"%>


<section>
	<div class="saerched_con">
		<div class="searched_view">
			<div class="searched_title title">아이디 찾기 결과</div>
			<div class="searched_content">
				<p>
					<c:choose>
						<c:when test="${not empty result }">
							회원님의 아이디는 [&nbsp;<span id="search-id" class="searched_account">${result} }</span>&nbsp;] 입니다.
						</c:when>
						<c:otherwise>
							회원 정보를 찾을 수 없습니다.						
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
		<div class="searched_options_con">
			<button onclick="location.href='${cpath}/business/membership/businessLogin/'">로그인 하기</button>
			<button onclick="location.href='${cpath}/business/membership/businessAccountFind/'">비밀번호 찾기</button>
		</div>
	</div>
</section>

<!-- encryption for showing ID -->
<script type="text/javascript">
	const searchId = document.getElementById('search-id').innerHTML;
	const idLength = searchId.length;	
	const visibleId = searchId.substring(0, idLength - 4);
	
	document.getElementById('search-id').innerHTML = visibleId + '***';	
</script>

<%@ include file="../main/businessFooter.jsp"%>
