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
    <!-- account find css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessPWFind.css"> 	  	
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css">
	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  	
  	<!-- Axios -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  	<!-- 영경 스크립트 -->
  	<script>
		function pwChange(bpersonid){
			password = document.getElementsByName('password')[0].value;
			confrimPassword = document.getElementsByName('confrimPassword')[0].value;
			console.log(password);
			console.log(confrimPassword);
		      var axPost = async () => {
		        ob={
		        	'bpersonid' : bpersonid,
		            'pw':password,
		        };
		        console.log(ob);
		        await axios.post('/drumtong/business/membership/businessPWFind/rest/pwChange/', ob)
		
		        .then( (response) => {
		          if(response.data === true){
					alert('비밀번호가 성공적으로 변경되었습니다.');
					return true;
		          } else{
		        	alert('비밀번호 변경 실패');
		        	return false;
		          }
		        });
		      };
			
			if(password === confrimPassword){
				// 비밀번호 변경
      			return axPost();
			} else{
				alert('비밀번호가 일치하지 않습니다.');
			}
			return false;
		}  	
  	</script>
</head>


<body>

	<!-- header -->
	<%@ include file="../main/businessHeader.jsp"%>

	<section>
		<div class="pw_reset_con">
			<form class="pw_reset_view" method="${AccountPage == 'AccountPage' ? 'GET' : 'POST'}" action="/drumtong/business/membership/${AccountPage == 'AccountPage' ? 'businessAccountInfo/' : 'businessPwChange/'}" onsubmit="return pwChange('${User.bpersonid}');">
				<div class="pw_reset_title title">비밀번호 재설정</div>
				<div class="pw_reset_content">
					<p>기존의 비밀번호를 변경합니다. 보안을 위해 최소 10자리에서 20자리까지의 영문, 숫자의 조합으로
						구성해주세요.</p>
					<div class="pw_reset_input_con">
						<div class="pw_reset_input_con">
							<div class="pw_reset_input_title">새로운 비밀번호</div>
							<input type="password" name="password"
								placeholder="사용하실 비밀번호를 입력해주세요." maxlength="20" required id="pwinput"/>
						</div>
						<div class="pw_reset_input_con">
							<div class="pw_reset_input_title">비밀번호 재입력</div>
							<input type="password" name="confrimPassword"
								placeholder="정확한 입력을 위해 다시 한 번 입력해주세요." maxlength="20" required  id="pwckinput"/>
						</div>
						<input type="submit" value="변경하기"/>
					</div>
				</div>
			</form>
		</div>
	</section>
	
	<!-- footer -->
	<%@ include file="../main/businessFooter.jsp"%>
	
<script type="text/javascript">
	document.getElementById('pwinput').addEventListener('keyup', onlyNum);
	document.getElementById('pwckinput').addEventListener('keyup', onlyNum);
	function onlyNum() {
		var regexp = /[0-9a-zA-Z.;\-]/;
			if(!regexp.test(this.value)) {
				this.value = this.value.slice(0,-1);		// 마지막 한글자만 잘라내기
			}
	}
</script>
</body>
</html>
