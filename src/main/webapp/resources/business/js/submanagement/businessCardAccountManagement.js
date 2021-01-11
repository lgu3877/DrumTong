	function inputcardnum() {	// 카드번호를 input에 넣는 함수
		let carddiv1 = $('#carddiv1');
		let carddiv2 = $('#carddiv2').children('input');
		let cardnum = (paymentList.cardnum).split('-');
		for (i = 0; i < carddiv1.children().length; i++) {
			 carddiv1.children().eq(i).val(cardnum[i]);
		}
		carddiv2.eq(0).val(paymentList.cardyear);
		carddiv2.eq(1).val(paymentList.cardmonth);
		carddiv2.eq(2).val(paymentList.cardcvc);
	}
	
	function inputaccountnum() {	// 계좌번호를 input에 넣는 함수
		let accountinput = $('#accountdiv').find('input');
		accountinput.val(paymentList.accountnum);
	}
	
	function inputsubtitle() {		// 은행 및 카드 종류 입력하기
		$('#cardbank').html(paymentList.cardbank);
		$('#accountbank').html(paymentList.accountbank);
	}
	
	function cardChange(obj) {		// 카드번호 변경 폼 활성화
 		cardclone = $('#carddiv').find('input').clone();
 		
 		$('#carddiv').find('select').css('border', '3px solid #3088F9');
		$('#carddiv').find('input').removeAttr('readonly');
		$('#carddiv').find('input').css('backgroundColor', 'white');
		$('#carddiv').find('input').css('border', '3px solid #3088F9');
		obj.setAttribute('onclick', 'cardSubmit(this)');
		obj.innerHTML = '전송';
		$('#carddiv').find('input').val('');
		
		$('#cardbank').css('display', 'none');
		$('#cardbanksel').css('display', '');
	}
	
	function cardSubmit(obj) {		// 카드번호 변경
	
		let cardConfirm = confirm('정말로 카드번호를 변경하시겠습니까?');
		if (cardConfirm == false) {
			return false;
		}
		
		let exit = true;
		let cardnumsum = '';
		$('#carddiv1').find('input').each(function(index, item) {	// index : 반복문의 i처럼 생각해라 // item : for in 처럼
			cardnumsum += $(item).val();
			if(index < 3)
				cardnumsum += '-';
			
			if(($(item).val()).length < 4) {
				alert('카드번호를 전부 채워주시길 바랍니다');
				exit = false;
				return false;
			}
		})
		$('#carddiv2').find('input').each(function(index, item) {
			if($(item).val().length < $(item).attr('maxLength')) {
				exit = false;
			}
		})	
		
		
		if(!exit)
			return false;
				
		let ob={
					'cardbank' : $('#cardbanksel').val(),
					'cardnum' : cardnumsum,
					'cardyear' : $('#cardyear').val(),
					'cardmonth' : $('#cardmonth').val(),
					'cardcvc' : $('#cardcvc').val(),
		      	};
		
        const axPost = async (ob) => {   // async : 비동기 실행 함수
            await axios.post('/drumtong/business/subManagement/BPayment/rest/updateCard/' , ob)
            // 정상
       		.then( (response) => {
            const data = response.data;
            
            if (data == false) {
            	return false;
            }
            else {
            	$('#carddiv').find('select').css('border', '');
	    		$('#carddiv').find('input').css('backgroundColor', '#adb8c0');
	    		$('#carddiv').find('input').css('border', '');
    			obj.setAttribute('onclick', 'cardChange(this)');
    			obj.innerHTML = '변경';
    			$('#cardbank').css('display', '');
    			$('#cardbank').html($('#cardbanksel option:selected').val());
    			$('#cardbanksel').css('display', 'none');
            }
             })
          }
		return axPost(ob);			
	}
	
	
	function accountChange(obj) {	// 계좌번호 번호 폼 활성화
		accountclone = $('#accountdiv').find('input').clone();
 		
		$('#accountdiv').find('select').css('border', '3px solid #3088F9');
		$('#accountdiv').find('input').removeAttr('readonly');
		$('#accountdiv').find('input').css('backgroundColor', 'white');
		$('#accountdiv').find('input').css('border', '3px solid #3088F9');
		obj.setAttribute('onclick', 'accountSubmit(this)');
		obj.innerHTML = '전송';
		$('#accountdiv').find('input').val('');
		
		$('#accountbank').css('display', 'none');
		$('#accountbanksel').css('display', '');
	}
	
	function accountSubmit(obj) {	// 계좌번호 서브밋
		
		let acConfirm = confirm('정말로 계좌번호를 변경하시겠습니까?');
		if (acConfirm == false) {
			return false;
		}
		
		let ob={
				'accountbank' : $('#accountbanksel option:selected').val(),
				'accountnum' : $('#accountdiv').find('input').val(),
	      	};
		
		  const axPost = async (ob) => {   // async : 비동기 실행 함수
	            await axios.post('/drumtong/business/subManagement/BPayment/rest/updateAccount/' , ob)
	            // 정상
	       		.then( (response) => {
	            const data = response.data;
	            
	            if (data == false) {
	            	return false;
	            }
	            else {
	            	$('#accountdiv').find('select').css('border', '');
	        		$('#accountdiv').find('input').css('backgroundColor', '#adb8c0');
	        		$('#accountdiv').find('input').css('border', '');
	        		obj.setAttribute('onclick', 'accountChange(this)');
	        		obj.innerHTML = '변경';
	        		
	        		$('#accountbank').css('display', '');
	    			$('#accountbank').html($('#accountbanksel option:selected').val());
	        		$('#accountbanksel').css('display', 'none');
	            }
	             })
	          }
			return axPost(ob);			
	}
	
	function inputnumck(obj) {	// 카드번호 숫자만 입력될 수 있도록 'onkeyup'
		numck(obj);
		if(obj.value.length > 3) {
			obj.nextElementSibling.focus();
		}
	}
	
	function numck(obj) {	// 숫자 이외의 값이 입력되면 제거
		let pattern = /[^(0-9)]/gi;   // 숫자이외는 제거
// 		 /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9)]/gi;   // 특수문자 제거
		if(isFinite(obj.value) == false) {
			alert('숫자만 입력할 수 있습니다');
			return  obj.value = (obj.value).replace(pattern,"");
		}
	}