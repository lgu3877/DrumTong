<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="customerHeader.jsp" %>    

<section>
	<h2>Customer Main</h2>
	${test }
</section>
<a href="${pageContext.request.contextPath }/customer/membership/customerLogin/">로그인 페이지로 이동</a>
<h1>${Login == null ? '로그인 X' : Login.memberid }</h1>
<%@ include file="customerFooter.jsp" %>