<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>businessShopManagement :: order-processing</title>

	<!-- order-processing css -->
	<link rel="stylesheet" href="${cpath }/business/css/submanagement/OrderStatus/order-processing.css">

	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   	
   	<!-- jQuery CDN -->   	
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
</head>
<body>
	<div class="container">
		<p style="text-align: center;"><< 입력방식을 체크해주시길 바랍니다 >></p>
		<div class="systemdiv" id="systemdiv">
		<h1>
			<i class="far fa-square" onclick="typeSelect(this, 'system')"></i>시스템에서 제공하는 일자
		</h1>
			<div>
				<button onclick="selectSystem(this)"><span class="year"></span><span class="mon-day"></span></button>
				<button onclick="selectSystem(this)"><span class="year"></span><span class="mon-day"></span></button>
				<button onclick="selectSystem(this)"><span class="year"></span><span class="mon-day"></span></button>
				<button onclick="selectSystem(this)"><span class="year"></span><span class="mon-day"></span></button>
			</div>
			<div>
				<button onclick="selectSystem(this)"><span class="year"></span><span class="mon-day"></span></button>
				<button onclick="selectSystem(this)"><span class="year"></span><span class="mon-day"></span></button>
				<button onclick="selectSystem(this)"><span class="year"></span><span class="mon-day"></span></button>
				<button onclick="selectSystem(this)"><span class="year"></span><span class="mon-day"></span></button>
			</div>
		</div>
		
		<div class="etediv">
		<h1>
			<i class="far fa-square" onclick="typeSelect(this, 'ete')"></i>ETE를 활용한 자동 일자
		</h1>
			<div>
				<input type="text" value="ETE" readonly><i class="far fa-question-circle fa-2x" id="etehelp"></i>
				<div class="ete-bubble" id="ete-bubble" style="display: none">
					ETE 설명에 대해서 취급하고 있습니다
					ETE 설명에 대해서 취급하고 있습니다
					ETE 설명에 대해서 취급하고 있습니다
				</div>
			</div>
		</div>

		<div class="inputdiv">
		<h1>
			<i class="far fa-square" onclick="typeSelect(this, 'input')"></i>배송날짜 직접입력
		</h1>
			<input type="date" id="inputdate">
		</div>
		
		<div class="showdiv">
			<div></div>
			<h3>주문코드</h3>
			<p>${salecode }</p>
			<h3>현재일자</h3>
			<p id="today"></p>
			<h3>배송일자</h3>
			<p id="deleverydate"></p>
		</div>
	</div>
	<div class="submitdiv">
		<button onclick="popupExit()">
			취소
		</button>
		<div></div>
		<button onclick="popupSubmit()">
			확인
		</button>
	</div>
	
	<script type="text/javascript">
	
	console.log('주문코드 : ', '${salecode}' );
// 	console.log('현재 url : ', window.location.href);
// 	console.log('현재 url1 : ', (window.location.href).split('/'));
// 	console.log('현재 url2 : ', (window.location.href).split('/').length);
// 	console.log('현재 url3 : ', ((window.location.href).split('/'))[(window.location.href).split('/').length - 2]);
	
	window.onload = function() {
		var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    
	    $('#today').html(year + '-' + month + '-' + day);
	}
	
	function selectSystem(obj) {
		let sysbtns = document.querySelectorAll('#systemdiv div button');
		for(i = 0; i < sysbtns.length; i++) {
			sysbtns[i].className = '';
		}
		obj.className = 'selected';
		console.log('클래스 이름 : ', document.querySelector('#systemdiv i').className);
		if(document.querySelector('#systemdiv i').className == 'far fa-check-square') {
			$('#deleverydate').html(sysdateReplace());
		}
	}
	
	function sysdateReplace() {		// 시스템으로 일정 보내기가 활성화되어 있다면, 시스템 일정을 showdiv에 출력한다
		let systemdate = '';
		let selectedBtn = document.querySelector('#systemdiv .selected');
		systemdate = (selectedBtn.querySelector('.year').innerHTML).replace('년','') + '-';
// 		systemdate += (selectedBtn.querySelector('.mon-day').innerHTML).replace(/(\s*)/g,'');	// 모든 공백 제거
		systemdate += (selectedBtn.querySelector('.mon-day').innerHTML).replace(' / ','-');	// 모든 공백 제거
		return systemdate;
	}
	
	function typeSelect(obj, type) {		// 체크박스 눌렀을 떄 활성화시킴
		
		let checks = document.querySelectorAll('i.fa-check-square');
		for (i = 0; i < checks.length; i++) {
			checks[i].className = 'far fa-square';
		}
		obj.className = 'far fa-check-square';
		
		switch (type) {	// showdiv 안에 배송일자를 반영시키는 타입이 무엇인지 정함
		case "system":
			if(document.querySelector('#systemdiv .selected') != null)
				$('#deleverydate').html(sysdateReplace());
			else
				$('#deleverydate').html('');
			break;
		case "ete":
			$('#deleverydate').html($('.etediv').find('input').val());
			break;
		case "input":
			if(document.getElementById('inputdate').value != null)
				$('#deleverydate').html(document.getElementById('inputdate').value);
			break;

		}
	}
	
	function popupExit() {	// 팝업창 종료
		let popupexit = confirm('주문처리를 취소하시겠습니까?');
		if(popupexit == true)
			close();
	}
	
	function popupSubmit() {  // 처리중 -> 요청 으로 제출
		let popupsubmit = confirm('주문처리를 수락하시겠습니까?');
		// 밑에 axios
	}
	
	// 윈도우 창이 열리면서 시작하는 명령어
	// window.onload 보다 빨리 시작함
	// 시스템에서 제공하는 일자의 날짜 입력
    let dateCount = 0;
    $('#systemdiv').find('button').each(function(index, item) {

    	dateCount++;

        var date = new Date();
        date.setDate(date.getDate() + dateCount);
        var year = date.getFullYear();
        var month = ("0" + (1 + date.getMonth())).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
    	$(item).children('.year').html(year + '년');
    	$(item).children('.mon-day').html(month + ' / ' + day);
    });
    
    document.getElementById('inputdate').addEventListener('change', function() {		// inputdiv의 아이콘이 체크되었을 때, showdiv에 배송날짜 입력
    	if(document.querySelector('.inputdiv i').className == 'far fa-check-square') {
    		$('#deleverydate').html(this.value);
    	}
    });
    
    $('#etehelp').mouseover(function() {
    	console.log('마우스 오버');
    	$('#ete-bubble').css('display', '');
    });
    $('#etehelp').mouseleave(function() {
    	console.log('마우스 리브');
    	$('#ete-bubble').css('display', 'none');
    });
    
	$('#inputdate').change(function() {
		 var today = new Date($('#today').html());
		 var inputdate = new Date($('#inputdate').val());
		if (today > inputdate) {
			alert('현재 날짜 이후의 날짜를 선택바랍니다.');
			$('#inputdate').val('');
			if(document.querySelector('.inputdiv i').className == 'far fa-check-square')
				$('#deleverydate').html('');
		}
	});   
    
	</script>	
</body>
</html>