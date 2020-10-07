<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="businessHeader.jsp" %>    


<section>
	<!-- Preview -->
	<%@ include file="businessMainPreview.jsp" %> 
	
	<!-- Inner Navigation -->
	<%@ include file="businessInnerNav.jsp" %>
	
	<div style="width:50%; background-color: tomato"></div>
	
	<!-- Login Include -->
	<%@ include file="businessMainLogin.jsp" %> 
	

	
	<div style="width: 100%; height: 30%; margin-top: 10px">
		<div class="marginzero inlineBlock slide" style="position:relative ;width: 50%;height: 100%; background-color: yellow; float: left;" id="slideDiv">
			<img src="${cpath }/resources/business/img/laundry1_02.jpg" class="item">
			<img src="${cpath }/resources/business/img/laundry1_03.jpg" style="display: none" class="item">
			<img src="${cpath }/resources/business/img/laundry1_04.jpg" style="display: none" class="item">
			<img src="${cpath }/resources/business/img/laundry1_05.jpg" style="display: none" class="item">
			<img src="${cpath }/resources/business/img/laundry1_06.jpg" style="display: none" class="item">	
			<img id="prevBtn" style="position: absolute; width: 10%; top: 40%; left: 0; z-index: 9999; display: none" src="${cpath }/resources/business/img/prev_button.png" onclick="prevButton()">
			<img id="nextBtn" style="position: absolute; width: 10%; top: 40%; right: 0; z-index: 9999; display: none" src="${cpath }/resources/business/img/next_button.png" onclick="nextButton()">			
		</div>
	<!-- Login Include -->
	<%@ include file="businessMainLogin.jsp" %> 
	</div>

</section>

<script type="text/javascript" src="${cpath }/business/js/main.js"></script>

<%@ include file="businessFooter.jsp" %>    