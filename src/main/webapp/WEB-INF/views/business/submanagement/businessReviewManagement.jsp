<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: businessReviewManagemnet</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- businessReviewManagement css -->
	<link rel="stylesheet" href="${cpath }/business/css/submanagement/businessReviewManagement.css">

	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>

		
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
		<!-- sub-header(membership) -->
	<%@ include file="../main/businessSubHeader.jsp" %>
		
		<div class="marginauto" style="width: 800px; height: 80%; margin-top: 100px;">	
			<h1 style="text-align: left; font-size: 28pt">리뷰 관리</h1>
				매장 이름 : ${selectEST.brandnaming }
		<div style="width: 800px;" class="marginauto">
			<div style="display: flex; margin-bottom: 15px">
				<input type="button" onclick="location.href='${cpath }/business/submanagement/businessReviewManagement/whole/1/'" value="전체 리뷰(${ReviewCount })" style="width: 33%; height: 50px" id="whole">
				<div style="width: 0.5%"></div>
				<input type="button" onclick="location.href='${cpath }/business/submanagement/businessReviewManagement/noReply/1/'" value="미답변 리뷰(${NoReplybReviewCount})"  style="width: 33%; height: 50px" id="noReply">
				<div style="width: 0.5%"></div>
				<input type="button" onclick="location.href='${cpath }/business/submanagement/businessReviewManagement/reportReply/1/'" value="차단/허위 의심 리뷰"  style="width: 33%; height: 50px"  id="reportReply">
			</div>
			<div id="reviewDiv" style="width: 100%;">				
			
<!-- 			<div style="width: 100%; height: 10%; display: flex" >
					<h1 class="reviewName">이름</h1>
					<h1 class="reviewContent">리뷰내용</h1>
					<h1 class="reviewDate">작성날짜</h1>
					<input type="button" style="width: 10%;" value="답변작성">
					<input type="button" style="width: 10%;" value="차단/신고">
				</div>
				<hr>	 -->			
			</div>
			
			<!-- 페이지 번호 넣기 -->
			<div id = "reviewpage" class="marginauto" style="width: 60%; height: 50px; display: table;">
				<div>
					<i id="prevbtn" class="fas fa-arrow-circle-left fa-3x" onclick="prevbtn(this)"></i>
					<h1 class="currentPage" onclick="paging(this)">1</h1>
					<h1 class="notcurrentPage"  onclick="paging(this)">2</h1>
					<h1 class="notcurrentPage"  onclick="paging(this)">3</h1>
					<h1 class="notcurrentPage"  onclick="paging(this)">4</h1>
					<h1 class="notcurrentPage"  onclick="paging(this)">5</h1>
					<i id="nextbtn" class="fas fa-arrow-circle-right fa-3x" onclick="nextbtn(this)"></i>
				</div>
			</div>
		</div>	
			
			<c:forEach items="${bReview }" varStatus="status">
				<span style="border:1px solid pink;">
					좋아요 : ${bReview[status.index].mgood }, 신고횟수 : ${bReview[status.index].reportcount }
					고객 리뷰 내용 : ${bCustomerReview[status.index].content }
					사업자 내용 : ${bBusinessReview[status.index].content }
				</span>
			</c:forEach>
			
			<c:forEach items="${NoReplybReview }" varStatus="status">
				<c:if test="${NoReplybReview[status.index].replyboolean == 78}">
					<span style="border:1px solid pink;">
						좋아요 : ${NoReplybReview[status.index].mgood }, 신고횟수 : ${NoReplybReview[status.index].reportcount }
						고객 리뷰 내용 : ${bCustomerNoReplyReview[status.index].content }
					</span>
				</c:if>
			</c:forEach>
	
		</div>
	</section>
		

	

	<!-- footer --> <!-- footer  -->
	<%-- <%@ include file="../main/businessFooter.jsp" %> --%>


