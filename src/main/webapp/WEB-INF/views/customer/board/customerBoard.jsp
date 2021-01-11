<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="section_board">
        <article class="board">
            <div class="board_mainName"><span></span></div>
            <div class="board_box">
            	<div class="boardList" style="margin-bottom: 0px;">
            		<div class="boardLine boarlineTitle">
            			<div class="num">NO</div>
                        <div class="title"><a>제목</a></div>
                        <div class="registdate">등록일</div>
            		</div>
            	</div>
                <div class="boardList">
                    <c:forEach var="vo" items="${List }">
                        <div class="boardLine">
                            <div class="num">${vo.num }</div>
                            <div class="title">
                                <a href="${cpath }/customer/board/customerBoardRead/${type }/${vo.num }/">${vo.title }</a>
                            </div>
                            <div class="registdate">${vo.registdate }</div>
                        </div>
                    </c:forEach>
                </div>

                <div class="paging">
                    <c:if test="${prev }">
                        <div><a href="${cpath }/customer/board/customerBoard/${type }/${begin - 1}/">◀ </a></div>
                    </c:if>
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <c:if test="${i == page }">
                           <div><strong>${i }</strong></div>
                        </c:if>
                        <c:if test="${i != page }">
                            <div><a href="${cpath }/customer/board/customerBoard/${type }/${i }/"> ${i } </a></div>
                        </c:if>
                    </c:forEach>
                    <c:if test="${next }">
                        <div><a href="${cpath }/customer/board/customerBoard/${type }/${end + 1}/">▶</a></div>
                    </c:if>
                </div>

                <div class="boardMenu">
                   <div class="rightMenu">
                        <input class="btn" type="button" value="새 글 쓰기"
                        	onclick="location.replace('${pageContext.request.contextPath}/customer/board/customerBoardWrite/${type }/')">
                   </div>
                </div>

            </div>
        </article>
    </section>
    
    <script type="text/javascript">
    	window.onload = function() {
    		document.querySelector('strong').parentNode.style.border = '1px solid black';
    	}
    
    	if('${type }' == 'notice')
    		$('.board_mainName').children('span').html('공지사항 게시판');
    	else if('${type }' == 'event')
    		$('.board_mainName').children('span').html('이벤트 게시판');
    </script>

<%@ include file="../main/customerFooter.jsp"%>