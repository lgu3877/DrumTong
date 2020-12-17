<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="section_board">
        <article class="board">
            <h1 class="board_mainName">게 시 판</h1>
            <div class="board_box">


                <div class="boardList">
<%--                     <c:if test="${empty list }"> --%>
<!--                         <div> -->
<!--                             <div class="msg"> -->
<!--                                 <h1>검색결과가 없습니다</h1> -->
<!--                                 <button class="btn" -->
<%--                                     onclick="location.replace('${pageContext.request.contextPath}/board/searchInit/')">돌아가기</button> --%>
<!--                             </div> -->
<!--                         </div> -->
<%--                     </c:if> --%>
                    
                    <c:forEach var="vo" items="${List }">
                        <div class="boardLine">
                            <div class="num">${vo.num }</div>
                            <div class="title">
                                <a href="${cpath }/customer/board/customerBoardRead/${vo.num }/">${vo.title }</a>
                            </div>
                            <div class="registdate">${vo.registdate }</div>
                        </div>
                    </c:forEach>
<!--                         <div class="boardLine"> -->
<!--                             <div class="num">1</div> -->
<!--                             <div class="title"> -->
<!--                                 <a>타이틀</a> -->
<!--                             </div> -->
<!--                             <div class="registdate">작성날짜</div> -->
<!--                         </div> -->
                        
<!--                          <div class="boardLine"> -->
<!--                             <div class="num">2</div> -->
<!--                             <div class="title"> -->
<!--                                 <a>타이틀</a> -->
<!--                             </div> -->
<!--                             <div class="registdate">작성날짜</div> -->
<!--                         </div> -->
                        
<!--                         <div class="boardLine"> -->
<!--                             <div class="num">3</div> -->
<!--                             <div class="title"> -->
<!--                                 <a>타이틀</a> -->
<!--                             </div> -->
<!--                             <div class="registdate">작성날짜</div> -->
<!--                         </div> -->
                         
                </div>

                <div class="paging">
                    <c:if test="${prev }">
                        <a href="${cpath }/customer/board/customerBoard1/${begin - 1}/">◀ </a>
                    </c:if>
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <c:if test="${i == page }">
                            <strong>[${i }]</strong>
                        </c:if>
                        <c:if test="${i != page }">
                            <a href="${cpath }/customer/board/customerBoard1/${i }/"> [${i }] </a>
                        </c:if>
                    </c:forEach>
                    <c:if test="${next }">
                        <a href="${cpath }/customer/board/customerBoard1/${end + 1}/">▶</a>
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