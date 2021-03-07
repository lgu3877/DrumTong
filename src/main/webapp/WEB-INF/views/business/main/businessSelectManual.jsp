<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>businessMain :: Manual</title>
	<!-- global css -->
     <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">

 	<!-- header css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">

   	<!-- css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessSelectManual.css">

</head>
<body>
	<!-- header(navbar) -->
	<%@ include file="businessHeader.jsp" %>

		
	<div class="page-intro">
		<h1 class="h1-intro" style="">
			드럼통 이용가이드의 설명과 함께<br>
			여러분의 가게를 직접 관리해보세요
		</h1>
		<p>다양한 기능으로 매력적인 가게를 만들어보세요!</p>
	</div>
	
	<div class="page-body">
		<div class="contents-box">
			<div class="content-box">
				<h2 class="content-title">A</h2>
			</div>
			<div class="content-box">
				<a style="background-image: url('https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/business/BPersonID_c80df0ce2e524f1c849aa2d691a44300/ESTID_da90313621d94293b07b00211a2cdd84/BIMAGE/STOREIMG_413bc78a388a4479970be4516d92e911.png');">
					A-1
				</a>
			</div>
			
			<div class="content-box">
				<a style="background-image: url('https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/business/BPersonID_c80df0ce2e524f1c849aa2d691a44300/ESTID_da90313621d94293b07b00211a2cdd84/BIMAGE/STOREIMG_413bc78a388a4479970be4516d92e911.png');">
					A-1
				</a>
			</div>
			
			<div class="content-box">
				<a style="background-image: url('https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/business/BPersonID_c80df0ce2e524f1c849aa2d691a44300/ESTID_da90313621d94293b07b00211a2cdd84/BIMAGE/STOREIMG_413bc78a388a4479970be4516d92e911.png');">
					A-1
				</a>
			</div>
			
		</div>
	
	</div>	
	
	<!-- footer -->
	<%@ include file="businessFooter.jsp" %>
</body>
</html>