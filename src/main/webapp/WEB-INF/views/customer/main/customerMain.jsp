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
					onclick="location.href='${cpath}/customer/laundry/customerSearch/'"/>
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
								<img src="${cpath }/resources/customer/img/펭수버럭.jpg">
							</div>
							<div class="laundryLists_1_2">
								<p>${li.brandnaming }</p>
								<p>${li.mainlocation }</p>
							</div>
						</a>
					</div>
				</c:forEach>
<!-- 			<div class="laundryLists_1"> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="laundryLists_1_1"> -->
<%-- 						<img src="${cpath }/resources/customer/img/펭수버럭.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="laundryLists_1_2"> -->
<!-- 						<p>펭수에욤</p> -->
<!-- 						<p>버럭!</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->

<!-- 			<div class="laundryLists_1"> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="laundryLists_1_1"> -->
<%-- 						<img src="${cpath }/resources/customer/img/시크도시.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="laundryLists_1_2"> -->
<!-- 						<p>펭수에욤</p> -->
<!-- 						<p>버럭!</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->

<!-- 			<div class="laundryLists_1"> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="laundryLists_1_1"> -->
<%-- 						<img src="${cpath }/resources/customer/img/펭수귀염.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="laundryLists_1_2"> -->
<!-- 						<p>펭수에욤</p> -->
<!-- 						<p>버럭!</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->

<!-- 			<div class="laundryLists_1"> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="laundryLists_1_1"> -->
<%-- 						<img src="${cpath }/resources/customer/img/파란하늘.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="laundryLists_1_2"> -->
<!-- 						<p>펭수에욤</p> -->
<!-- 						<p>버럭!</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->

<!-- 			<div class="laundryLists_1"> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="laundryLists_1_1"> -->
<%-- 						<img src="${cpath }/resources/customer/img/펭수버럭.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="laundryLists_1_2"> -->
<!-- 						<p>펭수에욤</p> -->
<!-- 						<p>버럭!</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->
			
<!-- 			<div class="laundryLists_1"> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="laundryLists_1_1"> -->
<%-- 						<img src="${cpath }/resources/customer/img/펭수버럭.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="laundryLists_1_2"> -->
<!-- 						<p>펭수에욤</p> -->
<!-- 						<p>버럭!</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->

<!-- 			<div class="laundryLists_1"> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="laundryLists_1_1"> -->
<%-- 						<img src="${cpath }/resources/customer/img/시크도시.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="laundryLists_1_2"> -->
<!-- 						<p>펭수에욤</p> -->
<!-- 						<p>버럭!</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->

<!-- 			<div class="laundryLists_1"> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="laundryLists_1_1"> -->
<%-- 						<img src="${cpath }/resources/customer/img/펭수귀염.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="laundryLists_1_2"> -->
<!-- 						<p>펭수에욤</p> -->
<!-- 						<p>버럭!</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->

<!-- 			<div class="laundryLists_1"> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="laundryLists_1_1"> -->
<%-- 						<img src="${cpath }/resources/customer/img/파란하늘.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="laundryLists_1_2"> -->
<!-- 						<p>펭수에욤</p> -->
<!-- 						<p>버럭!</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->

<!-- 			<div class="laundryLists_1"> -->
<!-- 				<a href="#"> -->
<!-- 					<div class="laundryLists_1_1"> -->
<%-- 						<img src="${cpath }/resources/customer/img/펭수버럭.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="laundryLists_1_2"> -->
<!-- 						<p>펭수에욤</p> -->
<!-- 						<p>버럭!</p> -->
<!-- 					</div> -->
<!-- 				</a> -->
<!-- 			</div> -->

<!-- 			<button class="fa fa-arrow-circle-right btn" aria-hidden="true"></button> -->
			<!-- <button class="btn" aria-hidden="true">></button> -->

		</div>
	</article>

</section>

<%@ include file="customerFooter.jsp"%>
