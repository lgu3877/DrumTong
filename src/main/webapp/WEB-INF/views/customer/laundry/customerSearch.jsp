<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js" -->
<!-- 	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" -->
<!-- 	crossorigin="anonymous"></script> -->


<!-- Axios script -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>


<section class="section_search" >

        <article class="filter">
            <div class="searchBox">
                <i class="fa fa-search-plus search_icon" aria-hidden="true"></i>
                <input class="searchLine" type="text" name="search" id="search" placeholder="검색어를 입력하세요">
                <input class="search_button" type="button" name="search" id="search" value="검색">
            </div>

            <select class="filter_op filter_op1">
                <option>옵션1</option>
                <option>옵션1</option>
            </select>

            <select class="filter_op">
                <option>옵션2</option>
                <option>옵션2</option>
            </select>

            <select class="filter_op">
                <option>옵션3</option>
                <option>옵션3</option>
            </select>

            <select class="filter_op">
                <option>옵션4</option>
                <option>옵션4</option>
            </select>

            <select class="filter_op">
                <option>옵션5</option>
                <option>옵션5</option>
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
                                    <a href="#">
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

                                <li class="laundryList_childs premium_childs">
                                    <a href="#">
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
                                <li class="laundryList_childs premium_childs">
                                    <a href="#">
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

                                <li class="laundryList_childs premium_childs">
                                    <a href="#">
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
                                    <a href="#">
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
                                    <a href="#">
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
                                
                                <!-- <li class="laundryList_childs premium_childs">
                                    <a href="#">
                                        <div class="childs_info_1 premium_childs_info_1">
                                            <i class="fas fa-star fa-start" id="fa-start" aria-hidden="true" onclick="bookmark()"></i>
                                            <img src="/laundry/src/main/webapp/resources/customer/img/펭수버럭.jpg">
                                        </div>
                                        <div class="childs_info_1_1 premium_childs_info_1_1">
                                            <p>펭수에욤</p>
                                            <p>버럭!</p>
                                        </div>
                                    </a>
                                </li> -->
                            </ul>
                        </div>
                        <hr class="premium_hr">

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

            <div class="laundryList_map" >
            </div>
            
        </article>


    </section>

    <script>
        let more = document.querySelector('.premium_more');
        let counts = document.querySelectorAll('.premium_childs');

        console.log("펭수 몇마리? = " + counts.length);

        if(counts.length > 6){
            more.style.display = 'block';
        }
    </script>
   </section>
   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c218bd435ac24618816391ea2acab62&libraries=services,clusterer,drawing"></script>
<script>
	// 지도 초기화 함수
// 	function initMap() {
		
		var container = document.getElementsByClassName('laundryList_map')[0]; //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.553505, 126.969641), //지도의 중심좌표.
			level: 7 //지도의 레벨(확대, 축소 정도)
		};
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		
		var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 0 // 클러스터 할 최소 지도 레벨 
		});
		
		
		console.log('실행');
		// ============================ 비동기 실행  =================================
		const axGet = async () => {	// async : 비동기 실행 함수
			
// 			실제 코드 동작 시
// 	        await axios.get('${pageContext.request.contextPath}/customer/laundry/customerSearch/rest/clusterer/')

//			테스트 코드 동작 시
			await axios.get('${pageContext.request.contextPath}/customer/js/laundry/MapTestData.json')
	        // 정상 통신 시에..
	        .then( (response) => {
	        	console.log('실행');
	        	console.log(response.data.positions);
	        	
	        	
	        	// 마커들의 저장 함수
	        	var markers = response.data.positions.map(function(i, position) {

	        		// 마커 생성
	        		var marker = new kakao.maps.Marker({
		                position : new kakao.maps.LatLng(i.lat, i.lng),
		                clickable : true
		            });
		           
	        		// 띄울 Info css 정의
	        		
		            
	        		// 인포윈도우를 생성합니다
	        		
//                     var infowindow = new kakao.maps.InfoWindow({
//                         content : iwContent,
//                         removable : iwRemoveable
//                     });
	        		
                 	// 마커에 클릭이벤트 처리
//                     kakao.maps.event.addListener(marker, 'click', function() {
                    	
//                           // 마커 위에 인포윈도우를 표시합니다
//                           infowindow.open(map, marker);    
                          
//                     });
                   
                   //생성된 마커를 반환
                   return marker;
		            
		        });
	        	
	        	
	        	// 클러스터 클릭 시에 실행할 함수
// 	        	kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
		             
// 	            });
	          	clusterer.addMarkers(markers);
		    });
// 	        ,error : function(xhr, status, error){
// 	            //요청에 실패하면 에러코드 출력  
// 	            alert("에러코드 : " + xhr.status);
// 	       }
	        	
	    };
	    axGet();
