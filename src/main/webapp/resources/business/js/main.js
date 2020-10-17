


// Slider
	const slideImages = document.querySelectorAll('.slide .item');
	console.log('slideitem 개수 : ' + slideImages.length);
	
	var slideDiv = document.getElementById('slideDiv');

	interval();
	
	// 2초 단위로 슬라이드가 움직이는 함수
	function interval() {
    	slideTime = setInterval(showSlide, 2000);
	}
	
	// 슬라이드 정지
	function pauseSlide() {
		clearInterval(slideTime);
	}	
		
	function showSlide() {
		
		for(i = 0; i < slideImages.length; i++) {		
			if (slideImages[i].style.display != 'none') {
				slideImages[i].style.display = 'none';
				if (i + 1 < slideImages.length) {
					slideImages[i + 1].style.display = '';
				}
				else {
					slideImages[i].style.display = 'none';
					slideImages[0].style.display = '';
				}
				break;
			}
		}  
	}
	
	
	function activeButton() {
		document.getElementById('prevBtn').style.display = '';
		document.getElementById('nextBtn').style.display = '';
	}

	function deactiveButton() {
		document.getElementById('prevBtn').style.display = 'none';
		document.getElementById('nextBtn').style.display = 'none';
	}
	
	function prevButton() {
		for(i = 1; i < slideImages.length; i++) {
			if(slideImages[i].style.display == '') {
				slideImages[i].style.display = 'none';
				slideImages[i - 1].style.display = '';
				break;
			}
		}		
	}

	function nextButton() {
		for(i = 0; i < slideImages.length - 1; i++) {
			if(slideImages[i].style.display == '') {
				slideImages[i].style.display = 'none';
				slideImages[i + 1].style.display = '';
				break;
			}
		}		
	}

	// 이벤트가 발생했을 때
	// slideDiv 에 마우스가 놓어져 있으면 슬라이드 정지, 마우스가 놓여져 있지 않게 되면 다시 슬라이드 가동 
    if (document.addEventListener){
		document.getElementById('slideDiv').addEventListener('mouseover',pauseSlide);
		document.getElementById('slideDiv').addEventListener('mouseover',activeButton);
		document.getElementById('slideDiv').addEventListener('mouseout',interval);
		document.getElementById('slideDiv').addEventListener('mouseout',deactiveButton);
    }
	
	