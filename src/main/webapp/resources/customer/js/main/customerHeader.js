/**
 * 
 */

$(document).ready(function() {

		$('.laundryLists').slick({
		infinite : true, 				// 무한 반복 옵션
		slidesToShow : 5, 				// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 1, 			// 스크롤 한번에 움직일 컨텐츠 개수
		autoplay : true, 				// 자동 스크롤 사용 여부
		autoplaySpeed : 3000, 			// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		dots : true, 					// 스크롤바 아래 점으로 페이지네이션 여부
		pauseOnHover : true, 			// 슬라이드 이동시 마우스 호버하면 슬라이더 멈추게 설정
	});
})
