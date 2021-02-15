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
    <title>customerDrumtong :: customerBookmark</title>
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet" type="text/css">
    <link rel="stylesheet" href="${cpath }/customer/css/customerStyle.css">
    <link rel="stylesheet" href="${cpath }/customer/css/account/customerBookmark.css">
	
	<script type="text/javascript" src="${cpath }/customer/js/main/customerHeader.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	 
</head>

<body>

<%@ include file="../main/customer_Header.jsp"%>

<!-- 본문 영역 -->
<section class="section-SangJae section-bookmark">
  <div class="bookmark-row">
  <h1 class="bookmark_mainName">즐겨찾기</h1>
  <c:if test="${not empty bookmarkList}">
	  <c:forEach items="${bookmarkList }" var="bo">
	  	<div class="bookmark" onclick="location.href='${pageContext.request.contextPath}/customer/laundry/customerDetail/${bo.estid }/'">
	      <div class="bookmark-context">
	        <p class="boarmark-text">${bo.brandnaming } | ${bo.mainlocation } ${bo.detaillocation }</p>
	        
	      </div>
	    </div>
	  </c:forEach>
  </c:if>
<!--     <div class="bookmark" onclick="location.href='#'"> -->
<!--       <div class="bookmark-context"> -->
<!--         <p>(주)드럼통 해운대구</p> -->
<!--       </div> -->
<!--     </div> -->
  </div>
</section>

<!-- 스크립트 영역 -->
<script>
	list = document.getElementsByClassName('boarmark-text');
	for(i = 0; i < list.length; i++){
		if(list[i].innerHTML.length > 43){
			list[i].innerHTML = list[i].innerHTML.substring(0,43) + '...';
		}
	}
</script>

<%@ include file="../main/customerFooter.jsp" %>
</body>
</html>