<%-- <div style="display:'none';">
	<h1>비즈니스 리뷰 관리 페이지입니다</h1>
		매장 이름 : ${selectEST.brandnaming }
		<h1>${Name }(${wholePageNum })</h1>
		<c:forEach items="${bReviewList }" var="Review">
			<span style="border:1px solid pink;">
				좋아요 : ${Review.mgood }, 신고횟수 : ${Review.reportcount } | 
				고객 리뷰 내용 : ${Review.ccontent }
				고객 리뷰 날짜 : ${Review.cregistdate } | 
				사업자 리뷰 내용 : ${Review.bcontent }
				사업자 리뷰 날짜 : ${Review.bregistdate }
			</span>
	</c:forEach>
</div> --%>
	
<script type="text/javascript">

	var bReviewList =  ${bReviewList };
//	var globalPath = null;
	var globalPath = 'whole';
	
	window.onload = function() {
		reviewContents(1);
		arrow(1);
		paging(document.querySelector('.currentPage'));
	//	globalPath = ${pageKind };
	}
	
	function reviewContents(pagenum) {
		
		// controller 에서 받아오는 어떤 값을 기준으로 전체리뷰, 미답변리뷰, 차단/허위 리뷰 활성화시키기
		
		var reviewDiv = document.getElementById('reviewDiv');
		reviewDiv.innerHTML = null;
		
		var count = 0;	// 무조건 반복문이 세번만 사용되도록
		
//		console.log(bReviewList.length);
//		console.log(bReviewList[0].replyboolean);	// 사업자 답글이 달려있으면 'Y', 없으면 'N'
		
		// 페이지까지 고려해서 i 값을 변경하도록 하자 -> 리뷰 3개씩 보여주는 형식이라면 2페이지에서 i = 3이 되도록...
		// count < 숫자 -> 에서 '숫자'만큼 한페이지에 리뷰 게시판이 표현됩니다
		for (i = (pagenum - 1) * 3; i < bReviewList.length && count < 3; i++) {
			var reviewflex = document.createElement('div');
			reviewflex.className = 'reviewflex';
			var imgdiv = document.createElement('div');
			imgdiv.className = 'imgdiv';
			var profile = document.createElement('img');
			profile.setAttribute('src', '');				// 고객 프로필 이미지 경로 추가시키기		
			imgdiv.appendChild(profile);
			reviewflex.appendChild(imgdiv);


			var table = document.createElement('div');
			table.className = 'table';
			var row1 = document.createElement('div');
			row1.className = 'row';
			var row2 = document.createElement('div');
			row2.className = 'row';

			var customerName = document.createElement('h1');
			customerName.className = 'customerName';
			customerName.innerHTML = bReviewList[i].customerName;
			var cregistdate = document.createElement('h1');
			cregistdate.className = 'cregistdate';
			cregistdate.innerHTML = bReviewList[i].cregistdate;
			row1.appendChild(customerName);
			row1.appendChild(cregistdate);
			table.appendChild(row1);
			
			var good = document.createElement('h1');
			good.className = 'left15';
			good.innerHTML = '좋아요';
			var mgood = document.createElement('h1');
			mgood.className = 'left10';
			mgood.innerHTML = bReviewList[i].mgood;
			var report = document.createElement('h1');
			report.className = 'left10';
			report.innerHTML = '신고';
			var reportcount = document.createElement('h1');
			reportcount.className = 'left15';
			reportcount.innerHTML = bReviewList[i].reportcount;
			var score = document.createElement('h1');
			score.className = 'center15';
			score.innerHTML = '평점';
			var gpadiv = document.createElement('div');
			gpadiv.className = 'left35';
			
			var gpa = bReviewList[i].gpa;
			for(j = 0; j < 5; j++) {
				var icon = document.createElement('i');
				if(j <= gpa) {
					//console.log('gpa - j : ', gpa - j );	// gpa 받아오는 거 int -> float 로 수정바람
					if(gpa - j == 0.5)
						icon.className = 'fas fa-star-half-alt';
					else						
						icon.className = 'fas fa-star';
				}
				else
					icon.className = 'far fa-star';

				gpadiv.appendChild(icon);
			}
			row2.appendChild(good);
			row2.appendChild(mgood);
			row2.appendChild(report);
			row2.appendChild(reportcount);
			row2.appendChild(score);
			row2.appendChild(gpadiv);

			table.appendChild(row2);
			reviewflex.appendChild(table);
			
			var btndiv = document.createElement('div');
			btndiv.className = 'btndiv';
			
			// 사업자가 답글을 작성하는 공간 및 작성된 답글을 보여주는 공간
			var businessdiv = document.createElement('div');
			businessdiv.className = 'businessdiv';
			businessdiv.setAttribute('id', bReviewList[i].salecode);			
			
			if(bReviewList[i].blockboolean == 'N') {
				var button1 = document.createElement('input');
				button1.setAttribute('type', 'button');
				button1.setAttribute('name', bReviewList[i].salecode);
				if(bReviewList[i].replyboolean == 'N') {
					button1.setAttribute('value', '답변작성');		// 답변이 달려 있으면 나타나지 않도록
					button1.setAttribute('onclick', 'replyAdd(this)');		// 답변 넘길 떄, bReviewList.salecode }랑 같이 넘겨주도록 하시오
				}
				else {
					button1.setAttribute('value', '답변삭제');
					button1.setAttribute('onclick', 'replyDelete(this)');
					
					var div15 = document.createElement('div');
					div15.style.width = '15%';
					
					var replydiv = document.createElement('div');
					replydiv.className = 'replydiv';
					
					var righthand = document.createElement('i');
					righthand.className = 'far fa-hand-point-right fa-3x';
					
					var bcontent = document.createElement('h1');
					bcontent.innerHTML =  bReviewList[i].bcontent;
					
					businessdiv.appendChild(div15);
					replydiv.appendChild(righthand);
					replydiv.appendChild(bcontent);
					businessdiv.appendChild(replydiv);
				}
				var betweendiv = document.createElement('div');
				var button2 = document.createElement('input');
				button2.setAttribute('type', 'button');
				button2.setAttribute('value', '차단/신고');				// 차단/신고 란에서는 '차단/신고 해제'로...
				button2.setAttribute('name', bReviewList[i].salecode);
				button2.setAttribute('onclick', 'blockAdd(this)');
				button2.setAttribute('name', bReviewList[i].salecode);
				
				btndiv.appendChild(button1);
				btndiv.appendChild(betweendiv);
				btndiv.appendChild(button2);
			}
			else {
				var button = document.createElement('input');
				button.setAttribute('type', 'button');
				button.setAttribute('value', '차단/신고 해제');
				button.setAttribute('onclick', 'blockCancle(this)');
				button.setAttribute('name', bReviewList[i].salecode);
				btndiv.appendChild(button);
			} 
			
			
			reviewflex.appendChild(btndiv);

			var extradiv1 = document.createElement('div');
			extradiv1.className = 'extradiv';
			var textarea = document.createElement('textarea');
			textarea.innerHTML = bReviewList[i].ccontent;
			extradiv1.appendChild(textarea);

			var extradiv2 = document.createElement('div');
			extradiv2.className = 'extradiv';
			var reviewimg = document.createElement('img');
			reviewimg.setAttribute('src', '');						// 리뷰 이미지 경로 추가시키기
			extradiv2.appendChild(reviewimg);
			

			
			reviewDiv.appendChild(reviewflex);
			reviewDiv.appendChild(extradiv1);
			reviewDiv.appendChild(extradiv2);
			reviewDiv.appendChild(businessdiv);
					
			count++;
		}
	}
	
	
	function prevbtn(obj) {
		var pages = obj.parentNode.querySelectorAll('h1');
		
		for(i = pages.length - 1; i > 0; i--) {
			if(pages[i].className === 'currentPage') {
				pages[i].className = 'notcurrentPage';
				pages[i-1].className = 'currentPage';
				arrow(pages[i-1].innerHTML);
				reviewContents(pages[i-1].innerHTML);
				break;
			}
		}	
	}

	function nextbtn(obj) {
		var pages = obj.parentNode.querySelectorAll('h1');
		
		for(i = 0; i < pages.length; i++) {
			if(pages[i].className === 'currentPage') {
				pages[i].className = 'notcurrentPage';
				pages[i+1].className = 'currentPage';
				arrow(pages[i+1].innerHTML);
				reviewContents(pages[i+1].innerHTML);
				break;
			}
		}	
	}
	
	function arrow(pagenum) {
	//	var bReviewList = ${bReviewList };
		var finalPage = parseInt((bReviewList.length)/ 3);
		
		if(bReviewList.length % 3 !== 0)
			finalPage++;
		
		var prevbtn = document.getElementById('prevbtn');
		var nextbtn = document.getElementById('nextbtn');
		
		if(pagenum == '1') {
			prevbtn.style.display = 'none';
			nextbtn.style.display = '';
			if(finalPage == '1')
				nextbtn.style.display = 'none';
		}
		else if(pagenum == finalPage) {
			nextbtn.style.display = 'none';
			prevbtn.style.display = '';
		}
		else {
			prevbtn.style.display = '';
			nextbtn.style.display = '';
		}
	}
	
	function paging(pagenum) {	//pagetag : 페이지 번호가 적힌 태그
	//	var bReviewList = ${bReviewList };
		var finalPage = parseInt((bReviewList.length)/ 3);
		
		if(bReviewList.length % 3 !== 0)
			finalPage++;
	
		var fixpagenum = pagenum.innerHTML;
		var pagetags = document.querySelectorAll('#reviewpage div h1');
					
		if(fixpagenum <= 3) {
			for(i = 1; i <= 5; i++) {
				pagetags[i-1].innerHTML = i;
				if(i > finalPage) {		// 만약 리뷰글이 5개조차 되지 않을 경우에
					pagetags[i-1].style.display = 'none';
				}
				pagetags[i-1].className = 'notcurrentPage';
			}
			arrow(fixpagenum);
			pagetags[fixpagenum - 1].className = 'currentPage';
			reviewContents(fixpagenum);
			return true;
		}		
		else if(fixpagenum > 3) {
			var inputnum = parseInt(fixpagenum - 2);
			switch (finalPage - fixpagenum) {
			case 1:
				inputnum = parseInt(fixpagenum - 3);
				break;
			case 0:
				inputnum = parseInt(fixpagenum - 4);
				if(inputnum == 0)
					inputnum = 1;
				break;
			}
					
			for(i = 1; i <= 5; i++) {
				pagetags[i-1].innerHTML = inputnum;				
				inputnum++;				
			
				if(fixpagenum !== pagetags[i-1].innerHTML)
					pagetags[i-1].className = 'notcurrentPage';
				else
					pagetags[i-1].className = 'currentPage';
			}
			arrow(fixpagenum);
			reviewContents(fixpagenum);		
			return true;
		}		
	}
	
	
	
	// 리뷰글을 차단/신고하는 함수
	function blockAdd(obj) {
		var blockConfirm = confirm('정말로 차단/신고를 하시겠습니까?');
		
		
		if (blockConfirm == false) {
			obj.setAttribute('onclick', 'blockCancle(this)');
		}
		else {

			let ob={
					   'salecode': obj.name,
			      	};
	        const axPost = async (ob) => {   // async : 비동기 실행 함수
	            await axios.post('/drumtong/business/subManagement/businessReviewManagement/rest/reportReply/reportAdd/', ob)
	            // 정상
	       		.then( (response) => {
	            const data = response.data;
	  			bReviewList = data;
	  			
	  			var reviewflexnum = document.querySelectorAll('.reviewflex').length;
				
	  			switch(reviewflexnum) {
	  			case 1:
 		  			reviewContents(document.querySelector('.currentPage').innerHTML - 1);
 		  			arrow(document.querySelector('.currentPage').innerHTML - 1);
 		  			var pagenums = document.querySelectorAll('#reviewpage h1');
 		  			for(i = 0; i < pagenums.length; i++) {
 		  				if(pagenums[i].className = 'currentPage' && pagenums[i].innerHTML !== 1) {
 		  					paging(pagenums[i - 1]);
 		  					break;
 		  				}
 		  			}
 	  				break;
		  			
	  			default:
 		  			reviewContents(document.querySelector('.currentPage').innerHTML);
 		  			arrow(document.querySelector('.currentPage').innerHTML);
 	  				paging(document.querySelector('.currentPage'));
 	  				break;
	  			}	  			
	             })
	          }
			return axPost(ob);
		}
	}
	
	// 차단/신고된 리뷰를 해제하는 함수 
	function blockCancle(obj) {
		var blockConfirm = confirm('정말로 차단/신고를 해제하시겠습니까?');
		
		if (blockConfirm == false) {
			obj.setAttribute('onclick', 'blockAdd(this)');
		}
		else {

			let ob={
					   'salecode': obj.name,
			      	};
			
	        const axPost = async (ob) => {   // async : 비동기 실행 함수
	            await axios.post('/drumtong/business/subManagement/businessReviewManagement/rest/reportReply/reportDelete/', ob)
	            // 정상
	       		.then( (response) => {
	            const data = response.data;
	  			bReviewList = data;
	  			
	  			var reviewflexnum = document.querySelectorAll('.reviewflex').length;
				
	  			switch(reviewflexnum) {
	  			case 1:
 		  			reviewContents(document.querySelector('.currentPage').innerHTML - 1);
 		  			arrow(document.querySelector('.currentPage').innerHTML - 1);
 		  			var pagenums = document.querySelectorAll('#reviewpage h1');
 		  			for(i = 0; i < pagenums.length; i++) {
 		  				if(pagenums[i].className = 'currentPage' && pagenums[i].innerHTML !== 1) {
 		  					paging(pagenums[i - 1]);
 		  					break;
 		  				}
 		  			}
 	  				break;
		  			
	  			default:
 		  			reviewContents(document.querySelector('.currentPage').innerHTML);
 		  			arrow(document.querySelector('.currentPage').innerHTML);
 	  				paging(document.querySelector('.currentPage'));
 	  				break;
	  			}
	             })
	          }
			return axPost(ob);
		}
	}
	
	function replyAdd(obj) {
		var salecode = document.getElementById(obj.name);
		
		var replyInput = document.createElement('textarea');
		replyInput.setAttribute('name', 'bcontent');
		replyInput.setAttribute('maxlength', '1000');

		var replyButton = document.createElement('input');
		replyButton.setAttribute('type', 'button');
		replyButton.setAttribute('value', '답글작성');
		replyButton.setAttribute('onclick', 'replyButton(this)');

		var cancleButton = document.createElement('input');
		cancleButton.setAttribute('type', 'button');
		cancleButton.setAttribute('value', '답글취소');
		cancleButton.setAttribute('onclick', 'cancleButton(this)');
		
		salecode.appendChild(replyInput);
		salecode.appendChild(replyButton);
		salecode.appendChild(cancleButton);
	}
	
	// 답글 작성 함수
	function replyButton(obj) {
		var textarea = obj.parentNode.querySelector('textarea');
		var replyConfirm = confirm('이대로 답글을 작성하시겠습니까?');
		
		if (replyConfirm == false) {
			return false;
		}
		else {
			let ob={
					   'salecode': obj.name,
					   'bcontent': textarea.value,
			      	};
			
			var axiosPath = '/drumtong/business/subManagement/businessReviewManagement/rest/' + globalPath + '/replyAdd/';
			console.log('axiosPath : ', axiosPath);
			
	        const axPost = async (ob) => {   // async : 비동기 실행 함수
	            await axios.post(axiosPath, ob)
	            // 정상
	       		.then( (response) => {
	            const data = response.data;
	  			bReviewList = data;
	  			console.log('답글 작성 후 리스트 : ', bReviewList);
		
	             })
	          }
			return axPost(ob);
		}	
	}
	
	function cancleButton(obj) {
		obj.parentNode.innerHTML = null;
	}
	
</script>
</body>
</html>