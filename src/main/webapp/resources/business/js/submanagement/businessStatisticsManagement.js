google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart1);



function getWeekNum(formatday) {
	let weekday = new Date(formatday);
    const firstDayOfYear = new Date(weekday.getFullYear(), weekday.getMonth(), 1);
    const pastDaysOfYear = (new Date(weekday) - firstDayOfYear) / 86400000;	//60 x 60 x 24 x 1000
	return Math.ceil((pastDaysOfYear + firstDayOfYear.getDay() + 1) / 7);
}

	
function drawChart1() {
// Create the data table.
const data = new google.visualization.DataTable();
data.addColumn('string', '일시');
data.addColumn('number', returnContent((document.querySelector('.flex1 button.selected').name).slice(0,-1)));

if((document.querySelector('.flex1 button.selected').name).slice(0,-1) == 'Price') {
	let formatter = new google.visualization.NumberFormat({	// 가격은 돈으로 단위를 표현해야 함
	    prefix: '$',
	    negativeParens: true
	  });

	  formatter.format(data, 1);
}
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

var i = 0;
if (document.querySelector('.flex3 button.selected').value == 'Day/') {
	for(i = 0; i < statisticsList.length; i++){
 		if(i == 0) {
 			data.addRow(['', 0]);
 		}
		data.addRow([statisticsList[i].end, statisticsList[i].value]);
	}
}
else if (document.querySelector('.flex3 button.selected').value == 'Week/') {
	for (i = 0; i < statisticsList.length; i++){
 		if(i == 0) {
 			data.addRow(['', 0]);
 		}
 		const splitDate1 = (statisticsList[i].end).split('-');
//  		console.log('statisticsList[i].enddate : ', statisticsList[i].enddate);
		data.addRow([splitDate1[1] + '월 ' + getWeekNum(statisticsList[i].enddate) +  '주', statisticsList[i].value ]);
	}
}
else if (document.querySelector('.flex3 button.selected').value == 'Month/') {
	for(i = 0; i < statisticsList.length; i++){
 		if(i == 0) {
 			data.addRow(['', 0]);
 		}
 		const splitDate2 = (statisticsList[i].end).split('-');
		data.addRow([splitDate2[0] + '년 ' + splitDate2[1] + '월', statisticsList[i].value]);
	}
}
// data.setCell(2,0,'lswn');

var options = {		// 그래프의 옵션을 세팅하는 부분
		  legend: 'none',
		  backgroundColor: 'whitesmoke',
		  title: '',
		  titleTextStyle: {
			fontSize: 28,
		  },
		  is3D:true,
		  width: 1100,
		  height:800,
		  animation:{
		        duration: 1000,
		        easing: 'out'
		      },
//		  'curveType': 'function',
		  chartArea: {right: 40, width: '85%',},
		  series: {
			0: {lineWidth: 3,				// 선 굵기
				pointShape: 'Circle',		// 포인트 부분 모양
				pointSize: 12,				// 포인트 부분 굵기
			},
		  },
		  hAxis: {
			  title: '',
			  textPosition: 'out',
			  titleTextStyle: {color: 'black', fontSize: 20},
// 				direction : -1, // 상하 반전
			  "slantedText" : true,
// 			  "slantedTextAngle" : 45,
		  },
		  vAxis: {
			  className:'12345',
			  title: '',
			  titleFontSize: 20,
			  viewWindow: {
	              min:0,
	            },
	          baselineColor: 'none',	// 밑줄친 부분 색상
		  },
		  colors: ['black'],
		}
if ((document.querySelector('.flex1 button.selected').name).slice(0,-1) == 'Price') {
	options.vAxis.format = '$#,##0.00;($#,##0.00)';	// 가격을 표현해야 할 때에는 $ 표시를 붙인다
  }
  
let graphtitle = returnContent((document.querySelector('.flex1 button.selected').name).slice(0,-1)) + ' / ';
switch ((document.querySelector('.flex3 button.selected').value).slice(0,-1)) {
	case 'Day':
		graphtitle += '일간 그래프';
		options.hAxis.title = '일간';
		break;
	case 'Week':
		graphtitle += '주간 그래프';
		options.hAxis.title = '주간';
		break;
	case 'Month':
		graphtitle += '월간 그래프';
		options.hAxis.title = '월간';
		break;
	}
	options.vAxis.title = returnContent((document.querySelector('.flex1 button.selected').name).slice(0,-1));
	options.title = graphtitle;

	const chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
	chart.draw(data, options);

	let axies = document.querySelectorAll('svg g g text[text-anchor="middle"]');
	for(k = 0; k < axies.length; k++) {
		axies[k].style.fontSize = '20pt';
	}

}

