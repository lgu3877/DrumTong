<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
 
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>customerDrumtong :: customerBoard</title>
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet" type="text/css">
    <link rel="stylesheet" href="${cpath }/customer/css/customerStyle.css">
    <link rel="stylesheet" href="${cpath }/customer/css/board/customerBoard.css">
	
	
	<script type="text/javascript" src="${cpath }/customer/js/main/customerHeader.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>

<body>
<%@ include file="../main/customer_Header.jsp"%>

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
                        <div class="onclick" onclick="location.href='${cpath }/customer/board/customerBoard/${type }/${begin - 1}/'"><a>◀ </a></div>
                    </c:if>
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <c:if test="${i == page }">
                           <div><strong>${i }</strong></div>
                        </c:if>
                        <c:if test="${i != page }">
                            <div class="onclick" onclick="location.href='${cpath }/customer/board/customerBoard/${type }/${i }/'"><a> ${i } </a></div>
                        </c:if>
                    </c:forEach>
                    <c:if test="${next }">
                        <div class="onclick" onclick="location.href='${cpath }/customer/board/customerBoard/${type }/${end + 1}/'"><a>▶</a></div>
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
    
	<%@ include file="../main/customerFooter.jsp"%>
    
    <script type="text/javascript">
    	window.onload = function() {
    		document.querySelector('strong').parentNode.style.border = '1px solid black';
    	}
    
    	if('${type }' == 'notice')
    		$('.board_mainName').children('span').html('공지사항 게시판');
    	else if('${type }' == 'event')
    		$('.board_mainName').children('span').html('이벤트 게시판');
    </script>

</body>
</html>