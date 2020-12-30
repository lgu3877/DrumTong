<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>    

<!-- 스크립트 영역 -->
<script>
  

</script>

<!-- 본문 영역 -->
<section class="section-SangJae section-bookmark">
  <div class="bookmark-row">
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
	console.log(list);
	for(i = 0; i < list.length; i++){
		if(list[i].innerHTML.length > 43){
			list[i].innerHTML = list[i].innerHTML.substring(0,43) + '...';
		}
	}
</script>

<%@ include file="../main/customerFooter.jsp" %>    