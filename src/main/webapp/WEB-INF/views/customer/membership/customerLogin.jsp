<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>    

  <body>
    <!-- 스크립트 영역 -->
    <script>
      function submit() {
        console.log('submit작동');
        loginInputs = document.querySelectorAll('input.login-input-boxs');
        loginAlert = document.getElementsByClassName('login-alert');
        cnt = 0;

        for (i = 0; i < loginInputs.length; i++) {
          if (loginInputs[i].value === '') {
            loginInputs[i].style.border = '1px solid red';
            loginAlert[0].style.display = 'block';
          } else {
            cnt++;
          }
        }

        if (loginInputs[0].value === '' && loginInputs[1].value === '') {
          console.log('얼럿 시작 둘다없음');
          loginAlert[0].innerText = '입력된 정보가 없습니다';
        } else if (loginInputs[0].value === '') {
          console.log('얼럿 시작 아디없엉');
          loginAlert[0].innerText = '아이디를 입력해주세요';
        } else if (loginInputs[1].value === '') {
          console.log('얼럿 시작 비번내놔');
          loginAlert[0].innerText = '비밀번호를 입력해주세요';
        }

        if (cnt !== loginInputs.length) return;
        document.getElementById('loginForm').submit();
      } //submit 체크 함수 종료
    </script>

    <!-- 본문 영역 -->
    <section>
      <div class="login">
        <form method="POST" id="loginForm">
          <img src="#" class="login-logo" />
          <div class="login-alert">메세지</div>
          <div class="login-input">
            <input type="text" name="id" id="userid" class="login-input-boxs" />
            <input type="password" name="pw" id="userpw" class="login-input-boxs" />

            <div class="login-check">
              <label><input type="checkbox" id="storeid" class="login-storeid" />자동 로그인</label>
              <a href="#" class="login-idFind">ID/PW 찾기</a>
            </div>

            <div class="login-buttons">
              <input type="button" value="login" id="loginSubmit" class="login-input-buttons" />
              <input type="button" value="Join" id="loginJoin" class="login-input-buttons" />
            </div>
          </div>
        </form>
      </div>
    </section>
    


    <!-- 스크립트 영역 -->
    <script>
      document.getElementById('loginSubmit').addEventListener('click', submit);
    </script>
    
    
        	</body>
	</html>