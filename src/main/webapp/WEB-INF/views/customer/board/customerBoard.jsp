<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="section_board">
        <article class="board">
            <h1 class="board_mainName"><span style="float: left">게</span> 시 <span style="float: right">판</span></h1>
            <div class="board_box">
            	<div class="boardList" style="margin-bottom: 0px;">
            		<div class="boardLine">
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
                        <a href="${cpath }/customer/board/customerBoard/${type }/${begin - 1}/">◀ </a>
                    </c:if>
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <c:if test="${i == page }">
                            <strong>[${i }]</strong>
                        </c:if>
                        <c:if test="${i != page }">
                            <a href="${cpath }/customer/board/customerBoard/${type }/${i }/"> [${i }] </a>
                        </c:if>
                    </c:forEach>
                    <c:if test="${next }">
                        <a href="${cpath }/customer/board/customerBoard/${type }/${end + 1}/">▶</a>
                    </c:if>
                </div>

                <div class="boardMenu">
                   <div class="rightMenu">
                        <input class="btn" type="button" value="새 글 쓰기"
                        	onclick="location.replace('${pageContext.request.contextPath}/customer/board/customerBoardWrite/')">
                   </div>
                </div>

            </div>
        </article>
    </section>

<%@ include file="../main/customerFooter.jsp"%>