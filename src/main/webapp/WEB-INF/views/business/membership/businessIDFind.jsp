<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- title -->
  	<title>Login :: Laundry</title>
  	
  	<!-- global css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <!-- header css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <!-- id find css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessIDFind.css"> 
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css">
	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  	
</head>


<body>
	<!-- header -->
	<%@ include file="../main/businessHeader.jsp"%>

	<section>
		<div class="saerched_con">
			<div class="searched_view">
				<div class="searched_title title">아이디 찾기 결과</div>
				<div class="searched_content">
					<p>
						<span id="search-id" class="searched_account">${result}</span>
<%--             <c:choose> --%>
<%--               <c:when test="${not empty result }"> --%>
<%--                 회원님의 아이디는 [&nbsp;<span id="search-id" class="searched_account">${result}</span>&nbsp;] 입니다. --%>
<%--               </c:when> --%>
<%--               <c:otherwise> --%>
<!--                 회원 정보를 찾을 수 없습니다.						 -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
					</p>
				</div>
			</div>
			<div class="searched_options_con">
				<button onclick="location.href='${cpath}/business/membership/businessLogin/'">
					로그인하기</button>
				<button onclick="location.href='${cpath}/business/membership/businessAccountFind/'">
					비밀번호 찾기
				</button>
			</div>
		</div>
	</section>

	<!-- encryption for showing ID [영경] 나중에 서버로 작업 -->
	<script type="text/javascript">
// 		const searchId = document.getElementById('search-id').innerHTML;
// 		const idLength = searchId.length;
// 		const visibleId = searchId.substring(0, idLength - 4);

// 		document.getElementById('search-id').innerHTML = visibleId + '***';
	</script>

	<!-- footer -->
	<%@ include file="../main/businessFooter.jsp"%>

</body>
</html>