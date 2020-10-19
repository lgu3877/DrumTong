<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/businessHeader.jsp"%>

   	<!-- 스크립트 영역 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<link rel="stylesheet" href="${cpath }/business/css/membership/businessSignUp.css">

	<div class="marginauto" style="width: 60%; height: 5%; text-align: left;">
		<h1 style="font-size: 32pt; margin-left: 20px;">약관동의 및 회원가입</h1>
		<hr>
	</div>
	
	<div id="prediv" class="marginauto" style="width: 60%; height: 45%;">
	<div class="marginauto" style="text-align: left; width: 80%; height: 40%;">
		<p><i class="far fa-square fa-1x"></i>서비스 이용약관</p>
		<div class="termdiv">
			<pre>
<strong>이승원</strong>
딴다라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
딴다라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
딴다라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
딴다라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
딴다라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
딴다라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
딴다라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
딴다라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
			</pre>
		</div>	
		<label><input type="checkbox" id="preA" name="#">위 서비스 이용약관에 동의하시겠습니까?</label>
	</div>
	
	<div class="marginauto" style="text-align: left; width: 80%; height: 40%;">
		<p><i class="far fa-square fa-1x"></i>개인정보 이용약관</p>
		<div  class="termdiv">
			<pre class="terms marginauto">
<strong>이승원</strong>
딴다라라라라라
			</pre>
		</div>
			<label><input type="checkbox" id="preB" name="#">위 개인정보 이용약관에 동의하겠습니까?</label>
	</div>
	
	<div style="height: 2%"></div>
	
	<div class="marginauto" style="width: 80%; height: 5%; text-align: center;">
		<h1 style="-webkit-transform: scale(1.5);">
		<input type="checkbox" id="allcheck" name="allcheck" onchange="AllAgree(this)">모든 이용약관에 동의하겠습니까?</h1>
	</div>
	<hr>
	</div>
	
	<div class="marginauto" style="width: 40%; height: 50%; min-width: 500px;">
		<form class="marginauto signup" action="#" method="post" onsubmit="return AgreeCheck();">
			<div>
				<h1>아&nbsp&nbsp이&nbsp&nbsp디 : </h1> 
				<input type="text" name="id" placeholder="ID">
			</div>
			<div>
				<h1>비밀번호 : </h1>
				<input type="password" name="pw" id="pw" placeholder="PASSWORD">
			</div>
			<div id="pwmsg" class="message"></div>
			<div>
				<h1>번호확인 : </h1>
				<input type="password" name="pwck" id="pwck" placeholder="PASSWORD CHECK">
			</div>
			<div id="pwckmsg" class="message"></div>
			<hr>
			<div>
				<h1>이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름 : </h1>		
				<input type="text" name="name" placeholder="NAME">
			</div>
			<div>
				<h1>생년월일 : </h1>
				<input type="date" max="9999-12-31" name="birth" placeholder="BIRTH">
			</div>
			<div>
				<h1>성&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp별 : </h1>
				<select name="genderboolean">
        	      <option value="M">남성</option>
    	          <option value="W">여성</option>
	            </select>
            </div>
            <div class="pass">
            	<h1>휴대폰 인증 : </h1>
            	<div>
            		<input type="text" name="phonenum" id="phonenum" placeholder="-을 넣어주세요." style="width: 70%"/>
            		<input type="button" value="인증하기" id="checkphone" style="width: 25%"/>
            	</div>
            </div>
            <div>
              <ul>
                <li>통신사에 따라 최대 1분까지 소요될 수 있습니다.</li>
                <li>인증번호가 도착하지 않을 경우 '인증번호 재전송'을 눌러주세요.</li>
              </ul>
            </div>
            <hr>
            <div>
            	<h1>사업번호 : </h1>
            	<input type="text" name="delegatecrn" id="delegatecrn" placeholder="Delegatecrn">
            </div>            
            <div>
            	<h1>이&nbsp&nbsp메&nbsp&nbsp일 : </h1>
            	<input type="text" name="email" id="email" placeholder="Email">
            </div>
            <div class="pass">
            	<h1>주&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp소 : </h1>
            	<div>
            		<!-- Reandonly, Disabled : input 작성 방지 기능 -->
            		<!-- Readonly는 form으로 전송가능하지만, disabled 는 form으로 어떤 값도 전송되지 못한다 -->
            		<input type="text" name="mainaddress" id="mainaddress" placeholder="우편번호" style="width: 70%" readonly/>
            		<input type="button" value="주소찾기" id="checkTel" style="width: 25%" onclick="searchAddress()"/>
            	</div>
            	<div>
            		<input id="detailadress" name="detailaddress" type="text" placeholder="나머지 주소를 입력하세요" style="width: 100%">
            	</div>
            </div>
            <div>
            	<input type="submit" style="width: 100%" value="회원 가입">
            </div>
		</form>
	</div>

<script src="${cpath }/business/js/membership/businessSignUp.js"></script>

<%@ include file="../main/businessFooter.jsp"%>

</body>

</html>