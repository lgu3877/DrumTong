<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>    

	<!-- Axios script -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <body>
    <!-- 스크립트 영역 -->
	    <script type="text/javascript" src="${cpath }/customer/js/membership/customerLogin.js"></script>
    <!-- 본문 영역 -->
    <section class="section-SangJae">
      <div class="login">
        <form method="POST" id="loginForm">
          <img src="${cpath }/resources/customer/img/logo4.png" class="login-logo" />
          <div class="login-alert">메세지</div>
          <div class="login-input">
            <input type="text" name="id" id="userid" class="login-input-boxs" />
            <input type="password" name="pw" id="userpw" class="login-input-boxs" />

            <div class="login-check">
              <label><input type="checkbox" name="storeid" id="storeid" class="login-storeid" />자동 로그인</label>
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
     	document.getElementById('loginSubmit').addEventListener('click', function(){ logiinSubmit('synchronous');});
  	</script> 
    
       	</body>
</html>