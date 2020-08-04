<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>    

   <!-- 스크립트 영역 -->

    <!-- JavaScript Ajax-->
    <script>
      let ajaxRet;

      function checkUserid() {
        const userid = document.querySelector('#userid').value;
        console.log('userid : ' + userid);
        if (userid === '') {
          idmsg = document.querySelector('#idmsg');
          idmsg.innerText = '아이디를 입력하세요';
          idmsg.style.color = 'red';
          document.querySelector('#userid').focus();
          return;
        } else {
          idmsg.innerText = '';
        }
        //바닐라 자바스크립트
        const request = new XMLHttpRequest();
        // 		request.open("GET","${cpath}/checkid/?email=" + email, true);
        // 		request.setRequestHeader('Content-type', 'text; charset=UTF-8');

        request.open('POST', '${cpath}/checkid/}', true);
        request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

        request.onreadystatechange = function () {
          if (request.readyState == 4 && request.status == 200) {
            idmsg.innerText = request.responseText;
            if (request.responseText === '사용가능한 아이디입니다') {
              idmsg.style.color = 'blue';
              ajaxRet = true;
            } else {
              idmsg.innetText = request.responseText;
              idmsg.style.color = 'red';
              // 					document.querySelector('#userid').focus();
              ajaxRet = false;
            }
          }
        };
        // 	request.send(); //GET
        request.send('userid=' + userid); //POST
      }
    </script>

    <script>
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
    </script>

    <script>
      //비밀번호 복잡성 검증
      function passwordComplexity(event) {
        //비밀번호 정규식
        var regExp = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

        const userpw = document.getElementById('userpw').value;
        const pwmsg = document.getElementById('pwmsg');

        if (regExp.test(userpw) == false) {
          pwmsg.innerHTML = '비밀번호는 영문 대소문자, 숫자의 조합 6~12자리로';
          pwmsg.style.color = 'red';
          return false;
        } else {
          pwmsg.innerHTML = '비밀번호 검증 완료';
          pwmsg.style.color = 'blue';
          return true;
        }
      }
    </script>

    <script>
      function checkTel() {
        var regExp = /^\d{3}-\d{3,4}-\d{4}$/;

        const usertel = document.getElementById('usertel').value;
        const telmsg = document.getElementById('telmsg');

        if (usertel === '') {
          telmsg.innerHTML = '전화번호를 입력해주세요';
          telmsg.style.color = 'red';
          document.querySelector('#usertel').focus();
        }

        if (regExp.test(usertel) == false) {
          telmsg.innerHTML = '전화번호는 - 을 포함해서 입력해주세요';
          telmsg.style.color = 'red';
          document.querySelector('#usertel').focus();
          return false;
        } else {
          telmsg.innerHTML = '전화번호 인증 완료';
          telmsg.style.color = 'blue';
          return true;
        }
      }
    </script>

    <script>
      function checkEmail() {
        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        const email = document.getElementById('email').value;
        const emailmsg = document.getElementById('emailmsg');

        if (email === '') {
        	emailmsg.innerHTML = 'Email을 입력해주세요';
        	emailmsg.style.color = 'red';
          document.querySelector('#email').focus();
        }
        else if (regExp.test(email) == false) {
        	emailmsg.innerHTML = 'test`';
        	emailmsg.style.color = 'red';
          document.querySelector('#email').focus();
          return false;
        } else {
        	emailmsg.innerHTML = 'test2 인증 완료';
        	emailmsg.style.color = 'blue';
          return true;
        }
      }
    </script>

    <script>
      function submit() {
        console.log('submit작동');
        joinInputs = document.querySelectorAll('input.join-input-boxs');

        cnt = 3;

        for (i = 3; i < joinInputs.length; i++) {
          if (joinInputs[i].value === '') {
            joinInputs[i].style.border = '1px solid red';
          } else {
            cnt++;
          }
        }


        if (cnt !== joinInputs.length) return;
        document.getElementById('loginForm').submit();
      } //submit 체크 함수 종료
    </script>

    <!-- 본문 영역 -->
    <section>
      <div class="join">
        <form method="POST" id="loginForm">
          <img src="#" class="login-logo" />
          <div class="login-input">
            <input type="text" name="userid" id="userid" class="join-input-boxs" placeholder="ID" />
            <span class="idmsg" id="idmsg"></span>
            <input type="password" name="userpw" id="userpw" class="join-input-boxs" placeholder="PW" />
            <span class="pwmsg" id="pwmsg"></span>
            <input type="password" name="userpw2" id="userpw2" class="join-input-boxs" placeholder="PW 확인" />
            <span class="pwmsg2" id="pwmsg2"></span>
            <hr />
            <span class="join-alert"></span>
            <input type="text" name="username" id="username" class="join-input-boxs" placeholder="이름" />
            <select class="join-input-boxs">
              <option>남성</option>
              <option>여성</option>
            </select>
            <input type="text" name="userbirth" id="userbirth" class="join-input-boxs" placeholder="생년월일" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" />
            <input type="text" name="usertel" id="usertel" class="join-input-boxs" placeholder="전화번호" />
            <input type="button" value="인증하기" id="checkTel" class="join-input-buttons" />
            <span class="telmsg" id="telmsg"></span>
            <div class="checkTelNotice">
              <ul>
                <li>통신사에 따라 최대 1분까지 소요될 수 있습니다.</li>
                <li>인증번호가 도착하지 않을 경우 '인증번호 재전송'을 눌러주세요.</li>
              </ul>
            </div>
            <input type="text" name="email" id="email" class="join-input-boxs" placeholder="E-mail" />
            <span class="emailmsg" id="emailmsg"></span>
            <input type="text" name="zipcode" id="zipcode" class="join-input-boxs" placeholder="우편번호" />
            <input type="button" value="주소찾기" id="findZipcode" class="join-input-buttons" />
            <input type="text" name="address" id="address" class="join-input-boxs" placeholder="상세주소" />
            <div class="login-buttons">
              <input type="button" value="Join Now" id="joinSubmit" class="join-input-buttons" />
            </div>
          </div>
        </form>
      </div>
    </section>

    <!-- 스크립트 영역 -->
    <script>
      function getFocus() {
        switch (this.id) {
          case 'userid':
            if (ajaxRet != true) this.focus();
            break;

          case 'userpw':
            if (passwordComplexity === false) this.focus();
            break;
        }
      }

      function enter(event) {
        //13 = 아스키코드로 엔터, 입력값이 엔터면 서브밋 함수를 실행
        if (event.keycode == 13) submit();
      }

      //입력값 검증 함수
      document.getElementById('userid').addEventListener('blur', checkUserid);
      document.getElementById('userpw').addEventListener('blur', getFocus);

      //비밀번호 복잡성 함수
      document.getElementById('userpw').addEventListener('keyup', passwordComplexity);
      //비밀번호 검사 함수
      document.getElementById('userpw2').addEventListener('keyup', checkPassword);
      //전화번호 검사 함수
      document.getElementById('checkTel').addEventListener('click', checkTel);
      //이메일 검사 함수
      document.getElementById('email').addEventListener('keydown', checkEmail);

      document.querySelectorAll('input.join-input-boxs').forEach((input) => {
        input.addEventListener('keypress', enter);
      });

      document.getElementById('joinSubmit').addEventListener('click', submit);
    </script>
    
    
        	</body>
	</html>