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
  	<title>Login :: Laundry</title>
  	
  	<!-- global css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <!-- header css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <!-- login css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css"> 	  	
	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	
	<!-- Axios -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>


<body>
	
	<!-- header -->
	<%@ include file="../main/businessHeader.jsp"%>

	<!-- Login -->
	<section>
		<div class="single_page_login">
			<!-- title -->
			<div class="login_title">
				<p>로그인</p>
			</div>
			
			<!-- form -->
			<form class="single_page_login_form">
				<div class="single_page_login_input_con" action="#" method="POST">
					
					<!-- id input -->
					<div>
						<div class="input_title text-left">아이디
							<span class="red-mark">*</span>
						</div>
						<input type="text" placeholder="아이디를 입력해주세요.">
					</div>
					
					<!-- password input -->
					<div>
						<div class="input_title text-left">
							비밀번호
							<span class="red-mark">*</span>
						</div>
						<input type="password" placeholder="비밀번호를 입력해주세요.">
						
						<!-- store id checkbox -->
						<div class="single_store_id_con">
							<label style="cursor: pointer">
								<input type="checkbox" name="storeId">
								<span style="margin-left: -6px">아이디 기억하기</span>
							</label>
						</div>
					</div>
					
					<!-- submit -->
					<div>
						<input class="single_page_login_btn" type="button" value="로그인" />
					</div>
				</div>
				
				<!-- account search -->
				<div class="login_search_con">
					<div>
						<a href="${cpath }/business/membership/businessAccountFind/">아이디/비밀번호 찾기 </a>
					</div>
					<div>
						<a href="#">회원가입</a>
					</div>
				</div>
			</form>
		</div>
	</section>
	
	<!-- footer -->
	<%@ include file="../main/businessFooter.jsp"%>

</body>
</html>