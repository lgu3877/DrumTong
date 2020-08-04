<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>    

  <body>
   	<script type="text/javascript" src="${pageContext.request.contextPath }/customer/js/membership/customerLogin.js"></script>
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
     	document.getElementById('loginSubmit').addEventListener('click', submit);
  	</script> 
    
       	</body>
</html>