<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>    

   	<!-- 스크립트 영역 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- Axios script -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
    <!-- JavaScript Ajax-->
    <script type="text/javascript" src="${cpath }/customer/js/membership/customerSignUp.js" charset="UTF-8"></script>
	
		
	
    <!-- 본문 영역 -->
    <section class="section-SangJae">
      <div class="join">
        <form method="POST" id="loginForm">
          <img src="${cpath }/resources/customer/img/logo4.png" class="login-logo" />
          <div class="login-input">
            <input type="text" name="id" id="userid" class="join-input-boxs" placeholder="ID"  onblur="axGet(document.getElementById('userid').value)" maxlength="25">
            <span class="idmsg" id="idmsg"></span>
            <input type="password" name="pw" id="userpw" class="join-input-boxs" placeholder="PW" />
            <span class="pwmsg" id="pwmsg"></span>
            <input type="password" name="pw2" id="userpw2" class="join-input-boxs" placeholder="PW 확인" />
            <span class="pwmsg2" id="pwmsg2"></span>
            <hr />
            <span class="join-alert"></span>
            <input type="text" name="name" id="username" class="join-input-boxs" placeholder="이름" />
            <select name="genderboolean" class="join-input-boxs">
              <option value="M">남성</option>
              <option value="W">여성</option>
            </select>
            <input type="date" max="9999-12-31" name="birth" id="userbirth" class="join-input-boxs" placeholder="생년월일" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" />
            <input type="text" name="phonenum" id="usertel" class="join-input-boxs" placeholder="-을 넣어주세요." />
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
            <input type="text" name="mainaddress" id="zipcode" class="join-input-boxs" placeholder="우편번호" readonly/>
            <input type="button" value="주소찾기" onclick="searchAddress()" id="findZipcode" class="join-input-buttons" />
            <input type="text" name="detailaddress" id="address" class="join-input-boxs" placeholder="상세주소" />
            <div class="login-buttons">
              <input type="button" value="회원가입" id="joinSubmit" class="join-input-buttons" />
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
      document.getElementById('email').addEventListener('keyup', checkEmail);

      document.querySelectorAll('input.join-input-boxs').forEach((input) => {
        input.addEventListener('keypress', enter);
      });

      document.getElementById('joinSubmit').addEventListener('click', submit);
    </script>
        	</body>
	</html>