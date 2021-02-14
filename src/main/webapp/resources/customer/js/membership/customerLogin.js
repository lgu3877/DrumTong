function logiinSubmit(type) {
        console.log('submit작동');
        loginInputs = document.querySelectorAll('input.login-input-boxs');
        loginAlert = document.getElementsByClassName('login-alert')[0];
        cnt = 0;

        for (i = 0; i < loginInputs.length; i++) {
          if (loginInputs[i].value === '') {
            loginInputs[i].style.border = '1px solid red';
            loginAlert.style.display = 'block';
          } else {	// 정상입력 시 라인 색 검정
        	loginInputs[i].style.border = '1px solid black';
            cnt++;
          }
        }
        
        emptyId = loginInputs[0].value === '';	// 아이디가 비어있다면 true
        emptyPw = loginInputs[1].value === '';	// 비밀번호가 비어있다면 true
        
        if (emptyPw && emptyId)	{ loginAlert.innerText = '입력된 정보가 없습니다';	}
        else if (emptyId)				{ loginAlert.innerText = '아이디를 입력해주세요';	}
        else if (emptyPw)				{ loginAlert.innerText = '비밀번호를 입력해주세요';	}

        if (cnt !== loginInputs.length) return;
        if(type === 'synchronous'){
        	var axPost = async (id, pw, storeid) => {
        		ob={
        				'id':id,
        				'pw':pw,
        				'storeid':storeid,
        				'type':'customer',
        		};
        		await axios.post('/drumtong/customer/membership/customerLogin/rest/loginCheck/', ob)
        		
        		.then( (response) => {
        			if(response.data === true){
        				console.log('로그인 성공');
        	        	document.getElementById('loginForm').submit();
        				
        			} else{
        				console.log('로그인 실패');
        				alert('로그인에 실패하였습니다.');
        				loginInputs[1].value = '';
        			}
        		})
        	}
        	axPost(loginInputs[0].value,loginInputs[1].value, document.getElementById('storeid').value);
        	
        } else {
        	var axPost = async (id, pw, storeid) => {
        		ob={
        				'id':id,
        				'pw':pw,
        				'storeid':storeid,
        				'type':'customer',
        		};
        		await axios.post('/drumtong/customer/membership/customerLogin/rest/login/', ob)
        		
        		.then( (response) => {
        			// 쿠폰, 즐겨찾기, 포인트 관련 정보 가져와야 함
        			checkLoginSettings(response.data);
        		})
        	}
        	result = axPost(loginInputs[0].value,loginInputs[1].value, document.getElementById('storeid').value);
        }
      } //submit 체크 함수 종료
