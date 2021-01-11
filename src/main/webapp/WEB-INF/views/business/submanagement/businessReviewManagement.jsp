<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: businessReviewManagemnet</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- businessReviewManagement css -->
	<link rel="stylesheet" href="${cpath }/business/css/submanagement/businessReviewManagement.css">

	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>

		
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
		<!-- sub-header(membership) -->
	<%@ include file="../main/businessSubHeader.jsp" %>
		
		<div class="container">	
		<div class="pagetitlediv">
			<h1>리뷰 관리<span>(${selectEST.brandnaming })</span></h1>
		</div>		
		<div style="width: 800px;" class="marginauto">
			<div class="optiondiv">
				<input type="button" onclick="location.href='${cpath }/business/submanagement/businessReviewManagement/whole/'" value="전체 리뷰" id="whole">
				<div></div>
				<input type="button" onclick="location.href='${cpath }/business/submanagement/businessReviewManagement/noReply/'" value="미답변 리뷰"  id="noReply">
				<div></div>
				<input type="button" onclick="location.href='${cpath }/business/submanagement/businessReviewManagement/reportReply/'" value="차단/허위 의심 리뷰" id="reportReply">
			</div>
			<div id="reviewDiv" style="width: 100%;"></div>
			
			<!-- 페이지 번호 넣기 -->
			<div id = "reviewpage" class="marginauto" style="width: 60%; height: 50px; display: table;">
				<div>
					<i id="prevbtn" class="fas fa-arrow-circle-left fa-3x" onclick="prevbtn(this)"></i>
					<h1 class="currentPage" onclick="paging(this)">1</h1>
					<h1 class="notcurrentPage"  onclick="paging(this)">2</h1>
					<h1 class="notcurrentPage"  onclick="paging(this)">3</h1>
					<h1 class="notcurrentPage"  onclick="paging(this)">4</h1>
					<h1 class="notcurrentPage"  onclick="paging(this)">5</h1>
					<i id="nextbtn" class="fas fa-arrow-circle-right fa-3x" onclick="nextbtn(this)"></i>
				</div>
			</div>
		</div>	
	
		</div>
	</section>
<script type="text/javascript">
	let bReviewList =  ${bReviewList};		// 전역변수로 비동기로 전달받은 리스트 저장함
	let globalPath = null;					// 전체리뷰, 미답변리뷰, 차단/신고 리뷰 확인하는 경로 -> 전역변수

	window.onload = function() {
		reviewContents(1);
		arrow(1);
		paging(document.querySelector('.currentPage'));
		globalPath = '${pageKind }';
		pageNum();		// 영경씨 작업
		switch (globalPath) {
		case 'noReply':
			document.getElementById('noReply').style.background = '#3088F9';
			document.getElementById('noReply').style.color = 'white';
			break;
		case 'reportReply':
			document.getElementById('reportReply').style.background = '#3088F9';
			document.getElementById('reportReply').style.color = 'white';
			break;
		default:
			document.getElementById('whole').style.background = '#3088F9';
			document.getElementById('whole').style.color = 'white';
			break;
		}
	}
</script>
<script type="text/javascript" src="${cpath }/business/js/submanagement/businessReviewManagement.js">
</script>

</body>
</html>