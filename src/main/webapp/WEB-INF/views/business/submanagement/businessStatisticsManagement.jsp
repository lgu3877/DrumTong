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
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- businessStatisticsManagement css -->
	
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

	<div style="width: 1100px; height: 1000px; padding: 25px; text-align: left;" class="marginauto">
		<h1 style="font-size: 36pt">통계</h1>
		<div style="display: flex;">
			<button style="font-size: 24pt; width: 33%; height: 60px; margin-right: 0.5%" onclick="location.href='${cpath }/business/submanagement/businessStatisticsManagement/Hits/'">조회수</button>
			<button style="font-size: 24pt; width: 33%; height: 60px; margin-right: 0.5%" onclick="location.href='${cpath }/business/submanagement/businessStatisticsManagement/Sales/'">주문수</button>
			<button style="font-size: 24pt; width: 33%; height: 60px"  onclick="location.href='${cpath }/business/submanagement/businessStatisticsManagement/Price/'">주문금액</button>
		</div>
		<div style="margin-top: 30px; display: flex">
			<div style="display: inline-flex; width: 450px; margin-left: 50px; margin-right: 100px">
				<button style="font-size: 18pt; width: 150px; height: 40px">일간</button>
				<button style="font-size: 18pt; width: 150px; height: 40px">주간</button>
				<button style="font-size: 18pt; width: 150px; height: 40px">월간</button>
			</div>
			<div style="display: inline-flex; width: 500px;">
				<input type="date" style="width: 250px; height: 40px">
				<span style="font-size: 18pt; margin-left: 15px; margin-right: 15px">~</span>
				<input type="date" style="width: 250px; height: 40px">
			</div>
		</div>
		<div id="chart_div"></div>
		
	</div>



	</section>
	
	
<script type="text/javascript">
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


google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart1);

function drawChart1() {
	var statisticsList = ${statisticsList };
// Create the data table.
var data = new google.visualization.DataTable();
data.addColumn('string', 'LastDate');
data.addColumn('number', 'View');
// data.addRows 는 한번에 데이터를 입력하는 것이고, data.addRow는 하나씩 데이터를 입력하는 것이다
// 즉, Json 형태로 받아온 녀석을 바로 입력하려면 data.addRows 를 사용하고
// 반복문을 통하여 어떤 작업을 수행하고 싶다면 data.addRow를 사용하시오
// data.addRows([				
//   ['Mushrooms', 3],
//   ['Onions', 1],
//   ['Olives', 1], 
//   ['Zucchini', 1],
//   ['Pepperoni', 2]
// ]);

// let today = new Date();
// let year = today.getFullYear(); // 년도
// let month = today.getMonth() + 1;  // 월
// let date = today.getDate();  // 날짜
// let day = today.getDay();  // 요일

for(var i = 0; i < statisticsList.length; i++){
// 	if(i == 0) {
// 		data.addRow([statisticsList[i].start, 0]);
// 	}
	data.addRow([statisticsList[i].end, statisticsList[i].value]);
}
// data.setCell(2,0,'lswn');

var options = {
		  'legend': 'none',
		  'title': 'How Much Pizza I Ate Last Night',
		  'is3D':true,
		  'width': 1100,
		  'height':800,
		  animation:{
		        duration: 1000,
		        easing: 'out'
		      },
//		  'curveType': 'function',
//		  'chartArea': {'width': '90%', 'height': '80%'},
		  'chartArea': {right: 60, width: '85%'},
		  series: {
			0: {lineWidth: 3,				// 선 굵기
				pointShape: 'Circle',		// 포인트 부분 모양
				pointSize: 18,				// 포인트 부분 굵기
			},
		  },
		  
		  hAxis: {
			  title: 'Date',
			  titleTextStyle: {color: 'red', fontSize: 40},
		  },
		  vAxis: {
			  'title': 'Money',
			  'titleFontSize': 18,
			  viewWindow: {
	              min:0,
	            },
	          baselineColor: 'none',	// 밑줄친 부분 색상
		  },
		  colors: ['black'],

		}


// Instantiate and draw our chart, passing in some options.
// var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
chart.draw(data, options);
}
</script>
</body>
</html>