<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../main/customerHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="section_board">
        <article class="board">
            <h1 class="board_mainName"><span style="float: left">게</span> 시 <span style="float: right">판</span></h1>
            <div class="board_box">

                <form method="POST">
                    <div class="boardList">
                        <div class="boardLine3">
                            <div class="title2">
                                <input type="text" name="title" placeholder="제목" size="100" class="title2_name" maxlength="40" autofocus>
                            </div>

                            <div class="writer2">
                                <input type="hidden" name="member" value="${not empty login }">
                                <c:if test="${not empty login }">
                                    <input type="hidden" name="writer" value="${login.username }">
                                </c:if>
                            </div>

                        </div>
                        <div class="boardContent2">
                            <textarea name="context" rows="25" cols="85" placeholder="내용을 작성하세요" maxlength="1500"></textarea>
                        </div>
                    </div>
                    <div class="board_fo1">
                        <form class="board_fo1_2" enctype="multipart/form-data">
                            <input class="board_fo1_2_file" type="file" name="user">
                            <input class="board_fo1_2_sub" type="button" id="submit" name="submit" value="추가">
                        </form>
                    </div>
                    <div class="boardMenu3">
                        <div class="leftMenu3">
                            <input class="btn" type="button" value="돌아가기" onclick="history.go(-1)">
                        </div>

                        <div class="rightMenu3">
                            <input class="btn" type="submit" value="작성">
                        </div>
                    </div>
                </form>

            </div>
        </article>
    </section>


<%@ include file="../main/customerFooter.jsp"%>