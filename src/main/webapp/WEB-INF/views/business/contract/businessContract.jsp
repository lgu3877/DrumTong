<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>businessContaract :: Laundry</title>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css"> 
    <link rel="stylesheet" href="${cpath }/business/css/contract/businessContract.css"> 
     	
    <!-- Font -->
   <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

	<!-- 스크립트 영역 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</head>
<body>
    <%@ include file="../main/businessHeader.jsp" %>

	<div class="marginauto" style="width: 900px; height: 1000px; border: 1px">
	
	<div class="marginauto" style="height: 15%; text-align: left;">
		<h1 style="font-size: 32pt; margin-left: 20px;">온라인 계약</h1>
	<hr>
	</div>	
	<div  class="marginauto" style="height: 85%; width: 100%">	
		<div style="text-align: left;" id="iconDiv">
			<i class="fas fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
			<i class="far fa-circle fa-3x"></i>
		</div>
    	<img id="prevBtn" style="position: fixed; width: 70px; top: 45%; left: 0; z-index: 9999;" src="${cpath }/resources/business/img/prev_button.png" onclick="prevButton()">
    	<img id="nextBtn" style="position: fixed; width: 70px; top: 45%; rig
    	ht: 0; z-index: 9999;" src="${cpath }/resources/business/img/next_button.png" onclick="nextButton()">
    	<form  class="marginauto" style="width: 800px; height: 800px;">
        	<%@ include file="./businessContract1.jsp" %>
        	<%@ include file="./businessContract2.jsp" %>
        	<%@ include file="./businessContract3.jsp" %>
        	<%@ include file="./businessContract4.jsp" %>
        	<%@ include file="./businessContract5.jsp" %>
    	</form>
    </div>
    

    
	</div>
	
