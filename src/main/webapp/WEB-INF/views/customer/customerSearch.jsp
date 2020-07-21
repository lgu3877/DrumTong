<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="customerHeader.jsp"%>

<section class="section_search">


	<article class="filter">
		<div class="searchBox">
			<!-- <i class="fa fa-search-plus" aria-hidden="true"></i> -->
			<input class="searchLine" type="text" name="search" id="search"
				placeholder="검색어를 입력하세요"> <input class="search_button"
				type="button" name="search" id="search" value="검색">
		</div>

		<select class="filter_op filter_op1">
			<option>옵션1</option>
			<option>옵션1</option>
		</select> <select class="filter_op">
			<option>옵션2</option>
			<option>옵션2</option>
		</select> <select class="filter_op">
			<option>옵션3</option>
			<option>옵션3</option>
		</select> <select class="filter_op">
			<option>옵션4</option>
			<option>옵션4</option>
		</select> <select class="filter_op">
			<option>옵션5</option>
			<option>옵션5</option>
		</select>

		<div class="filter_reset">
			<div class="filter_resets">
				<button>초기화</button>
			</div>
		</div>

	</article>

</section>

<%@ include file="customerFooter.jsp"%>