<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="customerHeader.jsp"%>


<section class="section_main">

	<article class="search">
		<form class="searchs">
			<p class="searchs_p"><b>세탁물</b>을 <b>깨끗</b>하게</p>
			<p class="searchs_p">주거지까지 배달합니다.</p>
			<div class="searchBox">
				<i class="fa fa-search-plus" aria-hidden="true"></i> 
				<input 
					class="searchLine" 
					type="text" 
					name="search" 
					id="search" 
					placeholder="                                                                 검색어를 입력하세요"/>
				<input 
					class="search_button"
					type="button" 
					name="search" 
					id="search" 
					value="검색"
					onclick="mainSearch()"/>
			</div>
		</form>
	</article>

	<article class="notice">
		<p class="notice_name">게시판</p>

		<div class="notices">

			<div class="notices_0 notices_1">
				<a href="${cpath }/customer/board/customerBoard/notice/">
					<div class="notices_1_1">공지사항 게시판</div>
				</a>
				<hr class="notice_hr">
				<ul class="notice_ul">
					<c:forEach items="${boardRecentList }" var="bList">
							<div class="notice_area">
								<div class="notice_area_title">
									<div class="notice_new">
										<c:if test="${bList.registdate eq todayDate }">new</c:if>
									</div>
									<a href="${cpath }/customer/board/customerBoardRead/notice/${bList.num }/">[공지] ${bList.title } </a>
								</div>
								<div class="notice_area_registdate">
									${bList.registdate }
								</div>
							</div>
					</c:forEach>
				</ul>
			</div>

			<div class="notices_0 notices_2">
				<a href="${cpath }/customer/board/customerBoard/event/">
					<div class="notices_1_2">이벤트 게시판</div>
				</a>
				<hr class="notice_hr">
				<ul class="notice_ul">
					<c:forEach items="${eventRecentList }" var="eList">
							<div class="notice_area">
								<div class="notice_area_title">
									<div class="notice_new">
										<c:if test="${eList.registdate eq todayDate }">new</c:if>
									</div>
									<a href="${cpath }/customer/board/customerBoardRead/event/${eList.num }/">[event] ${eList.title } </a>
								</div>
								<div class="notice_area_registdate">
									${eList.registdate }
								</div>
							</div>
					</c:forEach>
				</ul>
			</div>
		</div>

	</article>

	<article class="laundryList">
		<p class="laundry_p laundry_p1">간편한 세탁소 찾기</p>
		<p class="laundry_p laundry_p2">쉽게 세탁소를 찾기 위한 솔루션!</p>
		<div class="laundryLists">
				<c:forEach items="${RandomList }" var="li">
					<div class="laundryLists_1">
						<a href="${cpath }/customer/laundry/customerDetail/${li.estid}/">
							<div class="laundryLists_1_1">
								<c:choose>
									<c:when test="${li.mainimg == '-'}">
										<img src="${cpath }/resources/customer/img/펭수버럭.jpg">
									</c:when>
									<c:otherwise>
										<img src="https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/${li.mainimg }">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="laundryLists_1_2">
								<p style="display:inline-block;width:70%;font-size: 20px;font-weight:bold;">${li.brandnaming } (${li.reviewnum })</p>
								<p style="display:inline-block;width:20%;text-align: right;">
									<img style="width:20px;height:20px;display:${li.deliveryboolean == 89 ? 'inline-block' : 'none'}" 
										src="data:image/png;base64,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">
									${li.gpa }
								</p>
								<p>${li.mainlocation }</p>
							</div>
							<div style="display:inline-flex;">
							<!-- 아이콘 나타내는 공간 -->
							<c:forEach items="${li.maincategory }" var="cate">
								<img style="width:40px;height:40px;" src="${cpath }/resources/business/img/category/${cate }.jpg">
							</c:forEach>s
							</div>
						</a>
					</div>
				</c:forEach>

<!-- 			<button class="fa fa-arrow-circle-right btn" aria-hidden="true"></button> -->
			<!-- <button class="btn" aria-hidden="true">></button> -->

		</div>
	</article>

</section>
<script>
// 	영경스크립트
	function mainSearch(){
		location.href='${cpath}/customer/laundry/customerSearch/' + document.getElementById('search').value + '/';
	}
</script>
<%@ include file="customerFooter.jsp"%>
