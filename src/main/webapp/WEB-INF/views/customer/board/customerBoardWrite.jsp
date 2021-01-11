<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../main/customerHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<section class="section_board">
        <article class="board">
            <div class="board_mainName"><span></span></div>
            <div class="board_box">

                <form method="GET" action="${cpath }/customer/board/customerBoardSaveWriting/${type}/" class="writeform">
                    <div class="boardList">
                        <div class="boardLine3">
                            <div class="title2">
                                <input type="text" name="title" placeholder="제목" size="100" class="title2_name" maxlength="40" autofocus>
                            </div>

<!--                             <div class="writer2"> -->
<%--                                 <input type="hidden" name="member" value="${not empty login }"> --%>
<%--                                 <c:if test="${not empty login }"> --%>
<%--                                     <input type="hidden" name="writer" value="${login.username }"> --%>
<%--                                 </c:if> --%>
<!--                             </div> -->

                        </div>
                        <div class="boardContent2">
                            <textarea name="content" rows="25" cols="85" placeholder="내용을 작성하세요" maxlength="1500"></textarea>
                        </div>
                    </div>
                    <div class="board_fo1">
<!--                         <form class="board_fo1_2" enctype="multipart/form-data"> -->
<!--                             <input class="board_fo1_2_file" type="file" name="user"> -->
<!--                             <input class="board_fo1_2_sub" type="button" id="submit" name="submit" value="추가"> -->
<!--                         </form> -->
                    </div>
                    <div class="boardMenu3">
                        <div class="leftMenu3">
                            <input class="btn" type="button" value="돌아가기" onclick="location.replace('${pageContext.request.contextPath}/customer/board/customerBoard/${type }/')">
                        </div>

                        <div class="rightMenu3">
                            <input class="btn" type="submit" value="작성">
                        </div>
                    </div>
                </form>

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