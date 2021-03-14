function headerSettings(status){
	headerMemnu1 = document.querySelector('#signUP_header');
	headerMemnu2 = document.querySelector('#Login_header');
	headerMemnu3 = document.querySelector('#MyAccount_header');
	
	if(status === ''){
		// 로그인 안되어 있을 때
		headerMemnu1.style.display = '';
		headerMemnu2.style.display = '';
		headerMemnu3.style.display = 'none';
	}
	else{
		headerMemnu1.style.display = 'none';
		headerMemnu2.style.display = 'none';
		headerMemnu3.style.display = '';
	}
}