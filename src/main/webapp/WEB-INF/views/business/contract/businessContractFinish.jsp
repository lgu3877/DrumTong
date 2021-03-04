<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>businessContaract :: Finished</title>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css"> 
     	
    <!-- Font -->
   <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
	
</head>
<body>
	<section>
		<div style="display: none; width: 100%; height: 100%">
			<div style="width: 100%; height: 50%; display: table">
				<div
					style="width: 700px; height: 500px; display: table-cell; vertical-align: middle;">
					<h1 style="font-size: 28pt; text-align: center;">온라인 계약이
						완료되었습니다</h1>
					<hr>
					<input class="marginauto" type="button" value="온라인 계약"
						style="width: 250px; height: 80px; display: block; margin-top: 15px; font-size: 20pt; font-weight: bold"
						onclick="location.href='${cpath }/business/mainmanagement/businessShopManagement/'">
					<input class="marginauto" type="button" value="사이트 메인"
						style="width: 250px; height: 80px; display: block; margin-top: 15px; font-size: 20pt; font-weight: bold"
						onclick="location.href='${cpath }/business/'">
				</div>
			</div>
		</div>
	</section>
	</body>
</html>