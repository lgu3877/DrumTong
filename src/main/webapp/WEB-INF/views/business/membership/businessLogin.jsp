<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- title -->
  	<title>Login :: Laundry</title>
  	
  	<!-- global css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <!-- header css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <!-- login css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css"> 	  	
	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	
	<!-- Axios -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  
  <!-- 영경 스크립트(js파일로 변경해야함) -->
  <script>
  function loginSubmit(){
      loginInputs = document.querySelectorAll('input.loginInput');
      redmarks = document.querySelectorAll('span.red-mark');
      cnt = 0;

      for(i = 0; i < loginInputs.length; i++){
        if(loginInputs[i].value === ''){
          redmarks[i].innerHTML = ((i == 0 ? '아이디' : '비밀번호') + '를 입력해주세요');
        } else{
          redmarks[i].innerHTML = '';
          cnt++;
        }
      }

      if(cnt == loginInputs.length){
      var axPost = async (id, pw, storeid) => {
        ob={
            'id':id,
            'pw':pw,
            'storeid':storeid,
            'type':'business',
        };
        await axios.post('/drumtong/business/membership/businessLogin/rest/loginCheck/', ob)

        .then( (response) => {
          if(response.data === true){
                document.getElementsByClassName('single_page_login_form')[0].submit();	
          } else{
            alert('로그인에 실패하였습니다.');
            document.getElementsByName('pw')[0].value ='';
          }
        });
      }
      axPost(document.getElementsByName('id')[0].value,document.getElementsByName('pw')[0].value, document.getElementsByName('storeid')[0].value);	
      }
  }
  </script>
</head>


<body>
	
	<!-- header -->
	<%@ include file="../main/businessHeader.jsp"%>

	<!-- Login -->
<section>
	<!-- Login -->
	<div class="single_page_login">
		<div class="login_title">
			<p>로그인</p>
		</div>
		<form class="single_page_login_form" action="${cpath }/business/membership/businessLogin/POST/" method="POST" onsubmit="return false;">
			<div class="single_page_login_input_con">
				<div>
					<div class="input_title text-left">
						아이디<span class="red-mark"> </span>
					</div>
					<input name="id" class="loginInput" type="text" required="required" placeholder="아이디를 입력해주세요." onkeyup="loginEnter()" autocomplete="off">
				</div>
				<div>	
					<div class="input_title text-left">
						비밀번호<span class="red-mark"> </span>
					</div>
					<input name="pw" class="loginInput" type="password" required="required" placeholder="비밀번호를 입력해주세요."  onkeyup="loginEnter()">
					<div class="single_store_id_con">
						<label style="cursor: pointer">
							<input type="checkbox" name="storeid">
							<span style="margin-left: -6px">자동 로그인</span>
						</label>
					</div>
				</div>	
				<div>
					<input class="single_page_login_btn" type="button" value="로그인" />
				</div>
			</div>
			<div class="login_search_con">
				<div>
					<a href="${cpath }/business/membership/businessAccountFind/">아이디/비밀번호 찾기 </a>
				</div>
				<div>
					<a href="${cpath }/business/membership/businessSignUp/">회원가입</a>
				</div>
			</div>
		</form>
	</div>
</section>
	
	<!-- footer -->
	<%@ include file="../main/businessFooter.jsp"%>
<!-- 영경 스크립트 -->
<script>
	document.getElementsByClassName('single_page_login_btn')[0].addEventListener('click', function(){ loginSubmit();});
	  function loginEnter() {
		  if (window.event.keyCode == 13) {
			  loginSubmit();
	     }
	  }
</script>
</body>
</html>