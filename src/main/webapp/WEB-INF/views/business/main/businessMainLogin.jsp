<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- inner login form in main page -->
<!-- Before Login -->
<c:if test="${empty AddressToMove}">
	<form class="login_wrapper" method="POST" action="${cpath }/business/membership/businessLogin/POST/main/">
		<div class="login_title">
			<p>
				로그인
			</p>
		</div>
		<div class="login_input_con">
			<div class="input_box">
				<input class="input_tag" type="text" name="id" placeholder="아이디를 입력하세요." required="required">
			</div>
			<div class="input_box">
				<input class="input_tag" type="password" name="pw" placeholder="비밀번호를 입력하세요." required="required">
				<div class="login_bottom_con">
				<div class="store_id_con">
					<label>
						<input class="store_id_in	put" type="checkbox" name="storeid">
						<span>아이디 기억하기</span>
					</label>
				</div>
				<div>
					<span class="join_link" onclick="location.href='${cpath }/business/membership/businessSignUp/'">
						회원가입하기
					</span>			
				</div>
				</div>
			</div>
			<div class="login_button_con">
				<input type="button" id="loginSubmit" value="Login" style="float: left">		
			</div>
		</div>
	</form>
</c:if>

<!-- After Login -->	
<c:if test="${not empty AddressToMove}">
	<div class="after_loign_con">
		<div class="welcome_box">
			<span class="owner_name">나이키</span>(abc123@gmail.com) 사장님 어서오세요.
		</div>
		<div class="request_box">
			<p>
				현재 [<span class="order_count">13</span>] 명의 고객님이 서비스 이용을 희망합니다.<br>
				자세한 내용은 <span class="order_status_link" onclick='location.href="${cpath}/business/submanagement/businessOrderStatusManagement/"'>해당 링크</span>를 통해 확인할 수 있습니다.
			</p>
		</div>
		<div class="premium_box">
			<div class="premium_guide_con">
				<p>
					사장님은 현재 프리미엄 광고 서비스를 이용하고 계시지 않습니다.<br>
					서비스 계약을 통해 보다 많은 고객님들께 서비스를 소개해보시는 건 어떠세요?<br>
				</p>
				<div>
					<button class="premium_sign_up_btn" onclick='location.href="${cpath}/business/contract/businessPremiumAd/"'>광고
						서비스 신청하기
					</button>
				</div>
			</div>
		</div>
	</div>
</c:if>

<!-- login regular syntax -->
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
		});
	}
	axPost(document.getElementsByName('id')[0].value,document.getElementsByName('pw')[0].value, '');	
}
</script>

<script>
	document.getElementById('loginSubmit').addEventListener('click', function(){ loginSubmit();});
</script>
