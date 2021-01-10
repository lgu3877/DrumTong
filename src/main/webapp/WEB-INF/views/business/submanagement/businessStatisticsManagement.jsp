<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: businessStatisticsManagement</title>

	<!-- global css -->	
<%-- 	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css"> --%>
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- businessStatisticsManagement css -->
	<link rel="stylesheet" href="${cpath }/business/css/submanagement/businessStatisticsManagement.css">
	
	
	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   	
   	<!-- Google Chart -->
   	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
	
	<!-- sub-header(membership) -->
	<%@ include file="../main/businessSubHeader.jsp" %>
	
	  <!-- <div id="myPieChart"></div> -->

	<div class="container">
		<div class="pagetitlediv">
			<h1>통계</h1>
		</div>
		<div class="flex1">
			<button onclick="contentChange(this)" name="Hits/">조회수</button>
			<button onclick="contentChange(this)" name="Orders/">주문수</button>
			<button style="margin-right: 0 !important;"  onclick="contentChange(this)" name="Price/">주문금액</button>
		</div>
		<div class="flex2">
			<div class="flex3">
				<button class="selected" onclick="lastpath(this)" value="Day/">일간</button>
				<button onclick="lastpath(this)" value="Week/">주간</button>
				<button onclick="lastpath(this)" value="Month/">월간</button>
			</div>
			<div class="flex4">
				<input type="date" name="startDate" id="startDate">
				<span>~</span>
				<input type="date" name="endDate" id="endDate">
			</div>
		</div>
		<div id="chart_div"></div>
		
	</div>



	</section>
	
	
<script type="text/javascript">


//전역변수
var statisticsList =  ${statisticsList };
var lastPath = 'Day/';
var startdatepath = statisticsList[0].start + '/';
var enddatepath = statisticsList[statisticsList.length - 1].end  + '/';

window.onload = function() {
	document.querySelector('div.flex1 button[name="${pageKind}"]').className = 'selected';
	statisticsList = ${statisticsList };
	
	document.getElementById('startDate').value = statisticsList[0].start;
	document.getElementById('endDate').value = statisticsList[statisticsList.length - 1].end;
}


	/* google.charts.load('current', {packages: ['corechart'], language: 'ja', callback: drawChart});	// current : 현재버전 -> 43버전이면 '43'으로 입력
	 // upcoming : 업그레이드 될 예정인 버전
	 // 즉, 내가 어떤 특정한 버전을 지정해서 사용하고 싶으면 그 숫자로 입력해야 한다
	 // 이것을 'Frozen chart versions' 라고 부른다
	 // language 로 나라 언어를 정할 수 있음
	 // google.charts.setOnLoadCallback(drawChart);
	 // .setOnLoadCallback(drawChart) 아니라 아래로도 표현가능
	 //  google.charts.load('current', { packages: [ 'corechart'], callback: drawChart });

	 function drawChart() {	// callback 시킬 때의 이름과 똑같은 함수여야 합니다
	 var data = new google.visualization.DataTable();
	 data.addColumn('string', 'Element');
	 data.addColumn('number', 'Percentage');
	 data.addRows([
	 ['Nitrogen', 0.78],
	 ['Oxygen', 0.17],
	 ['Other', 0.05]
	 ]);

	 // Instantiate and draw the chart.
	 var chart = new google.visualization.PieChart(document.getElementById('myPieChart'));
	 chart.draw(data, null);
	 } */
</script>
<script type="text/javascript" src="${cpath }/business/js/submanagement/businessStatisticsManagement.js"></script>
</body>
</html>