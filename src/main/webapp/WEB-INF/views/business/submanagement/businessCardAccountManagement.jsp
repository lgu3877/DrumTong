<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
 
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: businessCardAccountManagement</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- content css -->
<%-- 	<link rel="stylesheet" href="${cpath }/business/css/businessCardAccountManagement.css"> --%>

	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
     

<!-- body -->
<body>
	
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
		<!-- sub-header(membership) -->
		<%@ include file="../main/businessSubHeader.jsp" %>
		
		<div>Business Shop Management Content</div>
	</section>
		
	<!-- footer -->
	<%@ include file="../main/businessFooter.jsp" %>


<script type="text/javascript">
	function dropdown() {
		
	}
	
	function 
</script>


</body>
</html>