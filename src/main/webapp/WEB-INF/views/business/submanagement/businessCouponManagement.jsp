<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: businessCouponManagemnet</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- businessCouponManagement css -->
	<link rel="stylesheet" href="${cpath }/business/css/submanagement/businessCouponManagement.css">

	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
		
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
	<!-- sub-header(membership) -->
	<%@ include file="../main/businessSubHeader.jsp" %>
	
	
	<!-- 발급날짜 별로 자동적으로 정렬이 이루어지도록 만들자 -->
<div class="title">
	<h1 style="font-size: 36pt; text-align: left">쿠폰</h1>
</div>
<hr>
<div class="container">
        <div class="inputFlex">
        <div class="inputDivContainer">
        <i class="fas fa-bookmark fa-10x" style="position: absolute; left: -150px; color: #3b5998"></i>
        <span class="bookmark">쿠폰<br>입력</span>
            <div class="inputDiv" id="enrollDiv">
                <h1>기간</h1>
                <input type="date" name="period" id="beforeDate">
                <h1 style="width: 20px; display: inline-block; text-align: center;">-</h1>
                <input type="date" name="period"  id="afterDate" readonly>
                
                <div class="costDiv">
                    <h1>최소주문금액</h1>
                    <input type="text" placeholder="금액을 입력하세요" id="minimumprice" name="minimumprice">
                </div>
                
                <div  class="costDiv">
                    <h1>할인금액</h1>
                    <input type="text" placeholder="금액을 입력하세요" id="discount" name="discount">
                </div>

                
                <div  class="radioDiv">	<!-- 체크되었을 때 옆에 입력란 활성화 -->
                    <input type="radio" name="maxissuenum" id="unlimitedcoupon">	<!-- 선착순도 name="maxissunum" value 값이 0이 되지 않도록 하기 -->
                    <h1>무제한</h1>
                </div>
                <div  class="radioDiv">	<!-- 체크되었을 때 옆에 입력란 활성화 -->
                    <input type="radio" name="maxissuenum" id="limitedcoupon">	<!-- 선착순도 name="maxissunum" value 값이 0이 되지 않도록 하기 -->
                    <h1>선착순</h1>
                    <input tpye="text" placeholder="숫자를 입력하세요" id="limitedcouponNum" style="display: none; ">
                </div>
                <div class="bottombg1"></div>
                <div class="topbg1"></div>

            </div>
                    </div>
            <div class="sideinputDiv">
                <div class="sidedivborder">
                    <div class="buttonDiv">
                        <input type="button" value="등록" onclick="couponEnrollment()">
                    </div>
                        <div class="sideCircle-black" style="top: -2px"></div>
                        <div class="sideCircle-black" style="top: 78px"></div>
                        <div class="sideCircle-black" style="top: 158px"></div>
                        <div class="sideCircle-black" style="top: 238px"></div>
                        <div class="sideCIrcle-white" style="top: -1px"></div>
                        <div class="sideCIrcle-white" style="top: 79px"></div>
                        <div class="sideCIrcle-white" style="top: 159px"></div>
                        <div class="sideCIrcle-white" style="top: 239px"></div>
                        <div class="side-hr"></div>
                        <div class="bottombg2"></div>
                        <div class="topbg2"></div>
                    </div>
                </div>
            </div>
    
    
        </div>
	
	<hr>
	
	<div id="enrollmentedDiv" class="container">
	
	</div>

	</section>
	<script type="text/javascript">

	var couponlist = null;
	var slidenum = null;		// 화살표 누를 때마다 3개씩 쿠폰보여주기 위한 변수
	
	window.onload = function() {
		var inputDate = document.querySelectorAll('input[type="date"]');
	
		var date = new Date();
		var year = date.getFullYear();
		var month = new String(date.getMonth()+1);
		var day = new String(date.getDate()); 
		
		for(i = 0; i < 2; i++) {
			inputDate[i].setAttribute('min', year + '-' + month + '-' + day);
		}
		couponlist = ${couponList };
		showCounpons();
		slidenum = 3;
	}
	
	document.getElementById('beforeDate').addEventListener('change', function() {
		if(this.value !== null) {
			document.getElementById('afterDate').readOnly = false;
		}
	})
	
	document.getElementById('afterDate').addEventListener('change', function() {
		var beforeDate = new Date(document.getElementById('beforeDate').value);
		var afterDate = new Date(this.value);
				
		if(beforeDate > afterDate) {
			alert('만료기간이 시작기간보다 빠릅니다');
			this.value = '';
		}
	})

	// 쿠폰 등록하는 함수
	function couponEnrollment() {
		var enrollconfirm = confirm('새로운 쿠폰을 등록하시겠습니까?');
		
		if(enrollconfirm == false)
			return false;
		else {
			var beforevalue = document.querySelector('#beforeDate').value; 
			var aftervalue = document.querySelector('#afterDate').value; 
			var minimumvalue = document.querySelector('#minimumprice').value;
			var discountvalue = document.querySelector('#discount').value;
			var radioResult = document.querySelector('#enrollDiv input[type="radio"]:checked');
			var maxissuenum = 0;
			if(radioResult.id == 'limitedcoupon') {
				maxissuenum = document.getElementById('limitedcouponNum').value;
			}
			
			console.log('기간 : ', beforevalue + ' ~ ' + aftervalue);
			
			let ob={
					   'period': beforevalue + ' ~ ' + aftervalue,
					   'minimumprice': minimumvalue,
					   'discount': discountvalue,
					   'maxissuenum': maxissuenum,
			      	};
			
			console.log('ob : ', ob);
			
	        const axPost = async (ob) => {   // async : 비동기 실행 함수
	            await axios.post('/drumtong/business/subManagement/businessCouponManagement/rest/add/' , ob)
	            // 정상
	       		.then( (response) => {
	            const data = response.data;
	            couponlist = data;
				showCounpons();
	             })
	          }
			return axPost(ob);			
		}
		
	}
	
	// 쿠폰 삭제하는 함수
	function deleteCoupon(obj) {
		var deleteconfirm = confirm('정말로 쿠폰을 삭제하시겠습니까?');
		
		if(deleteconfirm == false)
			return false;
		else {
			console.log('coupon id : ', obj.id);
			let ob={
					   'couponid': obj.id,
			      	};
			
	        const axPost = async (ob) => {   // async : 비동기 실행 함수
	            await axios.post('/drumtong/business/subManagement/businessCouponManagement/rest/del/' , ob)
	            // 정상
	       		.then( (response) => {
	            const data = response.data;
	            couponlist = data;
				showCounpons();
	             })
	          }
			return axPost(ob);		
		}
	}
	
	// 등록된 쿠폰 리스트 보여주는 함수
	function showCounpons() {
		var enrollmentedDiv = document.getElementById('enrollmentedDiv');
		enrollmentedDiv.innerHTML = null;		
		
		for(i = 0; i < couponlist.length; i++) {
			
		var container = document.createElement('div');
		container.className = 'container';
		var inputFlex = document.createElement('div');
		inputFlex.className = 'inputFlex';
		var inputdivcontainer = document.createElement('div');
		inputdivcontainer.className = 'inputDivContainer';
		var inputdiv = document.createElement('div');
		inputdiv.className = 'inputDiv';
		
		var listsplit = (couponlist[i].period).split('~');			//	필수
		
		// 날짜 div
		var period = document.createElement('h1');
		period.innerHTML = '기간';
		var beforedate = document.createElement('input');
		beforedate.setAttribute('type', 'date');
		beforedate.setAttribute('value', listsplit[0].slice(0,-1));	// 마지막 공백 한글자 제거			//	필수
		beforedate.readOnly = true;
		var tagh1 = document.createElement('h1');
		tagh1.style.width = '20px';
		tagh1.style.display = 'inline-block';
		tagh1.style.textAlign = 'center';
		tagh1.innerHTML = '-';
		var afterdate = document.createElement('input');
		afterdate.setAttribute('type', 'date');
		afterdate.setAttribute('value', listsplit[1].slice(1));	// 첫번째 공백 한글자 제거			//	필수
		afterdate.readOnly = true;
		inputdiv.appendChild(period);
		inputdiv.appendChild(beforedate);
		inputdiv.appendChild(tagh1);
		inputdiv.appendChild(afterdate);
		
		// 최소주문금액 div
		var costdiv1 = document.createElement('div');
		costdiv1.className = 'costDiv';
		var minh1 = document.createElement('h1');
		minh1.innerHTML = '최소주문금액';
		var mininput = document.createElement('input');
		mininput.setAttribute('type', 'text');
		mininput.setAttribute('value', couponlist[i].minimumprice);			//	필수
		mininput.readOnly = true;
		costdiv1.appendChild(minh1);
		costdiv1.appendChild(mininput);
		inputdiv.appendChild(costdiv1);

		// 할인금액 div
		var costdiv2 = document.createElement('div');
		costdiv2.className = 'costDiv';
		var minh2 = document.createElement('h1');
		minh2.innerHTML = '할인금액';
		var saleinput = document.createElement('input');
		saleinput.setAttribute('type', 'text');
		saleinput.setAttribute('value', couponlist[i].discount);			//	필수
		saleinput.readOnly = true;
		costdiv2.appendChild(minh2);
		costdiv2.appendChild(saleinput);
		inputdiv.appendChild(costdiv2);
		
		// 무제한 버튼
		var radiodiv1 = document.createElement('div');
		radiodiv1.className = 'radioDiv';
		var radio1 = document.createElement('input');
		radio1.setAttribute('type', 'radio');
		radio1.disabled = true;
		if(couponlist[i].maxissuenum == 0) {
			radio1.checked = true;
		}
		var radioname1 = document.createElement('h1');
		radioname1.innerHTML = '무제한';
		radiodiv1.appendChild(radio1);
		radiodiv1.appendChild(radioname1);
		inputdiv.appendChild(radiodiv1);
		
		// 선착순 버튼
		var radiodiv2 = document.createElement('div');
		radiodiv2.className = 'radioDiv';
		var radio2 = document.createElement('input');
		radio2.setAttribute('type', 'radio');
		radio2.disabled = true;

		var radioname2 = document.createElement('h1');
		radioname2.innerHTML = '선착순';
		radiodiv2.appendChild(radio2);
		radiodiv2.appendChild(radioname2);
		if(couponlist[i].maxissuenum !== 0) {			//	필수
			radio2.checked = true;
			var showcouponnum = document.createElement('input');
			showcouponnum.setAttribute('type', 'text');
			showcouponnum.value = couponlist[i].maxissuenum;			//	필수
			showcouponnum.readOnly = true;
			radiodiv2.appendChild(showcouponnum);
		}
		inputdiv.appendChild(radiodiv2);
		
		var bottombg1 = document.createElement('div');
		bottombg1.className = 'bottombg1';
		var topbg1 = document.createElement('div');
		topbg1.className = 'topbg1';
		inputdiv.appendChild(bottombg1);
		inputdiv.appendChild(topbg1);
		
		inputdivcontainer.appendChild(inputdiv);
		inputFlex.appendChild(inputdivcontainer);
	
		var sideinputDiv = document.createElement('div');
		sideinputDiv.className = 'sideinputDiv';
		var sidedivborder = document.createElement('div');
		sidedivborder.className = 'sidedivborder';
		var buttonDiv = document.createElement('div');
		buttonDiv.className = 'buttonDiv';
		var deleteButton = document.createElement('input');
		deleteButton.setAttribute('type', 'button');
		deleteButton.setAttribute('value', '삭제');
		deleteButton.setAttribute('id', couponlist[i].couponid);			//	필수
		deleteButton.setAttribute('onclick', 'deleteCoupon(this)');
		buttonDiv.appendChild(deleteButton);
		sidedivborder.appendChild(buttonDiv);
		
		var black1 = document.createElement('div');
		black1.className = 'sideCircle-black';
		black1.style.top = '-2px';
		sidedivborder.appendChild(black1);
		var black2 = document.createElement('div');
		black2.className = 'sideCircle-black';
		black2.style.top = '78px';
		sidedivborder.appendChild(black2);
		var black3 = document.createElement('div');
		black3.className = 'sideCircle-black';
		black3.style.top = '158px';
		sidedivborder.appendChild(black3);
		var black4 = document.createElement('div');
		black4.className = 'sideCircle-black';
		black4.style.top = '238px';
		sidedivborder.appendChild(black4);
		
		var white1 = document.createElement('div');
		white1.className = 'sideCIrcle-white';
		white1.style.top = '-1px';
		sidedivborder.appendChild(white1);
		var white2 = document.createElement('div');
		white2.className = 'sideCIrcle-white';
		white2.style.top = '79px';
		sidedivborder.appendChild(white2);
		var white3 = document.createElement('div');
		white3.className = 'sideCIrcle-white';
		white3.style.top = '159px';
		sidedivborder.appendChild(white3);
		var white4 = document.createElement('div');
		white4.className = 'sideCIrcle-white';
		white4.style.top = '239px';
		sidedivborder.appendChild(white4);
		
		var sidehr = document.createElement('div');
		sidehr.className = 'side-hr';	
		var bottombg2 = document.createElement('div');
		bottombg2.className = 'bottombg2';
		var topbg2 = document.createElement('div');
		topbg2.className = 'topbg2';
		sidedivborder.appendChild(sidehr);
		sidedivborder.appendChild(bottombg2);
		sidedivborder.appendChild(topbg2);
		
		
		sideinputDiv.appendChild(sidedivborder);
		inputFlex.appendChild(sideinputDiv);
		container.appendChild(inputFlex);
		
		enrollmentedDiv.appendChild(container);
	
		}
	}
	
	// input type="text" 숫자만 입력하기
	document.getElementById('minimumprice').addEventListener('keyup', costSlice);
	document.getElementById('discount').addEventListener('keyup', costSlice);
	document.getElementById('limitedcouponNum').addEventListener('keyup', costSlice);
	function costSlice() {
		var regexp = /^[0-9]*$/
			if(!regexp.test(this.value)) {
				this.value = this.value.slice(0,-1);		// 마지막 한글자만 잘라내기
			}
	}
	
	document.getElementById('limitedcoupon').addEventListener('change', function() {
		var inputradiodiv = document.getElementById('limitedcoupon').parentNode;
		if(this.checked == true) {
			document.getElementById('limitedcouponNum').style.display = '';
 		}
	})
	
	document.getElementById('unlimitedcoupon').addEventListener('change', function() {
		document.getElementById('limitedcouponNum').style.display = 'none';
		document.getElementById('limitedcouponNum').value = null;
	})
	

</script>
</body>

</html>