<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비즈니스 쿠폰 관리 페이지입니다</h1>
	<div style="display:''">
		<c:forEach items="${couponList }" var="co" varStatus="status">
			<div style="border:1px solid pink;">
				${status.index}번째 쿠폰<br>
				쿠폰번호(히든값으로 넣어야 함) : ${co.couponid }<br>
				다운 횟수 : ${co.issuenum }<br>
				할인 가격 : ${co.discount }<br>
				기간 : ${co.period }<br>
				최소금액 : ${co.minimumprice }<br>
				중복 가능 여부 : ${co.duplboolean }<br>
				최대발급수량 : ${co.maxissuenum }<br>
				쿠폰 삭제 여부 : ${co.deleteboolean }<br>
			</div>
		</c:forEach>
	</div>
</body>
</html>