function returnContent(content) {
	switch (content) {
	case 'Hits':
		return '조회수';
		break;
	case 'Orders':
		return '주문수';
		break;
	case 'Price':
		return '가격';
		break;
	}
}


document.getElementById('startDate').addEventListener('change', function() {
// 	console.log('vlaue1 : ', this.value);
	const endDate = document.getElementById('endDate').value;
	startdatepath = this.value + '/';
	if(endDate == '') {
		return false;
	}
	if(endDate < this.value ) {
		alert('끝 날짜보다 앞선 날짜를 선택해 주십시오');
		this.value = '';
		return false;
	}
	pageKindAxios(document.querySelector('.flex3 button.selected').value);
})

document.getElementById('endDate').addEventListener('change', function() {
	const startDate = document.getElementById('startDate').value;
	if(startDate > this.value) {
		alert('시작 날짜보다 지난 날짜를 선택해 주십시오');
		this.value = '';
		return false;
	}
	if(startDate == '') {
		return false;
	}
	enddatepath = this.value + '/';
	pageKindAxios(document.querySelector('.flex3 button.selected').value);
})

// 동기식으로 페이지 이동시켜주는 함수(조회수, 주문수, 주문금액)
function contentChange(obj) {
	location.href = window.location.href + obj.name + 'Day/' + startdatepath + enddatepath;
}

// 일간, 주간, 월간을 구분시켜주는 함수
function lastpath(obj) {
	lastPath = obj.value;
	for(i = 0; i < obj.parentNode.children.length; i++) {
 		obj.parentNode.children[i].className = '';
	}
	obj.className = 'selected';
	pageKindAxios(obj.value);
}


// 날짜를 선택했을 때 새로운 리스트 들고오는 함수
function pageKindAxios(path) {
	
	let ob={	// ■ 영경 : pagekind의 k를 대문자로 수정 ■
				'pageKind' : (document.querySelector('.flex1 button.selected').name).slice(0,-1),
				'option' : path.slice(0,-1),
				'startDate': document.getElementById('startDate').value,
			    'endDate': document.getElementById('endDate').value,
	      	};

	if(document.getElementById('endDate').value == '' && document.getElementById('startDate').value == '') {
		let today = new Date();
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		let day = today.getDay();  // 요일
		let prevyear, prevmonth, prevdate = null;
		switch (path) {
		case 'Day/':
			today.setDate(today.getDate()  - 6);
			prevyear = today.getFullYear();
			prevmonth = today.getMonth() + 1;
			prevdate = today.getDate();
			ob.endDate = year + '-' + month + '-' + date;
			ob.startDate = prevyear + '-' + prevmonth + '-' + prevdate;
			break;
		case 'Week/':
			today.setDate(today.getDate()  - 35);
			prevyear = today.getFullYear();
			prevmonth = today.getMonth() + 1;
			prevdate = today.getDate();
			ob.endDate = year + '-' + month + '-' + date;
			ob.startDate = prevyear + '-' + prevmonth + '-' + prevdate;
			break;
		case 'Month/':
			today.setDate(today.getDate()  - 120);
			prevyear = today.getFullYear();
			prevmonth = today.getMonth() + 1;
			prevdate = today.getDate();
			ob.endDate = year + '-' + month + '-' + date;
			ob.startDate = prevyear + '-' + prevmonth + '-' + prevdate;
			break;
		}
	}
	
	const axiosPath = getContextPath() + '/business/subManagement/businessStatisticsManagement/rest/';
	const axPost = async (ob) => { // ■ 영경 : 여기 ob를 넘겨주지 않았음! ■   // async : 비동기 실행 함수
	    await axios.post(axiosPath, ob)	// ■ 영경 : 여기 ob를 넘겨주지 않았음! ■
	    // 정상
			.then( (response) => {
	    const data = response.data;
// 	    console.log('data : ', data);
	  	statisticsList = data;			// 반환 결과 불러오기
	  	document.getElementById('chart_div').innerHTML = '';
	    drawChart1();
	     })
	  }
	return axPost(ob);
}