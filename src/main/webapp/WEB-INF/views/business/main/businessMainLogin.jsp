<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 영경 스크립트 -->
<!-- Axios script -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
function loginSubmit(){
    loginInputs = document.querySelectorAll('input.input_tag');
    redmarks = document.querySelectorAll('div.red-mark');
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
					console.log('true 실행');
		        	document.getElementsByClassName('login_wrapper')[0].submit();
				} else{
					console.log('false 실행');
					alert('로그인에 실패하였습니다.');
					document.getElementsByName('pw')[0].value ='';
				}
			})
		};
		axPost(document.getElementsByName('id')[0].value,document.getElementsByName('pw')[0].value, document.getElementsByName('storeid')[0].value);	
    }
}
	
</script>
<!-- inner login form in main page -->
<c:choose>

	<c:when test="${preBtName == '로그인하기' }">
		<form class="login_wrapper" method="POST" action="${cpath }/business/membership/businessLogin/POST/main/" onsubmit="return false;">
			<div class="login_title">
				<p>
					로그인
				</p>		</div>
			<div class="login_input_con">
				<div class="input_box">
					<input class="input_tag" type="text" name="id" placeholder="아이디를 입력하세요." required="required">
	       		<!-- incorrect id error message -->
	        		<div class="auth_error_msg red-mark"></div>
				</div>
				<div class="input_box">
					<input class="input_tag" type="password" name="pw" placeholder="비밀번호를 입력하세요." required="required">
	       		<!-- incorrect password error message -->
			        <div class="auth_error_msg red-mark"></div>
					<div class="login_bottom_con">
					<div class="store_id_con">
						<label class="store_id_label">
							<input class="store_id_input" type="checkbox" name="storeid">
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
	</c:when>
	
	<c:otherwise>
		<div class="after_loign_con">
			<c:choose>
				<c:when test="${preBtName == '온라인 계약하기'}">
	<!-- 			'온라인 계약한게 하나도 없을 때' -->
					<div class="welcome_box_first">
						<span class="owner_name">${bLogin.name }</span>환영합니다. 사장님 어서오세요.
					</div>
					<div class="store_register_box">
						<div class="store_register_guide_con">
							<p>
								현재 등록된 매장이 존재하지 않습니다.<br>
								<span class="store_register_link" onclick='location.href="${cpath}/business/${preLink }"'>온라인 계약</span>을 통해 저희가 제공하는 많은 서비스를 이용하실 수 있습니다.<br>
								자세한 내용은 아래 링크를 클릭해주세요.
							</p>
							<div>
								<button class="store_register_sign_up_btn" onclick='location.href="${cpath}/business/${preLink }"'>광고
									온라인 계약 하러가기
								</button>
							</div>
						</div>
					</div>
				</c:when>
				
				<c:when test="${preBtName == '매장 등록'}">
	<!-- 			'온라인 계약만 하고 매장 메인 관리 등록 안했을 때' -->
					<div class="welcome_box_first">
						<span class="owner_name">${bLogin.name }</span> [ ${selectEST.brandnaming } ] 사장님 어서오세요.
					</div>
					<div class="store_register_box">
						<div class="store_register_guide_con">
							<p>
								매장 등록을 완료하지 않았습니다.<br>
								<span class="store_register_link" onclick='location.href="${cpath}/business/${preLink }"'>매장 등록</span>을 통해 저희가 제공하는 많은 서비스를 이용하실 수 있습니다.<br>
								매장 등록을 완료하면 영업이 시작됩니다
							</p>
							<div>
								<button class="store_register_sign_up_btn" onclick='location.href="${cpath}/business/${preLink }"'>광고
									매장 등록 하러가기
								</button>
							</div>
						</div>
					</div>
				</c:when>
				
				<c:when test="${preBtName == '프리미엄 광고' }">
<!-- 			'프리미엄 광고를 안했을 때' -->
					<div class="welcome_box_second">
						<span class="owner_name">${bLogin.name }</span> [ ${selectEST.brandnaming } ] 사장님 어서오세요.
					</div>
					<div class="premium_wrap">
						<div class="request_box">
							<p>
								현재 [
									<span class="order_count">13</span>
								] 명의 고객님이 서비스 이용을 희망합니다.<br>
								자세한 내용은 
								<span class="order_status_link" onclick='location.href="${cpath}/business/submanagement/businessOrderStatusManagement/"'>
									해당 링크
								</span>
								를 통해 확인할 수 있습니다.
							</p>
						</div>
						<div class="premium_box">
							<div class="premium_guide_con">
								<p>
									사장님은 현재 프리미엄 광고 서비스를 이용하고 계시지 않습니다.<br> 서비스 계약을 통해 보다 많은
									고객님들께 서비스를 소개해보시는 건 어떠세요?<br>
								</p>
								<div>
									<button class="premium_sign_up_btn"
										onclick='location.href="${cpath}/business/contract/businessPremiumAd/"'>광고
										서비스 신청하기</button>
								</div>
							</div>
						</div>
					</div>
				</c:when>

				<c:when test="${preBtName == 'Finish' }">
<!-- 			'프리미엄 광고까지 등록되어있는 상태' -->
					<div class="welcome_box_second">
						<span class="owner_name">${bLogin.name }</span> [ ${selectEST.brandnaming } ] 사장님 어서오세요.
					</div>
					<div class="premium_wrap">
						<div class="request_box">
							<p>
								현재 [
									<span class="order_count">13</span>
								] 명의 고객님이 서비스 이용을 희망합니다.<br>
								자세한 내용은 
								<span class="order_status_link" onclick='location.href="${cpath}/business/submanagement/businessOrderStatusManagement/"'>
									해당 링크
								</span>
								를 통해 확인할 수 있습니다.
							</p>
						</div>
						<div class="premium_box">
							<div class="premium_detail_con">
								<p>
									현재 프리미엄 광고를 이용하고 계십니다.<br>
									[
												<span>2020-10-01</span>
													~
												<span>2020-10-30</span>
											]까지 유효합니다.<br>
									서비스 기간이 만료되는 날 자동으로 계약이 갱신되니 서비스 이용 및 해지 관련은
										<button class="premium_detail_btn" onclick='location.href="${cpath}/business/submanagement/businessCardAccountManagement/"'>프리미엄 계약 관리</button>
									를 통해 관리할 수 있습니다. 
								</p>
							</div>
						</div>
					</div>
				</c:when>
			</c:choose>
		</div>
	</c:otherwise>
</c:choose>

<!-- login regular syntax -->
<script>
  document.getElementById('loginSubmit').addEventListener('click', function(){ loginSubmit();});
</script>
