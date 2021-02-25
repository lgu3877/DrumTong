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
    <title>customerDrumtong :: customerSearch</title>
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet" type="text/css">
    <link rel="stylesheet" href="${cpath }/customer/css/customerStyle.css">
    <link rel="stylesheet" href="${cpath }/customer/css/laundry/customerSearch.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<script type="text/javascript" src="${cpath }/customer/js/laundry/customerSearch.js"></script>
	<script type="text/javascript" src="${cpath }/customer/js/main/customerHeader.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="https://kit.fontawesome.com/7522a35233.js" crossorigin="anonymous"></script>

	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a8f343b25889960b1fdf777c9a2a57c&libraries=services,clusterer,drawing"></script>

	<!-- Axios script -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<%-- <script type="text/javascript" src="${cpath }/customer/js/laundry/customerSearch.js" charset="UTF-8"></script> --%>

   	<!-- Google Chart -->
   	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	</head>
<body>
<%@ include file="../main/customer_Header.jsp"%>



<section class="section_search" >

        <article class="filter">
            <div class="searchBox">
                <i class="fa fa-search-plus search_icon" aria-hidden="true"></i>
                <input class="searchLine" type="text" name="search" id="searchText" placeholder="검색어를 입력하세요" value="${searchWord }">
                <input class="search_button" type="button" name="search" id="search" value="검색" onclick="searchAddress()">
            </div>

            <select class="filter_op filter_op1" id="filter1">
            	<option value="none">세탁물</option>
                <option value="상의">상의</option>
                <option value="하의">하의</option>
                <option value="커튼">커튼</option>
                <option value="명품류">명품류</option>
                <option value="속옷류">속옷류</option>
                <option value="드레스">드레스</option>
                <option value="정장류">정장류</option>
                <option value="모자">모자</option>
            </select>

            <select class="filter_op" id="filter2">
                <option value="weekend">모든 매장</option>
                <option value="today">영업중인 매장</option>
            </select>

            <select class="filter_op" id="filter4">
                <option value="none">배달 여부</option>
                <option value="N">수거,배달 X</option>
                <option value="Y">수거,배달 O</option>
            </select>

            <select class="filter_op" id="filter5">
                <option value="none">정렬 없음</option>
                <option value="score">평점 높은순</option>
                <option value="count">리뷰 많은순</option>
                <option value="location">현재 지도 중심 거리순</option>
            </select>

            <div class="filter_reset">
                <div class="filter_resets">
                    <button>초기화</button>
                </div>
            </div>
        </article>

        <article class="laundryList_main">
            <div class="laundryList_list">

                <div class="laundryList_sum">
                    <p>전체 세탁소 800개</p>
                    <hr class="sum_hr">
                </div>

                <div class="laundryList_child">

                    <ul class="laundryList_child_list">
                        <div class="premium_nameBox">
                            <p class="premium_name">프리미엄</p>
                            <a class="premium_more">더보기 〉</a>
                        </div>
                        <hr class="premium_hr">

                        <div class="laundryList_premium">
                            <ul class="premium_list">

                                <li class="laundryList_childs premium_childs">
                                    <a href="${cpath }/customer/laundry/customerDetail/ESTID_ce8e90b3489649d788116e8113d6f65e/">
                                        <div class="childs_info_1 premium_childs_info_1">
                                            <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                            <img src="${cpath }/resources/customer/img/펭수버럭.jpg">
                                        </div>
                                        <div class="childs_info_1_1 premium_childs_info_1_1">
                                            <p>펭수에욤</p>
                                            <p>버럭!</p>
                                        </div>
                                    </a>
                                </li>

                                <li class="laundryList_childs premium_childs">
                                    <a href="${cpath }/customer/laundry/customerDetail/ESTID_ce8e90b3489649d788116e8113d6f65e/">
                                        <div class="childs_info_1 premium_childs_info_1">
                                            <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                            <img src="${cpath }/resources/customer/img/펭수버럭.jpg">
                                            <!-- <img/> -->
                                        </div>
                                        <div class="childs_info_1_1 premium_childs_info_1_1">
                                            <p>펭수에욤</p>
                                            <p>버럭!</p>
                                        </div>
                                    </a>
                                </li>
                                
                            </ul>
                        </div>
                        <hr class="premium_hr">

                        <li class="laundryList_childs">
                            <a href="${cpath }/customer/laundry/customerDetail/ESTID_ce8e90b3489649d788116e8113d6f65e/">
                                <div class="childs_info_1">
                                    <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                    <img src="${cpath }/resources/customer/img/펭수버럭.jpg">
                                </div>
                                <div class="childs_info_1_1">
                                    <p>펭수에욤</p>
                                    <p>버럭!</p>
                                </div>
                            </a>
                        </li>

                        <li class="laundryList_childs">
                            <a href="#">
                                <div class="childs_info_1">
                                    <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                    <img src="${cpath }/resources/customer/img/펭수버럭.jpg"> </div> <div
                                        class="childs_info_1_1">
                                        <p>펭수에욤</p>
                                        <p>버럭!</p>
                                </div>
                            </a>
                        </li>

                        <li class="laundryList_childs">
                            <a href="#">
                                <div class="childs_info_1">
                                    <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                    <img src="${cpath }/resources/customer/img/펭수귀염.jpg">
                                </div>
                                <div class="childs_info_1_1">
                                    <p>펭수에욤</p>
                                    <p>버럭!</p>
                                </div>
                            </a>
                        </li>

                        <li class="laundryList_childs">
                            <a href="#">
                                <div class="childs_info_1">
                                    <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                    <img src="${cpath }/resources/customer/img/펭수버럭.jpg">
                                </div>
                                <div class="childs_info_1_1">
                                    <p>펭수에욤</p>
                                    <p>버럭!</p>
                                </div>
                            </a>
                        </li>

                        <li class="laundryList_childs">
                            <a href="#">
                                <div class="childs_info_1">
                                    <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                    <img src="${cpath }/resources/customer/img/펭수귀염.jpg">
                                </div>
                                <div class="childs_info_1_1">
                                    <p>펭수에욤</p>
                                    <p>버럭!</p>
                                </div>
                            </a>
                        </li>

                        <li class="laundryList_childs">
                            <a href="#">
                                <div class="childs_info_1">
                                    <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                    <img src="${cpath }/resources/customer/img/펭수버럭.jpg">
                                </div>
                                <div class="childs_info_1_1">
                                    <p>펭수에욤</p>
                                    <p>버럭!</p>
                                </div>
                            </a>
                        </li>

                        <li class="laundryList_childs">
                            <a href="#">
                                <div class="childs_info_1">
                                    <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                    <img src="${cpath }/resources/customer/img/시크도시.jpg">
                                </div>
                                <div class="childs_info_1_1">
                                    <p>펭수에욤</p>
                                    <p>버럭!</p>
                                </div>
                            </a>
                        </li>

                        <li class="laundryList_childs">
                            <a href="#">
                                <div class="childs_info_1">
                                    <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                    <img src="${cpath }/resources/customer/img/파란하늘.jpg">
                                </div>
                                <div class="childs_info_1_1">
                                    <p>펭수에욤</p>
                                    <p>버럭!</p>
                                </div>
                            </a>
                        </li>

                        <li class="laundryList_childs">
                            <a href="#">
                                <div class="childs_info_1">
                                    <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                    <img src="${cpath }/resources/customer/img/펭수귀염.jpg">
                                </div>
                                <div class="childs_info_1_1">
                                    <p>펭수에욤</p>
                                    <p>버럭!</p>
                                </div>
                            </a>
                        </li>

                        <li class="laundryList_childs">
                            <a href="#">
                                <div class="childs_info_1">
                                    <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                    <img src="${cpath }/resources/customer/img/시크도시.jpg">
                                </div>
                                <div class="childs_info_1_1">
                                    <p>펭수에욤</p>
                                    <p>버럭!</p>
                                </div>
                            </a>
                        </li>

                    </ul>
                </div>

            </div>
			
				<span style="display: none;" id="sido-hidden"></span>
				<span style="display: none;" id="hidden"></span>
				<span style="display: none;" id="currentlatitude"></span>
				<span style="display: none;" id="currentlongitude"></span>
				<!-- <span style="display: none;" id="hidden"></span> -->
			<div class="map_wrap">
				<div id="drumtongMap" class="laundryList_map"></div>
				<div class="hAddr">
					<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
				</div>
			</div>
	</article>


    </section>

    <script>
        let more = document.querySelector('.premium_more');
        let counts = document.querySelectorAll('.premium_childs');

//         console.log("펭수 몇마리? = " + counts.length);

        if(counts.length > 6){
            more.style.display = 'block';
        }
    </script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/searchMap/selectLaundryList.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/searchMap/drumtong-map-main.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/searchMap/drumtong-map-sub.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/searchMap/drumtong-map-sido.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/searchMap/drumtong-map-sigungu.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/searchMap/drumtong-map-emd.js"></script>
    <script type="text/javascript" src="${cpath }/customer/js/laundry/searchMap/drumtong-map-shop.js"></script>
</body>
</html>