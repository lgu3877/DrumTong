    function drawChart() {	// 구글 차트 그려주기

	var data = google.visualization.arrayToDataTable([
        ["score", "number", "total",  { role: 'annotation' }],
        [" ", 0, reviewList.length, ''],
        ["1.0", 0, reviewList.length, ''],
        [" ", 0, reviewList.length, ''],
        ["2.0", 0, reviewList.length, ''],
        [" ", 0, reviewList.length, ''],
        ["3.0", 0, reviewList.length, ''],
        [" ", 0, reviewList.length, ''],
        ["4.0", 0, reviewList.length, ''],
        [" ", 0, reviewList.length, ''],
        ["5.0", 0,  reviewList.length, ''],
      ]);
      
      
      for(i = 0; i < reviewList.length; i++) {		// 구글 차트 그래프에 점수 넣는 기능
		data.setCell((reviewList[i].gpa * 2) - 1, 1, data.getValue((reviewList[i].gpa * 2) - 1, 1) + 1);
		data.setCell((reviewList[i].gpa * 2) - 1, 2, data.getValue((reviewList[i].gpa * 2) - 1, 2) - 1);
      }
      

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
		width:'100%',
  		height: 400,
  		chartArea:{	
  			
  			top: '5%',
  			width:'90%',
  			height: '85%',
  		},
        bar: {groupWidth: "50%",         },	// bar 하나하나의 굵기
        legend: { position: "none" },
        isStacked: true,
        seriesType: 'bars',
        series: {
        	0: {color: 'navy' },
        	1: {color: '#e5e4e2' },
        },
        vAxis: {
            gridlines: {
                color: 'transparent'
            }
	     },
        enableInteractivity: false,		// hover와 관련된 모든 기능 중지
//         tooltip : { trigger: 'none'}	// hover 했을 때 해당열의 정보 띄우는 기능만 중지
      };
// 	  console.log('최고값 : ', data.getColumnRange(1).max);
	  var chart = new google.visualization.ComboChart(document.getElementById("columnchart_values"));
      chart.draw(data, options);
  } 
    
    function calcscore() {
    	let avgcscore = 0;
    	for(i = 0; i < reviewList.length; i++) {
    		avgcscore += reviewList[i].gpa;
    	}
    	let cscore = avgcscore / reviewList.length;
    	
    	$('#cscore').html('고객 평점 : ' + cscore.toFixed(2));
    	$('#frontstars').css('width', (cscore.toFixed(2) * 20) + '%');
    }