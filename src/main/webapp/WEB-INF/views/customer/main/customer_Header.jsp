<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<header>
        <a href="${cpath }/"><img class="logo" src="https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/system/customer/img/logo3.png"></img></a>
        
        <div class="mainMenu">
            
            <ul class="menu">
                <li>
                    <a href="#" class="middleMenu" onclick="middleMenuClick()">한글</a>
                </li>
            </ul>

            <ul class="menu" >
                <li>
                    <a href="#" class="middleMenu">메뉴1</a>
                </li>
            </ul>   

            <ul class="menu">
                <li>
                    <a href="#" class="middleMenu">메뉴2</a>
                </li>
            </ul>
            
            
            <ul class="menu" id="signUP_header">
                <li>
                    <a href="${cpath }/customer/membership/customerSignUp/" class="middleMenu">회원가입</a>
                </li>
            </ul>  
            <ul class="menu" id="Login_header">
            	
                <li class="headerLogin">
                			<a href="${cpath }/customer/membership/customerLogin/" class="middleMenu middleMenu2 ">로그인</a>
              	</li>
            </ul>
            <ul class="menu" id="MyAccount_header">
            	
                <li class="headerLogin">
                			<a href="${cpath }/customer/account/customerMenu/" class="middleMenu middleMenu2 ">내 계정</a>
                			
                			<ul class="mypage">
		                        <div class="listButtons">
		                            <li class="mypageList">즐겨찾기</a></li>
		                            <li class="mypageList"><a href="${cpath }/customer/account/customerOrderList/" class="listButton">주문내역</a></li>
		<!--                             <li class="mypageList"><a href="#" class="listButton">계정</a></li> -->
		                            <li class="mypageList"><a href="${cpath }/customer/membership/customerLogOut/" class="listButton">로그아웃</a></li>
		                        </div>
		                    </ul>
                	
                    
                </li>
            </ul> 
        </div>
    </header>
    
    <script>
    	headerSettings('${cLogin}');
    </script>