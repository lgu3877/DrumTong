<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="customerHeader.jsp"%>

<section class="section_main">

	<article class="search">
		<form class="searchs">
			<p class="searchs_p">세탁물을 깨끗하게</p>
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
					onclick="location.replace('${cpath}/customer/laundry/customerSearch/')"/>
			</div>
		</form>
	</article>

	<article class="notice">
		<p class="notice_name">공지사항</p>

		<div class="notices">

			<div class="notices_0 notices_1">
				<a href="#">
					<div class="notices_1_1">공지사항1</div>
				</a>
				<hr class="notice_hr">
				<ul class="notice_ul">
					<li class="notice_li"><a href="#">게시물1</a></li>
					<li class="notice_li"><a href="#">게시물1</a></li>
					<li class="notice_li"><a href="#">게시물1</a></li>
					<li class="notice_li"><a href="#">게시물1</a></li>
					<li class="notice_li"><a href="#">게시물1</a></li>
				</ul>
			</div>

			<div class="notices_0 notices_2">
				<a href="#">
					<div class="notices_1_1">공지사항2</div>
				</a>
				<hr class="notice_hr">
				<ul class="notice_ul">
					<li class="notice_li"><a href="#">게시물2</a></li>
					<li class="notice_li"><a href="#">게시물2</a></li>
					<li class="notice_li"><a href="#">게시물2</a></li>
					<li class="notice_li"><a href="#">게시물2</a></li>
					<li class="notice_li"><a href="#">게시물2</a></li>
				</ul>
			</div>
		</div>

	</article>

	<article class="laundryList">
		<p class="laundry_p laundry_p1">쉬운 방 찾기</p>
		<p class="laundry_p laundry_p2">방 찾기 초보를 위한 초간단 솔루션!</p>
		<div class="laundryLists">

			<div class="laundryLists_1">
				<a href="#">
					<div class="laundryLists_1_1">
						<img src="${cpath }/resources/customer/img/펭수버럭.jpg">
					</div>
					<div class="laundryLists_1_2">
						<p>펭수에욤</p>
						<p>버럭!</p>
					</div>
				</a>
			</div>

			<div class="laundryLists_1">
				<a href="#">
					<div class="laundryLists_1_1">
						<img src="${cpath }/resources/customer/img/시크도시.jpg">
					</div>
					<div class="laundryLists_1_2">
						<p>펭수에욤</p>
						<p>버럭!</p>
					</div>
				</a>
			</div>

			<div class="laundryLists_1">
				<a href="#">
					<div class="laundryLists_1_1">
						<img src="${cpath }/resources/customer/img/펭수귀염.jpg">
					</div>
					<div class="laundryLists_1_2">
						<p>펭수에욤</p>
						<p>버럭!</p>
					</div>
				</a>
			</div>

			<div class="laundryLists_1">
				<a href="#">
					<div class="laundryLists_1_1">
						<img src="${cpath }/resources/customer/img/파란하늘.jpg">
					</div>
					<div class="laundryLists_1_2">
						<p>펭수에욤</p>
						<p>버럭!</p>
					</div>
				</a>
			</div>

			<div class="laundryLists_1">
				<a href="#">
					<div class="laundryLists_1_1">
						<img src="${cpath }/resources/customer/img/펭수버럭.jpg">
					</div>
					<div class="laundryLists_1_2">
						<p>펭수에욤</p>
						<p>버럭!</p>
					</div>
				</a>
			</div>
			
			<div class="laundryLists_1">
				<a href="#">
					<div class="laundryLists_1_1">
						<img src="${cpath }/resources/customer/img/펭수버럭.jpg">
					</div>
					<div class="laundryLists_1_2">
						<p>펭수에욤</p>
						<p>버럭!</p>
					</div>
				</a>
			</div>

			<div class="laundryLists_1">
				<a href="#">
					<div class="laundryLists_1_1">
						<img src="${cpath }/resources/customer/img/시크도시.jpg">
					</div>
					<div class="laundryLists_1_2">
						<p>펭수에욤</p>
						<p>버럭!</p>
					</div>
				</a>
			</div>

			<div class="laundryLists_1">
				<a href="#">
					<div class="laundryLists_1_1">
						<img src="${cpath }/resources/customer/img/펭수귀염.jpg">
					</div>
					<div class="laundryLists_1_2">
						<p>펭수에욤</p>
						<p>버럭!</p>
					</div>
				</a>
			</div>

			<div class="laundryLists_1">
				<a href="#">
					<div class="laundryLists_1_1">
						<img src="${cpath }/resources/customer/img/파란하늘.jpg">
					</div>
					<div class="laundryLists_1_2">
						<p>펭수에욤</p>
						<p>버럭!</p>
					</div>
				</a>
			</div>

			<div class="laundryLists_1">
				<a href="#">
					<div class="laundryLists_1_1">
						<img src="${cpath }/resources/customer/img/펭수버럭.jpg">
					</div>
					<div class="laundryLists_1_2">
						<p>펭수에욤</p>
						<p>버럭!</p>
					</div>
				</a>
			</div>

<!-- 			<button class="fa fa-arrow-circle-right btn" aria-hidden="true"></button> -->
			<!-- <button class="btn" aria-hidden="true">></button> -->

		</div>
	</article>

</section>

<%@ include file="customerFooter.jsp"%>
