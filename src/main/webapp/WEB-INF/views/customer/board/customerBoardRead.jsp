<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../main/customerHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="section_board">
	<article class="board">
		<h1 class="board_mainName">게 시 판</h1>
		<div class="board_box">

			<div class="boardList">
<!-- 				<div class="boardLine" style="border: 0;"> -->
<%-- 					<div class="num">${vo.num }</div> --%>
<%-- 					<div class="title">${vo.title }</div> --%>
<%-- 					<div class="registdate">${vo.registdate }</div> --%>
<!-- 				</div> -->
				<div class="boardLine boardLine2" style="border: 0;">
					<div class="num num2">1</div>
					<div class="title title2">타이틀</div>
					<div class="registdate registdate2">작성날짜</div>
				</div>
				
				<div class="boardContent" style="border: 1px solid #dadada">
					<textarea disabled>${vo.context }</textarea>
				</div>
			</div>

			<div class="boardMenu2">
				
				<div class="rightMenu2">
					<input class="btn" type="button" value="목록보기"	
					onclick="location.replace('${pageContext.request.contextPath}/customer/board/customerBoard/')">
				</div>
			</div>

		</div>
	</article>
</section>

<%@ include file="../main/customerFooter.jsp"%>