	document.getElementById('pw').addEventListener('keyup', passwordComplexity);
	document.getElementById('pwck').addEventListener('keyup', pwCheck);

	function AllAgree(obj) {
		if(obj.checked) {			
			document.getElementById('preA').checked = true;
			document.getElementById('preB').checked = true;
		}
	}
	
	function AgreeCheck() {
		if(document.getElementById('preA').checked !== true || document.getElementById('preB').checked !== true) {
			alert('모든 이용약관에 동의해주시기 바랍니다.');
			return false;
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