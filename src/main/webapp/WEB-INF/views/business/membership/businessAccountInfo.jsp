<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/businessHeader.jsp" %>

<link rel="stylesheet" href="${cpath }/business/css/membership/businessAccountInfo.css">

<!-- 스크립트 영역 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Axios js min 파일 -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	

<div style="width: 70%; height: 100%; min-width: 900px; background-color: #d2d4dc;" class="marginauto">
	
	<input type="hidden" value="${bLogin.bpersonid}" id="BPERSONID">
	
	<div style="text-align: left; margin-bottom: 25px">
		<h1 style="font-size: 32pt; margin-left: 20px;">비즈니스 계정 관리</h1>
		<hr>
	</div>
	
	<div style="width: 80%; height: 80%; display: flex; margin-top: 8%" class="marginauto">
		<div class="leftdiv">
<!-- 			<div class="tablediv" style="margin-top: 5px"> -->
<!-- 				<div class="celldiv"> -->
<!-- 					아&nbsp&nbsp이&nbsp&nbsp디 -->
<!-- 				</div> -->
<!-- 			</div>		 -->
			<div class="tablediv">
				<div class="celldiv">
					비밀번호
				</div>
			</div>		
			<div class="tablediv">
				<div class="celldiv">
					이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름
				</div>
			</div>		
			<div class="tablediv">
				<div class="celldiv">
					생년월일
				</div>
			</div>		
			<div class="tablediv">
				<div class="celldiv">
					성&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp별
				</div>
			</div>		
			<div class="tablediv">
				<div class="celldiv">
					전화번호
				</div>
			</div>		
			<div class="tablediv">
				<div class="celldiv">
					사업번호
				</div>
			</div>		
			<div class="tablediv">
				<div class="celldiv">
					이&nbsp&nbsp메&nbsp&nbsp일
				</div>
			</div>		
			<div class="tablediv">
				<div class="celldiv">
					주&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp소
				</div>
			</div>		
		</div>
		
		<div style="display: inline-block; width: 75%; height: 100%; background-color: 	#f8f8fa">
		<form action="#" style="width: 100%; height: 100%;">
<!-- 			<div class="rightdiv" style="margin-top: 5px"> -->
<%-- 				<input class="input" type="text" name="id" placeholder="아이디" value="${bPrivateDataVO.id}"  readonly> --%>
<!-- 				<input class="origininput"> -->
<!-- 			</div> -->
			<div class="rightdiv">
				<input class="input" type="text" name="pw" placeholder="비밀번호"  readonly>
				<input class="origininput">
			</div>
			<div class="rightdiv">
				<input class="input" type="text" name="name" placeholder="이름" value="${bLogin.name}"readonly>
				<input class="origininput">
			</div>
			<div class="rightdiv">
				<input class="input" type="text" name="birth" placeholder="생년월일" value="${bLogin.birth}" readonly>
				<input class="origininput">
			</div>
			<div class="rightdiv">
				<input class="input" type="text" id="genderboolean" placeholder="성별" value="${bLogin.genderboolean}" readonly>
				<input class="origininput">
			</div>
			<div class="rightdiv">
				<input class="input" type="text" id="phonenum" placeholder="휴대폰 번호" value="${bLogin.phonenum}" readonly>
				<input class="origininput">
			</div>
			<div class="rightdiv">
				<input class="input" type="text" name="delegatecrn" placeholder="사업자 번호" value="${bLogin.delegatecrn}" readonly>
				<input class="origininput">
			</div>
			<div class="rightdiv">
				<input class="input" type="text" name="email" placeholder="이메일" value="${bLogin.email}" readonly>
				<input class="origininput">
			</div>
			<div class="rightdiv">
				<input class="input" type="text" id="address" placeholder="주소" value="${bLogin.mainaddress}" readonly>
				<input class="origininput" >
			</div>
		</form>
		</div>
	</div>

</div>
<script src="${cpath }/business/js/membership/businessAccountInfo.js"></script>

<%@ include file="../main/businessFooter.jsp"%>

</body>
</html>