<script>
	var iconDiv = document.getElementById('iconDiv');
	document.getElementById('crn').addEventListener('blur', checkBusinessNumber);
	
    var container = document.querySelectorAll('form div.container');
    
	function prevButton() {
		for(i = 1; i < container.length; i++) {
			if(container[i].style.display == '') {
				container[i].style.display = 'none';
				container[i - 1].style.display = '';
				break;
			}
		}
		for(j = 1; j < iconDiv.children.length; j++) {
			if(iconDiv.children[j].className == 'fas fa-circle fa-3x') {
				iconDiv.children[j].className = 'far fa-circle fa-3x';
				iconDiv.children[j - 1].className = 'fas fa-circle fa-3x';
				break;
			}
		}
	}

	function nextButton() {
		for(i = 0; i < container.length - 1; i++) {
			if(container[i].style.display == '') {
				container[i].style.display = 'none';
				container[i + 1].style.display = '';
				break;
			}
		}
		for(j = 0; j < iconDiv.children.length - 1; j++) {
			if(iconDiv.children[j].className == 'fas fa-circle fa-3x') {
				iconDiv.children[j].className = 'far fa-circle fa-3x';
				iconDiv.children[j + 1].className = 'fas fa-circle fa-3x';
				break;
			}
		}
	}
	
	// 어째서 getElementById 적용이 되지 않는가?
	function preCheck(obj) {

		var preA = obj.parentNode.querySelector('#preA');
		var preB = obj.parentNode.querySelector('#preB');
		
		if(preA.checked === true && preB.checked === true) {
			nextButton();
		}
		else
			alert('약관을 모두 동의하시길 바랍니다');
	}

    function contract2Check(obj) {
    	
    	var str_space = /\s/;               // 공백 체크
    	
    	var checkItem = obj.parentNode.querySelectorAll('div.c2-input input[type="text"]');
    	var checkFile = obj.parentNode.querySelector('div.c2-input input[type="file"]');
    	
    	//input 태그에 공백이거나 공백이 포함됐을 때 그쪽으로 focus
		for(i = 0; i < checkItem.length; i++) {
	    	if(str_space.exec(checkItem[i].value) || checkItem[i].value === '') {
	    		checkItem[i].focus();
	    		return false;
	    	}	    	
		}		
		// 사업자 등록증 삽입했는지 점검
		if (!checkFile.value) {
			checkFile.focus();
			return false;
		}		
		nextButton();
    }
    
    function contract3Check(onj) {
    	
    }
    
    
    
	// 사업자 번호 확인
	function checkBusinessNumber() {
		var crn = document.getElementById('crn').value;
		var crnmsg = document.getElementById('crnmsg');
		var regExp = /^\d{3}-\d{2}-\d{5}$/;
		
		if(crn === '') {
			crnmsg.innerHTML = '사업자 번호를 입력해주세요'
			crnmsg.style.color = 'red'
		}
		else if(regExp.test(crn) === false) {
			crnmsg.innerHTML = 'OOO-OO-OOOOO 양식을 따라주세요';
			crnmsg.style.color	 = 'red';
			return false;
		}
		else if(regExp.test(crn) === true){
			crnmsg.innerHTML = '사업자번호 인증 완료';
			crnmsg.style.color = 'blue';
		    return true;
		}
		
	}
	
	
	// 사업자 등록증 업로드 버튼 변할 떄마다
	document.getElementById('license').addEventListener('change', imgDiv);
	
	// 삽입한 이미지 활성화시킴
	function imgDiv() {

		var imgspace = document.getElementById('img-space');
		var license = document.getElementById('license');
		
		var img = new Image();		
		img.src = URL.createObjectURL(license.files[0]);
		
		img.onload = function() {
			imgspace.setAttribute('src', img.src);
		}		
	}
	
	
	// 통장 사본 업로드 버튼 변할 때마다
	document.getElementById('copyofbankbook').addEventListener('change', copyDiv);
	
	// 삽입한 이미지 활성화시킴
	function copyDiv() {

		var copyspace = document.getElementById('copy-space');
		var copyofbankbook = document.getElementById('copyofbankbook');
		
		var img = new Image();		
		img.src = URL.createObjectURL(copyofbankbook.files[0]);
		
		img.onload = function() {
			copyspace.setAttribute('src', img.src);
		}		
	}
	
	// 모두 동의 누르면 약관 동의되도록
	document.getElementById('allcheck').addEventListener('change', function() {
		if(this.checked) {
			document.getElementById('preA').checked = true;
			document.getElementById('preB').checked = true;
		}
	})
	
		// 주소 확인
	function searchAddress() {
        new daum.Postcode(
                {
                    oncomplete : function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                                && /[동|로|가]$/g.test(data.bname)) {
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                                && data.apartment === 'Y') {
                            extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                    + data.buildingName : data.buildingName);
                        }
                        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraRoadAddr !== '') {
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }
                        // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                        if (fullRoadAddr !== '') {
                            fullRoadAddr += extraRoadAddr;
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('mainlocation').value = fullRoadAddr; //5자리 새우편번호 사용
                    }
                }).open();
    }
	
	document.getElementById('bank-modal-button').addEventListener('click', bankModal);
	
	function bankModal() {
        var modal = document.getElementById('modal');

        // 모달 div 뒤에 희끄무레한 레이어
        var bg = document.createElement('div');
        bg.id = 'modalbg';
        bg.setStyle({
            position: 'fixed',
            zIndex: '9999',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            backgroundColor: 'rgba(0,0,0,0.5)'
        });
        document.body.append(bg);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
         	modal.querySelector('.modal-close').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });

         modal.setStyle({
            position: 'fixed',
            display: 'block',
            
            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: 10000,
			backgroundColor: 'white',
			width: '500px',
			height: '500px',
			
            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
 	        msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };

    function selectBank(obj) {
    	document.getElementById('accountbank').value = obj.id;
    	document.getElementById('modalbg').remove();
    	obj.parentNode.style.display = 'none';    	
    }
    
/*     var path = '${cpath}/resources/business/img/bank/';
    var fs = require('fs`');
    
    fs.readdir(path, (err, filelist) => {
    	console.log(filelist);
    }); */
	
</script>

</body>
</html>