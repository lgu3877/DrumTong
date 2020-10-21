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
     <title>businessMain :: Laundry</title>
     
     <!-- global css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <!-- header css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
    <!-- inner login css -->
    <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css">         
   
   <!-- Font -->
   <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   <!-- css -->
   <link rel="stylesheet" href="${cpath }/business/css/businessMainPreview.css">
   <link rel="stylesheet" href="${cpath }/business/css/businessInnerNav.css">
   
   <!-- Axios -->
   <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   
   <!-- main cover cookie -->
   <script type="text/javascript"> 
     function getCookie(name) { 
        var cookie = document.cookie;
        
        // 하루동안 보지 않기를 선택하면 cookiePause = N 으로 출력된다
        if (document.cookie !== "") { 
           var cookie_array = cookie.split("; ");
           for ( var index in cookie_array) { 
              var cookie_name = cookie_array[index].split("=");
              if (cookie_name[0] == "cookiePause") { 
                 return cookie_name[1]; 
                 } 
           }
        }
     } 
     
     function openPopup(url) { 
        var cookieCheck = getCookie("cookiePause");
        
        // mainCover.jsp - closePopup 명령어 참조
        if (cookieCheck != "N")
           window.open(url, '', 'width=960,height=640,left=0,top=0'); 
        }
     </script>
</head>     
     


<!-- body -->
<body onload="javascript:openPopup('${cpath}/business/mainCover/')">
   
   <!-- header(navbar) -->
   <%@ include file="businessHeader.jsp" %>
   
   <!-- section -->
   <section>
      <!-- Preview -->
      <%@ include file="businessMainPreview.jsp" %> 
   
      <!-- Inner Navigation -->
      <%@ include file="businessInnerNav.jsp" %>

      <!-- slider -->
      <div style="width: 100%; height: 30%; margin-top: 10px">
         <div class="marginzero inlineBlock slide" style="position:relative ;width: 50%;height: 100%; background-color: yellow; float: left;" id="slideDiv">
            <img src="${cpath }/resources/business/img/laundry1_02.jpg" class="item">
            <img src="${cpath }/resources/business/img/laundry1_03.jpg" style="display: none" class="item">
            <img src="${cpath }/resources/business/img/laundry1_04.jpg" style="display: none" class="item">
            <img src="${cpath }/resources/business/img/laundry1_05.jpg" style="display: none" class="item">
            <img src="${cpath }/resources/business/img/laundry1_06.jpg" style="display: none" class="item">   
            <img id="prevBtn" style="position: absolute; width: 10%; top: 40%; left: 0; z-index: 9999; display: none" src="${cpath }/resources/business/img/prev_button.png" onclick="prevButton()">
            <img id="nextBtn" style="position: absolute; width: 10%; top: 40%; right: 0; z-index: 9999; display: none" src="${cpath }/resources/business/img/next_button.png" onclick="nextButton()">         
         </div>
      
      <!-- Login Include -->
      <%@ include file="businessMainLogin.jsp" %> 
      
      </div>
   </section>
      
   <!-- footer -->
   <%@ include file="businessFooter.jsp" %>
   
   <!-- main cover(slider) -->
   <script type="text/javascript" src="${cpath }/business/js/main.js"></script>

</body>
</html>