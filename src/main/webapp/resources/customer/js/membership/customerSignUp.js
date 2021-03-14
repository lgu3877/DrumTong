// 수정해야할 부분
// 1. 이메일 정규식 확인!!(.을 넣지 않아도 올바른 식으로 처리되는 문제)
// 2. (전화번호 인증을 누르지 않아도 submit이 실행되는 문제)


      function checkUserid() {
        const userid = document.querySelector('#userid').value;
        idmsg = document.querySelector('#idmsg');
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
        console.log('axGet 실행');
        const axGet = async (userid) => {	// async : 비동기 실행 함수

          await axios.get(getContextPath() + '/customer/membership/customerSignUp/rest/useridDupl/' + userid + '/')
          // 정상
          
          .then( (response) => {
            const idmsg = document.getElementById('idmsg');
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
        
      //비밀번호 검사
      function checkPassword(event) {
        if (event.keyCode != 13 || event.keyCode != 9) {
          //13 = 엔터, 9 = 탭
          pw1 = document.getElementById('userpw').value;
          pw2 = document.getElementById('userpw2').value;

          if (pw1 == pw2) {
            document.getElementById('pwmsg2').innerHTML = '비밀번호가 일치합니다';
            document.getElementById('pwmsg2').style.color = 'blue';
          } else {
            document.getElementById('pwmsg2').innerHTML = '비밀번호가 일치하지 않습니다';
            document.getElementById('pwmsg2').style.color = 'red';
          }
        }
      }
  
      //비밀번호 복잡성 검증
      function passwordComplexity(event) {
        //비밀번호 정규식
        var regExp = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

        const userpw = document.getElementById('userpw').value;
        const pwmsg = document.getElementById('pwmsg');

        if (regExp.test(userpw) == false) {
          pwmsg.innerHTML = '비밀번호는 영문자 ,숫자 특수문자의 조합 7~15자리로';
          pwmsg.style.color = 'red';
          return false;
        } else {
          pwmsg.innerHTML = '비밀번호 검증 완료';
          pwmsg.style.color = 'blue';
          return true;
        }
      }
  
      function checkTel() {
        var regExp = /^\d{3}-\d{3,4}-\d{4}$/;

        const usertel = document.getElementById('usertel').value;
        const telmsg = document.getElementById('telmsg');

        if (usertel === '') {
          telmsg.innerHTML = '전화번호를 입력해주세요';
          telmsg.style.color = 'red';
        }

        if (regExp.test(usertel) === false) {
          telmsg.innerHTML = '전화번호는 - 을 포함해서 입력해주세요.';
          telmsg.style.color = 'red';
          return false;
        } 
        else if(regExp.test(usertel) === true ) {
          telmsg.innerHTML = '전화번호 인증 완료!';
          telmsg.style.color = 'blue';
          document.getElementById('usertel').readOnly = true;
          document.getElementById('usertel').style.backgroundColor = 'grey';
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
        	var axGet = async (email) => {
        		await axios.get(getContextPath() + '/customer/membership/customerSignUp/rest/emailCheck/' + email + '/')
        		
        		.then( (response) => {
        			if(response.data === true){
        				console.log('중복X');
        				emailmsg.innerHTML = '이메일 인증 완료';
        				emailmsg.style.color = 'blue';
        				document.querySelector('#email').border='1px solid black';
        			} else{
        				console.log('중복O');
        				emailmsg.innerHTML = '이메일이 중복됩니다.';
        		        emailmsg.style.color = 'red';
        		        document.querySelector('#email').border='1px solid red';
        				return false;
        			}
        		})
        	}
        	axGet(email);
          return true;
        }

      }
  
      function submit() {
        console.log('submit작동');
        joinInputs = document.querySelectorAll('input.join-input-boxs');

        console.log("joinInputs : ",joinInputs);
        cnt = 2;
        
        checkLength = joinInputs.length;
        
        if(document.getElementById('checkAddress').checked === true){
        	checkLength -= 3;
        }

        for (i = 2; i < checkLength; i++) {
          if (joinInputs[i].value === '') {
            joinInputs[i].style.border = '1px solid red';
          } else if(joinInputs[i].value !== ''){
            joinInputs[i].style.border = '1px solid black';
            cnt++
          }
        }
 
        console.log("cnt : ",cnt);

        if (cnt !== checkLength) return;
        document.getElementById('loginForm').submit();
      } //submit 체크 함수 종료