// 	 }
	
	
	 
	
	
    
	
	    // 데이터를 가져오기 위해 jQuery를 사용합니다
	    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
// 	    $.get("${pageContext.request.contextPath}/customer/js/MapTestData.json", function(data) {
// 	        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
// 	        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
// 	        var markers = $(data.positions).map(function(i, position) {
// 	            return new kakao.maps.Marker({
// 	                position : new kakao.maps.LatLng(position.lat, position.lng),
// 	                clickable : true
// 	            });
// 	        });

// 	        // 클러스터러에 마커들을 추가합니다
// 	        clusterer.addMarkers(markers);
// 	    });
	

	    
// 			폴리곤 생성 코드

	    	const axGet2 = async () => {	// async : 비동기 실행 함수
			
// 			실제 코드 동작 시
// 	        await axios.get('${pageContext.request.contextPath}/customer/laundry/customerSearch/rest/clusterer/')

//			테스트 코드 동작 시
			await axios.get('${pageContext.request.contextPath}/customer/json/EMD.geojson')
	        // 정상 통신 시에..
	        .then( (response) => {
	        	console.log('실행');
	        	console.log(response.data.positions);
	        	
	        	var data = response.data.features;
	        	var coordinates = [];
	        	var name = '';
	        	
// 	        	jquery문
// 	        	$.each(data, function(index, val) {
	        		
// 	        		coordinates = val.geometry.coordinates;
// 	        		name = val.properties.SIG_KOR_NM;
	        		
// 	        		displayArea(coordinates, name);
// 	        	})
	        	
	        	data.forEach(function(val,index) {
	        		coordinates = val.geometry.coordinates;
	        		name = val.properties.SIG_KOR_NM;
	        		
	        		displayArea(coordinates, name);
	        	})
		            
		    });
	        	
	    };
	    axGet2();
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    var polygons = [];
	    
	    function displayArea(coordinates, name) {
	    	var path = [];
	    	var points =[];
	    	
// 	    	jquery문
// 	    	$.each(coordinates[0], function(index, coordinate) {
// 	    		var point = new Object();
// 	    		point.x = coordinate[1];
// 	    		point.y = coordinate[0];
// 	    		points.push(point);
// 	    		path.push(new kakaomaps.LatLng(coordinate[1], coordinate[0]));
// 	    	})
	    	
	    	coordinates[0].forEach(function (coordinate, index) {
	    		var point = new Object();
	    		point.x = coordinate[1];
	    		point.y = coordinate[0];
	    		points.push(point);
	    		path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
	    	});
	    	
	    	// 다각형 생성
	    	var polygon = new kakao.maps.Polygon({
	    		map : map,
	    		path : path,
	    		strokeWeight : 1,
	    		strokeColor : '#004c80',
	    		strokeOpacity : 0.8,
	    		fillColor : '#fff',
	    		fillOpacity : 0.7
	    	});
	    	
	    	polygons.push(polygon);
	    	
	    	kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
	    		polygon.setOptions({
	    			fillColor : '#09f'
	    		});
	    		
	    		customOverlay.setContent('<div class="area">' + name + '</div>');
	    		
	    		customOverlay.setPosition(mouseEvent.latLng);
	    		customOverlay.setMap(map);
	    	});
	    	
	    	
	    	kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
	    		customOverlay.setPosition(mouseEvent.latLng);
	    	});
	    	
	    	
	    	kakao.maps.event.addListener(polygon, 'mouseout', function(mouseEvent) {
	    		polygon.setOptions({
	    			fillColor : '#fff'
	    		});
	    		customOverlay.setMap(null);
	    	});
	    	
	    	kakao.maps.event.addListener(polygon, 'click', function() {
	    		
	    		var level = map.getLevel() -2;
	    		
	    		map.setLevel(level, {anchor : centroid(points), animate : {
	    			duration : 350
	    		}});
	    		
	    		deletePolygon(polygons);
	    	});
	    	
	    }
	    
	    
	    
</script>
   
   
   
<!--    구글지도 코드 -->
<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDE5_jQ_oM9pWCsESsbufZ89-L7lQScoAU&callback=initMap&region=kr" -->
<!--   	type="text/javascript"> -->
<!-- </script> -->
<!-- <script> -->
<!--  	function initMap() { -->
<!--  		var seoul = { -->
<!--  			lat : 37.5642135, -->
<!--  			lng : 127.0016985 -->
<!--  		}; -->
<!--  		var map = new google.maps.Map( -->
<!--  				document.getElementsByClassName('laundryList_map')[0], { -->
<!--  			zoom : 12, -->
<!--  			center : seoul -->
<!--  		}); -->
<!--  	} -->
<!-- </script> -->
