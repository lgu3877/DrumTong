//    document.getElementById('userid').addEventListener('blur', checkUserid);
	
    document.getElementById('userid').addEventListener('blur', checkUserid);
	document.getElementById('pw').addEventListener('keyup', passwordComplexity);
	document.getElementById('pwck').addEventListener('keyup', pwCheck);
    document.getElementById('checkphone').addEventListener('click', checkTel);
	document.getElementById('delegatecrn').addEventListener('blur', checkBusinessNumber);
	document.getElementById('email').addEventListener('blur', checkEmail);


	// 약관 모두 동의
	function AllAgree(obj) {
		if(obj.checked) {			
			document.getElementById('preA').checked = true;
			document.getElementById('preB').checked = true;
		}
	}
	
	// Submit 하기 전에 항목들 체크
	function AgreeCheck() {
		
		var redCheck = document.querySelectorAll('.message');
		var preA = document.getElementById('preA');
		var preB = document.getElementById('preB');
		
		// 약관 동의
		if(preA.checked === false || preB.checked === false) {
			alert('모든 이용약관에 동의해주시기 바랍니다.');

			if(preA.checked === false) { preA.focus();	}
			else { preB.focus();}					
			return false;
		}
		
		// 입력 형식 어긴것들 체크
		if(redCheck.length !== 0) {
			for(i = 0; i < redCheck.length; i++) {
				if(redCheck[i].style.color === 'red') {
					document.getElementById((redCheck[i].id).substr(0,(redCheck[i].id).length - 3)).focus();
					return false;
				}
			}
		}
		else{
			// 모든 조건이 참일 때 submit 함수 호출\
        	document.getElementById('loginForm').submit();
		}
	}
	
    //비밀번호 복잡성 검증
    function passwordComplexity(event) {
      //비밀번호 정규식
      var regExp = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

      const pw = document.getElementById('pw').value;
      const pwmsg = document.getElementById('pwmsg');

      if (regExp.test(pw) == false) {
        pwmsg.innerHTML = '비밀번호는 영문자 ,숫자 특수문자의 조합 7~15자리로';
        pwmsg.style.color = 'red';
        return false;
      } else {
        pwmsg.innerHTML = '비밀번호 검증 완료';
        pwmsg.style.color = 'blue';
        return true;
      }
    }
	
	// 비밀번호 확인
	function pwCheck(event) {
	    if (event.keyCode != 13 || event.keyCode != 9) {
		    var pw = document.getElementById('pw');
			var pwck = document.getElementById('pwck');
			var pwckmsg = document.getElementById('pwckmsg');
			if(pw.value !== pwck.value) {
				if(pw.value == '') {
					pwckmsg.innerHTML = '비밀번호를 입력바랍니다';
					pwckmsg.style.color = 'red';
					return false;
				}
				else {
					pwckmsg.innerHTML = '비밀번호가 다릅니다';
					pwckmsg.style.color = 'red';
				}
			}
			else {
				pwckmsg.innerHTML =  '비밀번호가 확인되었습니다';
				pwckmsg.style.color = 'blue'
			}
	    }
	}
	
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
                        document.getElementById('mainaddress').value = fullRoadAddr; //5자리 새우편번호 사용
                    }
                }).open();
    }


  // 휴대폰 인증
  function checkTel() {
        var regExp = /^\d{3}-\d{3,4}-\d{4}$/;

        const phonenum = document.getElementById('phone').value;
        const phonemsg = document.getElementById('phonemsg');

        if (phonenum === '') {
          phonemsg.innerHTML = '전화번호를 입력해주세요';
          phonemsg.style.color = 'red';
        }

        if (regExp.test(phonenum) === false) {
          phonemsg.innerHTML = '전화번호는 - 을 포함해서 입력해주세요.';
          phonemsg.style.color = 'red';
          return false;
        } 
        else if(regExp.test(phonenum) === true ) {
          phonemsg.innerHTML = '전화번호 인증 완료!';
          phonemsg.style.color = 'blue';
          document.getElementById('phone').readOnly = true;
          document.getElementById('phone').style.backgroundColor = 'grey';
          return true;
        }
      }

	// 사업자 번호 확인
	function checkBusinessNumber() {
		var delegatecrn = document.getElementById('delegatecrn').value;
		var delegatecrnmsg = document.getElementById('delegatecrnmsg');
		var regExp = /^\d{3}-\d{2}-\d{5}$/;
		console.log(delegatecrn);
		
		if(delegatecrn === '') {
			delegatecrnmsg.innerHTML = '사업자 번호를 입력해주세요'
			delegatecrnmsg.style.color = 'red'
		}
		else if(regExp.test(delegatecrn) === false) {
			delegatecrnmsg.innerHTML = '사업자 번호는 -을 포함해서 입력해주세요';
			delegatecrnmsg.style.color	 = 'red';
			return false;
		}
		else if(regExp.test(delegatecrn) === true){
			delegatecrnmsg.innerHTML = '사업자번호 인증 완료';
			delegatecrnmsg.style.color = 'blue';
		    return true;
		}
		
	}
	
	function checkEmail() {
        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        const email = document.getElementById('email').value;
        const emailmsg = document.getElementById('emailmsg');

        if (email === '') {
          emailmsg.innerHTML = 'Email을 입력해주세요';
          emailmsg.style.color = 'red';
        }
        else if (regExp.test(email) == false) {
          emailmsg.innerHTML = '올바르지 않은 이메일 형식입니다.';
          emailmsg.style.color = 'red';
          
          return false;
        } else {
          emailmsg.innerHTML = '이메일 인증 완료';
          emailmsg.style.color = 'blue';
          return true;
        }
      }

    function checkUserid() {
        const userid = document.querySelector('#userid').value;
        idmsg = document.querySelector('#useridmsg');
        console.log(userid.length);
        if (userid === '') {
          idmsg.innerText = '아이디를 입력하세요';
          idmsg.style.color = 'red';
          document.querySelector('#userid').focus();
          return;
        } else if(userid.length < 5){ 
          console.log('userid 실행');
          idmsg.innerText = '아이디 최소길이는 5글자 이상입니다.';
          idmsg.style.color = 'red';
          document.querySelector('#userid').focus();
          return;
        }

     	const axGet = async (userid) => {	// async : 비동기 실행 함수

          await axios.get('/drumtong/business/membership/businessSignUp/rest/useridDupl/' + userid + '/')
          // 정상
          
          .then( (response) => {
            const idmsg = document.getElementById('useridmsg');
            const data = response.data;
            console.log("data : ", data);
            if(data === true){  
              console.log('responsedata 실행');
              idmsg.innerHTML = "사용 가능한 아이디입니다.";
              idmsg.style.color = 'blue';
            }
            else if(data === false){
              console.log('responsedata2 실행');
              idmsg.innerHTML = "중복된 아이디입니다. 다른 아이디를 입력해주세요.";
              idmsg.style.color = 'red';
              document.querySelector('#userid').focus();
            }
            
            })
          }
          axGet(userid);
      }
