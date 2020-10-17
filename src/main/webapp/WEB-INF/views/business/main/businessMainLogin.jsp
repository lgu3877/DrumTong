<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- 영경 스크립트 -->
<!-- Axios script -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
function loginSubmit(){
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
	        	document.getElementsByClassName('login_wrapper')[0].submit();
				
			} else{
				alert('로그인에 실패하였습니다.');
				document.getElementsByName('pw')[0].value ='';
			}
		})
	}
	axPost(document.getElementsByName('id')[0].value,document.getElementsByName('pw')[0].value, '');
}
	
</script>
	<form class="login_wrapper" method="POST" action="${cpath }/business/membership/businessLogin/POST/main/">
		<div class="login_title">
			<p>Login<input type="checkbox" name="storeid"></p>
		</div>
		<div class="login_input_con">
			<div>
				<input type="text" name="id" placeholder="   Account" required="required">
			</div>
			<div>
				<input type="password" name="pw" placeholder="   Password" required="required">
			</div>
			<div class="login_button_con">
				<input type="button" id="loginSubmit" value="Login" style="float: left">
				<button type="button" onclick="location.href='${cpath }/business/membership/businessSignUp/'" style="float: right;">Sign-up</button>
			</div>
		</div>
	</form>
<!-- 영경 스크립트 -->
<script>
document.getElementById('loginSubmit').addEventListener('click', function(){ loginSubmit();});
</script>
