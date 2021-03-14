<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="myModal" class="modal">
	<!-- Modal content -->

	<div class="modal-content1" id="modal-content1">
		<select class="modal-couponList" id="modal-couponList"></select>
		<button class="modal-addCoupon" id="modal-addCoupon">받기</button>
	</div>

	<div class="modal-content2" id="modal-content2">
		<div class="modal-total">
			<div class="modal-payment-head">약관</div>
			<textarea readonly>
					 약관을 읽고 동의해주세요
					[Drumtong 결제 약관]
					1. 포인트 결제
					① 사전에 충전해둔 포인트를 이용해 결제할 수 있습니다.
					② 결제한 포인트는 저희 Drumtong 가상계좌에 입금되며, 세탁이 종료되는 시점에 세탁소 측으로 입금됩니다. 
          		</textarea>
			<input type="radio" id="agree" value="agree" class="submit-agree">동의합니다.활성화
		</div>
		<div class="modal-payment">
			<div class="modal-payment-head">
				결제
				<div class="close">&times;</div>
			</div>
			<div>
				수거 요청사항 : <input id="collectionRequests" type="text"
					placeholder="요청사항">
			</div>
			<div>
				세탁 요청사항 : <input id="laundryRequests" type="text" placeholder="요청사항">
			</div>
			<div>
				배달 요청사항 : <input id="deliveryRequests" type="text"
					placeholder="요청사항">
			</div>
			<select class="modal-myCardList">
				<option selected>포인트 결제</option>
			</select>
			<div id="modal-price" class="modal-price">
				결제 금액 : <span></span> 원
			</div>
			<div id="my-point" class="modal-price">
				현재 포인트 : <span></span> 원
			</div>
			<button class="modal-submit" id="modal-submit">결제하기</button>
		</div>
	</div>

	<div class="modal-content3" id="modal-content3">
		<form method="POST" id="loginForm">
			<img src="${cpath }/resources/customer/img/logo4.png"
				class="login-logo" />
			<div class="login-alert">메세지</div>
			<div class="login-input">
				<input type="text" name="id" placeholder="ID" id="userid"
					class="login-input-boxs" /> <input type="password" name="pw"
					placeholder="PW" id="userpw" class="login-input-boxs" /> <input
					type="hidden" name="estid" value="${estid }">
				<div class="login-check">
					<label><input type="checkbox" name="storeid" id="storeid"
						class="login-storeid" />ID 기억하기</label> <a href="#" class="login-idFind">ID/PW
						찾기</a>
				</div>

				<div class="login-buttons">
					<input type="button" value="login" id="loginSubmit"
						class="login-input-buttons" /> <input type="button" value="Join"
						id="loginJoin" class="login-input-buttons" />
				</div>
			</div>
		</form>
	</div>

	<div class="modal-content4" id="modal-content4" style="display: none">
		<div
			style="background: #35aefd; color: white; height: 60px; display: flex; align-items: center;">
			<h2 style="margin: 0; font-size: 13pt;">리뷰게시판</h2>
		</div>

		<div class="modal-reiview" id="modal-reiview">
			<div class="detailview-review-row">
				<div class="review-head">
					<div class="review-profilePic">
						<img>
					</div>
					<div class="review-writer">
						<div class="right-row">
							<p class="customerName"></p>
							<div>
								<p class="mgood"></p>
								<p class="visit">방문수 1 ·</p>
								<p class="gpa"></p>
							</div>
						</div>
					</div>
				</div>
				<div class="orderListMsg">
					<span class="orderList-hide"></span>
				</div>
				<div class="review-reviewimg" style="display: none">
					<img>
				</div>
				<div class="modal-grade">
					<span></span>
				</div>
				<div class="review-context"></div>
				<div class="owner-review">
					<h1 class="owner-name"></h1>
					<p class="owner-content">사장님 댓글 공간입니다</p>
				</div>
			</div>
		</div>
	</div>

	<div class="modal-content5" id="modal-content5" style="display: none">
		<img>
	</div>
	<div id="modal-content5-exit" style="display: none"
		onclick="DeactiveModal5()">
		<i class="fas fa-times fa-4x"></i>
	</div>
</div>