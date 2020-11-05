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
<div style="display:none;">
	<h1>비즈니스 리뷰 관리 페이지입니다</h1>
		매장 이름 : ${selectEST.brandnaming }
		<h1>${Name }(${wholePageNum })</h1>
		<c:forEach items="${bReviewList }" var="Review">
			<span style="border:1px solid pink;">
				좋아요 : ${Review.mgood }, 신고횟수 : ${Review.reportcount } | 
				고객 리뷰 내용 : ${Review.ccontent }
				고객 리뷰 날짜 : ${Review.cregistdate } | 
				사업자 리뷰 내용 : ${Review.bcontent }
				사업자 리뷰 날짜 : ${Review.bregistdate }
			</span>
	</c:forEach>
</div>
		
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
		<!-- sub-header(membership) -->
	<%@ include file="../main/businessSubHeader.jsp" %>
		
		<div class="marginauto" style="width: 800px; height: 80%; margin-top: 100px;">	
			<h1>리뷰 관리</h1>
				매장 이름 : ${selectEST.brandnaming }
		<div style="width: 800px; height: 600px" class="marginauto">
			<input type="button" onclick="" value="전체 리뷰(${ReviewCount })">
			<input type="button" value="미답변 리뷰(${NoReplybReviewCount})">
			<input type="button" value="차단/허위 의심 리뷰">
			
			<div id="reviewDiv" style="width: 100%; height:500px">
<!-- 			<div style="width: 100%; height: 10%; display: flex" >
					<h1 class="reviewName">이름</h1>
					<h1 class="reviewContent">리뷰내용</h1>
					<h1 class="reviewDate">작성날짜</h1>
					<input type="button" style="width: 10%;" value="답변작성">
					<input type="button" style="width: 10%;" value="차단/신고">
				</div>
				<hr>	 -->			
			</div>
		</div>	
			
			<c:forEach items="${bReview }" varStatus="status">
				<span style="border:1px solid pink;">
					좋아요 : ${bReview[status.index].mgood }, 신고횟수 : ${bReview[status.index].reportcount }
					고객 리뷰 내용 : ${bCustomerReview[status.index].content }
					사업자 내용 : ${bBusinessReview[status.index].content }
				</span>
			</c:forEach>
			
			<c:forEach items="${NoReplybReview }" varStatus="status">
				<c:if test="${NoReplybReview[status.index].replyboolean == 78}">
					<span style="border:1px solid pink;">
						좋아요 : ${NoReplybReview[status.index].mgood }, 신고횟수 : ${NoReplybReview[status.index].reportcount }
						고객 리뷰 내용 : ${bCustomerNoReplyReview[status.index].content }
					</span>
				</c:if>
			</c:forEach>
	
		</div>
	</section>
		

	

		<!-- footer -->
	<%@ include file="../main/businessFooter.jsp" %>
	
	
<script type="text/javascript">
	window.onload = function() {
		var reviewDiv = document.getElementById('reviewDiv');
	
		var count = 0;	// 무조건 반복문이 열번만 사용되도록
		
		for (i = 0; i < 10 && count < 3; i++) {
			var customerReview = document.createElement('div');
			customerReview.className = 'customerReview';
			
			var reviewName = document.createElement('h1');
			reviewName.className = 'createElement';
			reviewName.innerHTML = '이름';
			
			var reviewContent = document.createElement('h1');
			reviewContent.className = 'reviewContent';
			reviewContent.innerHTML = '리뷰내용';
			
			var reviewDate = document.createElement('h1');
			reviewDate.className = 'reviewDate';
			reviewDate.innerHTML = '작성날짜';
			
			// 답변이 달려있는 경우에만 
			var replyUpload = document.createElement('input')
			replyUpload.setAttribute('type', 'button');
			replyUpload.setAttribute('value', '답변작성');
			replyUpload.style.width = '10%';
						
			var blockButton = document.createElement('input')
			blockButton.setAttribute('type', 'button');
			blockButton.setAttribute('value', '차단/신고');
			blockButton.style.width = '10%';
			
			customerReview.appendChild(reviewName);
			customerReview.appendChild(reviewContent);
			customerReview.appendChild(reviewDate);
			customerReview.appendChild(replyUpload);
			customerReview.appendChild(blockButton);			
			
			reviewDiv.appendChild(customerReview);
			reviewDiv.appendChild(document.createElement('hr'));
			
			count++;
			console.log(count);	
		}
	}
</script>
</body>
</html>