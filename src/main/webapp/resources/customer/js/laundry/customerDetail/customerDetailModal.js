// Open Modal
function openModal(currentModal, styleDisplay){
	modal.style.display = 'block';
	currentModal.style.display = styleDisplay;
}

// Close Modal
function closeModal(currentModal){
	modal.style.display = 'none';
	currentModal.style.display = 'none';
}

// Close All Modal
function closeAllModal(){
	const reviewModals = document.querySelector('#modal-reiview').querySelectorAll('.detailview-review-row');
	for(i = reviewModals.length; i > 0; i--) {
    	   if(i == 1)
    		   reviewModals[i - 1].querySelector('.modal-grade').innerHTML = '';
    	   else
	 		   reviewModals[i - 1].remove();
	}

	modal.style.display = 'none';
	modalContent1.style.display = 'none';
	modalContent2.style.display = 'none';
	modalContent3.style.display = 'none';
	modalContent4.style.display = 'none';
}


//Mouse Over on Modal
function mouseOverModal(target) {
	target.parentNode.style.background = 'white';
	target.parentNode.style.border = '3px solid #1564F9';
	target.style.background = '#1564F9';
	target.querySelector('p').style.color = 'white';
};

// Mouse Out from Modal
function mouseOutModal(target) {
	target.parentNode.style.background = '#1564F9';
	target.style.background = 'white';
	target.querySelector('p').style.color = '#1564F9';
};




