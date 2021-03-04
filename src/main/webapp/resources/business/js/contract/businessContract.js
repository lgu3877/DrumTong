	var iconDiv = document.getElementById('iconDiv');
	document.getElementById('crn').addEventListener('blur', checkBusinessNumber);
	
    var container = document.querySelectorAll('form div.container');
	
    // 페이지 완성되면 삭제할 예정
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
	
	//  businessContract1.jsp -> 약관동의 
	function preCheck(obj) {

		let preA = obj.parentNode.querySelector('#preA');
		let preB = obj.parentNode.querySelector('#preB');
		
		if(preA.checked === true && preB.checked === true) {
			nextButton();
		}
		else
			alert('약관을 모두 동의하시길 바랍니다');
	}

	// businessContract2.jsp -> Next 버튼
    function contract2Check(obj) {
    	let str_space = /\s/;               // 공백 체크
    	
    	let checkItem = obj.parentNode.querySelectorAll('div.c2-input input[type="text"]');
    	let checkFile = obj.parentNode.querySelectorAll('div.c2-input input[type="file"]');
    	
    	
    	let texation = obj.parentNode.querySelector('#texation');
    	
    	//input 태그에 공백이거나 공백이 포함됐을 때 그쪽으로 focus
		for(i = 0; i < checkItem.length; i++) {
	    	if((str_space.exec(checkItem[i].value) || checkItem[i].value === '') && checkItem[i].name !== 'mainlocation') {
	    		checkItem[i].focus();
	    		return false;
	    	}	    	
		}
    	
    	if(texation.value === 'null') {
    		texation.focus();
    		return false;
    	} 
    	    	
		// 사업자 등록증 삽입했는지 점검
		for(j = 0; j < checkFile.length; j++){
			if (!checkFile[j].value) {
				//checkFile[j].focus();
				return false;
			}		
		}
		nextButton();
    }
    
	// businessContract3.jsp -> Next 버튼
    function contract3Check(obj) {
    	let str_space = /\s/;               // 공백 체크
    	
    	let checkItem = obj.parentNode.querySelectorAll('div.c3-input input[type="text"]');
    	let checkFile = obj.parentNode.querySelector('div.c3-input input[type="file"]');

    	
    	//input 태그에 공백이거나 공백이 포함됐을 때 그쪽으로 focus
		for(i = 0; i < checkItem.length; i++) {
	    	if(str_space.exec(checkItem[i].value) || checkItem[i].value === '') {
	    		checkItem[i].focus();
	    		return false;
	    	}	    	
		}		
		if (!checkFile.value) {
			//checkFile.focus();
			return false;
		}		
		nextButton();
    }
    
    
	// 사업자 번호 확인
	function checkBusinessNumber() {
		const crn = document.getElementById('crn').value;
		let crnmsg = document.getElementById('crnmsg');
		let regExp = /^\d{3}-\d{2}-\d{5}$/;
		
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

		let imgspace = document.getElementById('img-space');
		let license = document.getElementById('license');
		
		let img = new Image();		
		img.src = URL.createObjectURL(license.files[0]);
		
		img.onload = function() {
			imgspace.setAttribute('src', img.src);
		}		
	}

	
	// 영업자 신고증 업로드 버튼 변할 떄마다
	document.getElementById('reportcard').addEventListener('change', reportcardDiv);
	
	// 영업자 신고증  삽입한 이미지 활성화시킴
	function reportcardDiv() {

		let reportcardspace = document.getElementById('reportcard-space');
		let reportcard = document.getElementById('reportcard');
		
		let img = new Image();		
		img.src = URL.createObjectURL(reportcard.files[0]);
		
		img.onload = function() {
			reportcardspace.setAttribute('src', img.src);
		}		
	}
	
	
	// 통장 사본 업로드 버튼 변할 때마다
	document.getElementById('copyofbankbook').addEventListener('change', copyDiv);
	
	// 삽입한 이미지 활성화시킴
	function copyDiv() {

		let copyspace = document.getElementById('copy-space');
		let copyofbankbook = document.getElementById('copyofbankbook');
		
		let img = new Image();		
		img.src = URL.createObjectURL(copyofbankbook.files[0]);
		
		img.onload = function() {
			copyspace.setAttribute('src', img.src);
		}		
	}
	
	//  businessContract1.jsp -> 모두 동의 누르면 약관 동의되도록
	document.getElementById('allcheck').addEventListener('change', function() {
		if(this.checked) {
			document.getElementById('preA').checked = true;
			document.getElementById('preB').checked = true;
		}
	})
	
	// businessContract3.jsp -> 은행찾기 선택시 은행 이미지가 모인 모달 창 띄우기 
	document.getElementById('bank-modal-button').addEventListener('click', bankModal);
	
	function bankModal() {
        let modal = document.getElementById('modal');

        // 모달창 뒤에 나타나는 그림자같은 검은 레이어
        let bg = document.createElement('div');
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
			overflow: 'scroll',
			
            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
 	        msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // businessContract3.jsp -> Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };

    // businessContract3.jsp -> 모달창에서 은행 이미지 선택시 값 입력하기 
    function selectBank(obj) {
    	document.getElementById('accountbank').value = obj.id;
    	document.getElementById('modalbg').remove();
    	obj.parentNode.style.display = 'none';    	
    }
    
    
    // businessContract4.jsp -> 카테고리 선택하면 해당 카테고리에 대한 input = hidden 생성 및 삭제
 	var categoryAll = document.querySelectorAll('div.categoryDiv div input[type=checkbox]');
 	
 	
 	for (i = 0; i < categoryAll.length; i++) {
 		categoryAll[i].addEventListener('change', function() {
    		if(this.checked) {
    			let hiddenCategory = document.createElement('input');
    			hiddenCategory.setAttribute('type', 'hidden');
    			hiddenCategory.setAttribute('name', 'defaultcategory');
    			    			
    			const path = '${cpath}/resources/business/img/category/';
    			const imgsrc = this.parentNode.querySelector('img').src;
    			hiddenCategory.setAttribute('value', this.parentNode.querySelector('h1').innerHTML);
    			
    			this.parentNode.appendChild(hiddenCategory);
    		}
	    	else {
	    		this.parentNode.removeChild(this.parentNode.querySelector('input[type=hidden]'));
    		}
    	});
 	}