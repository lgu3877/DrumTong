<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../main/customerHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="section_board">
	<article class="board">
        <div class="board_mainName"><span></span></div>
		<div class="board_box">

			<div class="boardList">
				<div class="boardLine" style="border: 0;">
					<div class="num num2">${board.num }</div>
					<div class="title title2">${board.title }</div>
					<div class="registdate registdate2">${board.registdate }</div>
				</div>
				
				<div class="boardContent" style="border: 1px solid #dadada">
					<textarea disabled>${board.content }</textarea>
				</div>
			</div>

			<div class="boardMenu2">
				<div class="rightMenu2">
					<input class="btn" type="button" value="목록보기"	
					onclick="location.replace('${pageContext.request.contextPath}/customer/board/customerBoard/${type }/')">
				</div>
			</div>

		</div>
	</article>
</section>

    <script type="text/javascript">
    	if('${type }' == 'notice')
    		$('.board_mainName').children('span').html('공지사항 게시판');
    	else if('${type }' == 'event')
    		$('.board_mainName').children('span').html('이벤트 게시판');
    </script>

<%@ include file="../main/customerFooter.jsp"%>