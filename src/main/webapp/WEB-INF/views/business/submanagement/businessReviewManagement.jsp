<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비즈니스 리뷰 관리 페이지입니다</h1>
	매장 이름 : ${selectEST.brandnaming }
	<h1>전체 리뷰(${ReviewCount })</h1>
	<c:forEach items="${bReview }" varStatus="status">
		<span style="border:1px solid pink;">
			좋아요 : ${bReview[status.index].mgood }, 신고횟수 : ${bReview[status.index].reportcount }
			고객 리뷰 내용 : ${bCustomerReview[status.index].content }
			사업자 내용 : ${bBusinessReview[status.index].content }
		</span>
	</c:forEach>
	<h1>미답변 리뷰(${NoReplybReviewCount})</h1>
	<c:forEach items="${NoReplybReview }" varStatus="status">
		<c:if test="${NoReplybReview[status.index].replyboolean == 78}">
			<span style="border:1px solid pink;">
				좋아요 : ${NoReplybReview[status.index].mgood }, 신고횟수 : ${NoReplybReview[status.index].reportcount }
				고객 리뷰 내용 : ${bCustomerNoReplyReview[status.index].content }
			</span>
		</c:if>
	</c:forEach>
	<h1>차단/허위 의심 리뷰</h1>
</body>
</html>