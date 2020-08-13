<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp" %>    

<!-- 스크립트 영역 -->
<script></script>

<!-- 본문 영역 -->
<section class="section-SangJae">
  <div class="userMenu-row">
    <div class="userMenu" onclick="location.href='#'">
      <i class="fas fa-portrait"></i>
      <div class="userMenu-context">
        <h2>사용자 정보 <i class="fas fa-chevron-right"></i></h2>
        회원정보 수정, 회원탈퇴
      </div>
    </div>
    <div class="userMenu" onclick="location.href='#'">
      <i class="fas fa-portrait"></i>
      <div class="userMenu-context" id="userInfo">
        <h2>결제 및 쿠폰 <i class="fas fa-chevron-right"></i></h2>
        결제수단 등록, 쿠폰조회
      </div>
    </div>
    <div class="userMenu" onclick="location.href='#'">
      <i class="fas fa-portrait"></i>
      <div class="userMenu-context">
        <h2>알림 <i class="fas fa-chevron-right"></i></h2>
        알림설정
      </div>
    </div>
  </div>
</section>

<!-- 스크립트 영역 -->
<script></script>

<%@ include file="../main/customerFooter.jsp" %>    