// View All Review
function reviewMore() {
	if (reviewList.length == 0) {
		let reviewRow = document.querySelector('.detailview-review-row');
		reviewRow.style.display = 'none';
		let h1 = document.createElement('h1');
		h1.innerHTML = '리뷰가 존재하지 않습니다';
		reviewRow.parentNode.appendChild(h1);

		return;
	}

	for (i = 0; i < reviewList.length; i++) {
		if (i == 0) {
			$('.detailview-review-row').attr('id', 'review' + i);
			$('.detailview-review-row').find('.customerName').html(
					reviewList[i].customerName);
			$('.detailview-review-row').find('.review-context').html(
					reviewList[i].ccontent);
			$('.detailview-review-row').find('.orderListMsg').html(
					reviewList[i].orderListMsg
							+ '<span class="orderList-hide">'
							+ reviewList[i].orderList + '</span>');
			document.querySelectorAll('.detailview-review-row'
					+ ' .orderListMsg')[i].title = reviewList[i].orderList;

			// 고객이 업로드한 프로필 이미지 -> 만약 올리지 않았다면 undefined 자료형으로 반환함
			if (typeof reviewList[i].profileimg === typeof undefined) {
				$('.detailview-review-row')
						.find('.review-profilePic img')
						.attr(
								"src",
								"https://az-pe.com/wp-content/uploads/2018/05/kemptons-blank-profile-picture.jpg");
			} else {
				$('.detailview-review-row').find('.review-profilePic img')
						.attr(
								"src",
								"https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/"
										+ reviewList[i].profileimg);
			}

			// 고객이 업로드한 리뷰이미지 -> 만약 올리지 않았다면 undefined 자료형으로 반환함
			if (typeof reviewList[i].reviewimg === typeof undefined)
				$('.detailview-review-row').find('.review-reviewimg').css(
						"display", "none");
			else {
				$('.detailview-review-row').find('.review-reviewimg').css(
						"display", "");
				$('.detailview-review-row').find('.review-reviewimg img').attr(
						"src",
						"https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/"
								+ reviewList[i].reviewimg);
				$('.detailview-review-row').find('.review-reviewimg img').attr(
						"onclick",
						"ActiveModal5('" + reviewList[i].reviewimg + "')");
			}

			// 사장님 댓글 생성 조건문
			if (reviewList[i].replyboolean == 'N')
				$('#review' + i).find('.owner-review').css('display', 'none');
			else {
				const inputowner = '사장님<span class="owner-write-date">'
						+ reviewList[i].bregistdate.split(' ')[0] + '</span>';
				$('#review' + i).find('.owner-review').css('display', '');
				$('#review' + i).find('.owner-name').html(inputowner);
				$('#review' + i).find('.owner-content').html(
						reviewList[i].bcontent);
			}
		} else {
			const beforerow = $('#review' + (i - 1));
			beforerow.after('<div class="detailview-review-row">'
					+ beforerow.html() + '</div>');
			beforerow.next().attr('id', 'review' + i);
			beforerow.next().find('.customerName').html(
					reviewList[i].customerName);
			beforerow.next().find('.review-context').html(
					reviewList[i].ccontent);
			beforerow.next().find('.orderListMsg').html(
					reviewList[i].orderListMsg
							+ '<span class="orderList-hide">'
							+ reviewList[i].orderList + '</span>');
			document.querySelectorAll('.detailview-review-row'
					+ ' .orderListMsg')[i].title = reviewList[i].orderList;

			// 고객이 업로드한 프로필 이미지 -> 만약 올리지 않았다면 undefined 자료형으로 반환함
			if (typeof reviewList[i].profileimg === typeof undefined) {
				beforerow
						.next()
						.find('.review-profilePic img')
						.attr(
								"src",
								"https://az-pe.com/wp-content/uploads/2018/05/kemptons-blank-profile-picture.jpg");
			} else {
				beforerow.next().find('.review-profilePic img').attr(
						"src",
						"https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/"
								+ reviewList[i].profileimg);
			}

			// 고객이 업로드한 리뷰이미지 -> 만약 올리지 않았다면 undefined 자료형으로 반환함
			if (typeof reviewList[i].reviewimg === typeof undefined)
				beforerow.next().find('.review-reviewimg').css("display",
						"none");
			else {
				beforerow.next().find('.review-reviewimg').css("display", "");
				beforerow.next().find('.review-reviewimg img').attr(
						"src",
						"https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/"
								+ reviewList[i].reviewimg);
				beforerow.next().find('.review-reviewimg img').attr("onclick",
						"ActiveModal5('" + reviewList[i].reviewimg + "')");
			}

			// 사장님 댓글 생성 조건문
			if (reviewList[i].replyboolean == 'N')
				$('#review' + i).find('.owner-review').css('display', 'none');
			else {
				const inputowner = '사장님<span class="owner-write-date">'
						+ reviewList[i].bregistdate.split(' ')[0] + '</span>';
				$('#review' + i).find('.owner-review').css('display', '')
				$('#review' + i).find('.owner-name').html(inputowner);
				$('#review' + i).find('.owner-content').html(
						reviewList[i].bcontent);
			}

		}

		$('#review' + i).find('.modal-grade').html(''); // 평점 안의 내용 초기화

		// 별자리를 만들어주는 반복문
		for (j = 0; j < reviewList[i].gpa; j++) {
			switch ((reviewList[i].gpa - j).toFixed(1)) {
			case '0.5':
				const halfstar = document.createElement('i');
				halfstar.className = 'fas fa-star-half-alt fa-2x';
				$('#review' + i).find('.modal-grade').append(halfstar);
				break;
			default:
				const star = document.createElement('i');
				star.className = 'fas fa-star fa-2x';
				$('#review' + i).find('.modal-grade').append(star);
				break;
			}
		}

		// 빈별자리를 만들어주는 반복문 -> 0.5 이면 4개의 별은 빈별이어야 한다
		for (k = 5 - (reviewList[i].gpa).toFixed(0); k > 0; k--) { // 반올림
			const nullstar = document.createElement('i');
			nullstar.className = 'far fa-star fa-2x';
			$('#review' + i).find('.modal-grade').append(nullstar);
		}

		// 별자리 옆에 평점 표시
		const gpaspan = document.createElement('span');
		gpaspan.innerHTML = reviewList[i].gpa;
		$('#review' + i).find('.modal-grade').append(gpaspan);

		$('#review' + i).find('.mgood').html(
				'좋아요 ' + reviewList[i].mgood + ' ·&nbsp');
		$('#review' + i).find('.visit').html(
				'방문수 ' + reviewList[i].visits + ' ·&nbsp');
		$('#review' + i).find('.gpa').html('&nbsp평점 ' + reviewList[i].gpa);

		if (reviewList[i].bcontent != '-') {
			console.log('사장님 댓글이 달려있습니다.');
		}
	}
}




function ActiveModal5(src) {
	modalContent5_exit.style.display = "";
	modalContent5.style.display = "";
	modalContent5.querySelector('img').src = "https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/"
			+ src;
}


function DeactiveModal5() {
	modalContent5_exit.style.display = "none";
	modalContent5.style.display = "none";
}
