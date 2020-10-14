
google.charts.load('current', {'packages' : [ 'corechart' ]});

google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var data = new google.visualization.DataTable();
	data.addColumn('string', '날짜');
	data.addColumn('number', '방문자');
	data.addRows([ [ 'Day 1', 3102 ], [ 'Day 2', 1250 ], [ 'Day 3', 1473 ],
			[ 'Day 5', 432 ], [ 'Day 4', 945 ] ]);

	var options = {
		'title' : '월별 사이트 방문자 수 입니다.',
		'width' : 100 + "%",
		'height' : 100 + "%"
	};

	var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	chart.draw(data, options);
}