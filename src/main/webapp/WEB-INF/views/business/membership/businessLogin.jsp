<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/businessHeader.jsp"%>
<!-- 영경 스크립트 -->
<!-- Axios script -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
			})
		}
		axPost(document.getElementsByName('id')[0].value,document.getElementsByName('pw')[0].value, document.getElementsByName('storeid')[0].value);	
    }
}
	
</script>

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
					<input name="id" class="loginInput" type="text" required="required" placeholder="아이디를 입력해주세요.">
				</div>
				<div>	
					<div class="input_title text-left">
						비밀번호<span class="red-mark"> </span>
					</div>
					<input name="pw" class="loginInput" type="password" required="required" placeholder="비밀번호를 입력해주세요.">
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
<!-- 영경 스크립트 -->
<script>
	document.getElementsByClassName('single_page_login_btn')[0].addEventListener('click', function(){ loginSubmit();});
</script>
<%@ include file="../main/businessFooter.jsp"%>
