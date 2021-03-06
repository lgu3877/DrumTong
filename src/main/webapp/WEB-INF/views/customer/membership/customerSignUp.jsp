<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>    

	<!-- 다음 주소 검색 script function -->
	<%@ include file="/resources/daumAddressSearch/daumAddressSearch.jsp" %>
	<!-- Axios script -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
    <!-- JavaScript Ajax-->
    <script type="text/javascript" src="${cpath }/customer/js/membership/customerSignUp.js" charset="UTF-8"></script>
	
		
	
    <!-- 본문 영역 -->
    <section class="section-SangJae section-join">
      <div class="join">
          <div class="join-input">
          <img src="${cpath }/resources/customer/img/logo4.png" class="login-logo" />
          <form method="POST" id="loginForm" class="joinForm">
            <input type="text" name="id" id="userid" class="join-input-boxs" placeholder="ID"  onblur="axGet(document.getElementById('userid').value)" maxlength="25" autocomplete="off">
            <span class="idmsg" id="idmsg"></span>
            <input type="password" name="pw" id="userpw" class="join-input-boxs" placeholder="PW" />
            <span class="pwmsg" id="pwmsg"></span>
            <input type="password" name="pw2" id="userpw2" class="join-input-boxs" placeholder="PW 확인" />
            <span class="pwmsg2" id="pwmsg2"></span>
            <hr />
            <span class="join-alert"></span>
            <input type="text" name="name" id="username" class="join-input-boxs" placeholder="이름"  autocomplete="off"/>
            <select name="genderboolean" class="join-input-boxs">
              <option value="M">남성</option>
              <option value="W">여성</option>
            </select>
            <input type="date" max="9999-12-31" name="birth" id="userbirth" class="join-input-boxs" placeholder="생년월일" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" />
            <input type="text" name="phonenum" id="usertel" class="join-input-boxs" placeholder="-을 넣어주세요."  autocomplete="off"/>
            <input type="button" value="인증하기" id="checkTel" class="join-input-buttons" />
            <span class="telmsg" id="telmsg"></span>
            <div class="checkTelNotice">
              <ul>
                <li>통신사에 따라 최대 1분까지 소요될 수 있습니다.</li>
                <li>인증번호가 도착하지 않을 경우 '인증번호 재전송'을 눌러주세요.</li>
              </ul>
            </div>
            <input type="text" name="email" id="email" class="join-input-boxs" placeholder="E-mail"  autocomplete="off"/>
            <span class="emailmsg" id="emailmsg"></span>
            <input type="text" name="mainaddress" id="zipcode" class="join-input-boxs" placeholder="우편번호(집주소)" readonly/>
            <input type="button" value="주소찾기" onclick="searchAddress(document.getElementById('zipcode'),document.getElementById('address'),document.getElementById('emdcodeTMP'), null, null)" id="findZipcode" class="join-input-buttons" />
            <input type="text" name="detailaddress" id="address" class="join-input-boxs" placeholder="상세주소(집주소)"  autocomplete="off"/>
	            <input type="hidden" name="emdcodeTMP" id="emdcodeTMP" class="join-input-boxs" />
            <input type="checkbox" name="checkAddress" id="checkAddress" checked onchange="sameAddress()">배송지 동일
            <div id="sameAddress" style="display:none">
	            <input type="text" name="mainreceiptaddress" id="zipcode2" class="join-input-boxs" placeholder="우편번호(배송지주소)" readonly/>
	            <input type="button" value="주소찾기" onclick="searchAddress(document.getElementById('zipcode2'),document.getElementById('address2'),document.getElementById('emdcode'), null, null)" id="findZipcode2" class="join-input-buttons" />
	            <input type="text" name="detailreceiptaddress" id="address2" class="join-input-boxs" placeholder="상세주소(배송지주소)" />
	            <input type="hidden" name="emdcode" id="emdcode" class="join-input-boxs" />
            </div>
            <div class="login-buttons">
              <input type="button" value="회원가입" id="joinSubmit" class="join-input-buttons" />
            </div>
            </form>
          </div>
      </div>
    </section>

<!-- [영경] 스크립트 -->
    <script>
		function sameAddress(){
			subDiv = document.querySelectorAll("#sameAddress")[0];
			if(document.getElementById('checkAddress').checked === true){
				subDiv.style.display="none";
			} else{
				subDiv.style.display="block";
			}
		}
    </script>
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