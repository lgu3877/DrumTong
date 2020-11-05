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
</body>
</html>