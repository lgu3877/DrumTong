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
		
		<div>
		
		<h1 style="font-size: 32pt; text-align: left; display: block; margin: 0 auto; width: 800px">계좌관리</h1>
		<div style="width: 800px; height: 300px; margin: 0 auto; border-radius: 15px; border: 5px double; position: relative;">
			<label style="font-size: 24pt; display: block; margin-left: 15px; margin-top: 15px; text-align: left;">XX 은행</label>
			<div>
				<input type="text" value="1111" readonly="readonly" style="width: 80px; height: 30px;margin-right: 20px; text-align: center; background-color: grey">
				<input type="text" value="1111" readonly="readonly" style="width: 80px; height: 30px;margin-right: 20px; text-align: center; background-color: grey">
				<input type="text" value="1111" readonly="readonly" style="width: 80px; height: 30px;margin-right: 20px; text-align: center; background-color: grey">
				<input type="text" value="1111" readonly="readonly" style="width: 80px; height: 30px;margin-right: 20px; text-align: center; background-color: grey">
			</div>	
			<div style="width: 1px; height: 100%; background-color: black; position: absolute; top: 0; right: 200px"></div>
			
		</div>
		
		</div>
	</section>
		
	<!-- footer -->
	<%@ include file="../main/businessFooter.jsp" %>


<script type="text/javascript">
	window.onload = function() {
		console.log(${paymentList});
		let paymentList = ${paymentList};
		for(i = 0; i < paymentList.length; i++) {
			console.log('확인 : ', paymentList[i].cardnum);
		}
	}

	function dropdown() {
		
	}
	
</script>


</body>
</html>