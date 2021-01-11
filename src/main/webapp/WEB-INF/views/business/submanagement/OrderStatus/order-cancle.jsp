<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>businessShopManagement :: order-cancle</title>

	<!-- order-processing css -->
	<link rel="stylesheet" href="${cpath }/business/css/submanagement/OrderStatus/order-cancle.css">

	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   	
   	<!-- jQuery CDN -->   	
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
</head>
<body>
	<div class="container">
		<h1> << ${salecode } : 주문취소 >></h1>
		<div class="subcontainer">
			<div>배달불가지역</div>
			<div>배달 지연</div>
			<div>가게 사정</div>
		</div>
		<div class="subcontainer">
			<div>메뉴 및 가게정보 다름</div>
			<div>고객정보 부정확</div>
			<div id="etc">기타</div>
		</div>
			<textarea class="etxbox" style="display: none;" id="etxbox" rows="6" cols="6" maxlength="200" placeholder="자세한 사정을 입력바랍니다">
		
			</textarea>
			
		<div class="btndiv">
			<button onclick="popupExit()">취소</button>
			<div></div>
			<button onclick="popupSubmit()">확인</button>
		</div>
	</div>


<script type="text/javascript">
	$('.container').find('.subcontainer div').on('click', function() {
		$('.container').find('.subcontainer div.selected').attr('class', '');
		$(this).attr('class', 'selected');
		$('#etxbox').css('display', 'none');
		$('#etxbox').val('');
	});
	$('#etc').on('click', function() {
		$('#etxbox').css('display', '');
	});
	
	function popupExit() {	// 팝업창 종료
		let popupexit = confirm('창을 닫으시겠습니까?');
		if(popupexit == true)
			close();
	}
	
	function popupSubmit() {  // 처리중 -> 요청 으로 제출
		let popupsubmit = confirm('주문취소를 처리하시겠습니까?');
		
		let ob={
				   'salecode': '${salecode}',
				   'reason' : '개인적인 사정',
		      	};
		
		var axiosPath = '/drumtong/business/subManagement/businessOrderStatusManagement/rest/REQUEST/Decline/';
        const axPost = async (ob) => {   // async : 비동기 실행 함수
            await axios.post(axiosPath, ob)
            // 정상
       		.then( (response) => {
            const data = response.data;
            opener.location.reload();
            close();
            })
        }
		return axPost(ob);
	}
	
</script>
</body>
</html>