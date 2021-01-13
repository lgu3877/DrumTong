<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>

<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a8f343b25889960b1fdf777c9a2a57c&libraries=services,clusterer,drawing"></script>


<!-- Axios script -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<%-- <script type="text/javascript" src="${cpath }/customer/js/laundry/customerSearch.js" charset="UTF-8"></script> --%>

<section class="section_search" >

        <article class="filter">
            <div class="searchBox">
                <i class="fa fa-search-plus search_icon" aria-hidden="true"></i>
                <input class="searchLine" type="text" name="search" id="searchText" placeholder="검색어를 입력하세요" value="${searchWord }">
                <input class="search_button" type="button" name="search" id="search" value="검색" onclick="searchAddress()">
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

//         console.log("펭수 몇마리? = " + counts.length);

        if(counts.length > 6){
            more.style.display = 'block';
        }
    </script>
    <script>
// 	    const axGet = async (move, map) => {	// async : 비동기 실행 함수
// 			move = '${pageContext.request.contextPath}/customer/laundry/customerSearch/rest/clusterer/' + move + '/';
// // 			실제 코드 동작 시
// 	        await axios.get(move)
	
// 	//			테스트 코드 동작 시
// 	//			await axios.get('${pageContext.request.contextPath}/customer/js/laundry/MapTestData.json')
// 		        // 정상 통신 시에..
// 		        .then( (response) => {
// 	        		console.log(response.data);
// 		        	// 마커들의 저장 함수
// 		        	let markers = response.data.forEach(function(i, position) {
// 		        		// 마커 생성
// 		        		let marker = new kakao.maps.Marker({
// 			                position : new kakao.maps.LatLng(i.latitude, i.longitude),
// 			                clickable : true
// 			            });
		           
// 	                //생성된 마커를 반환
// 	                return marker;
		            
// 			        }); // 마커들 저장 함수 종료
	        	
// 			    });
	        	
// 		    };
		    
	    function searchAddress(map){
	    	address = document.getElementById('searchText').value;
	    	//주소-좌표 변환 객체를 생성합니다
	    	var geocoder = new kakao.maps.services.Geocoder();
	    	
	    	//주소로 좌표를 검색합니다
	    	geocoder.addressSearch(address, function(result, status) {
	    	
	    	    // 정상적으로 검색이 완료됐으면 
	    	     if (status === kakao.maps.services.Status.OK) {
	    	
	    	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

// 	    			axGet(address, map);
	    	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    	        map.setCenter(coords);
	    	    } else {
	    	    	alert("정확한 주소를 입력해주세요");
	    	    	document.getElementById('searchText').value='';
	    	    }
	    	});    
	    }
	    
 		let container = document.getElementsByClassName('laundryList_map')[0]; //지도를 담을 영역의 DOM 레퍼런스
		let options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.553505, 126.969641), //지도의 중심좌표.
			level: 7, //지도의 레벨(확대, 축소 정도)
			maxLevel: 11,
			minLevel : 0,
		};
 		
		let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
 		
		searchAddress(map);
		
    </script>
<script>

// // 			폴리곤 생성 코드

// 	    	const axGet2 = async () => {	// async : 비동기 실행 함수
			
// // 			실제 코드 동작 시
// // 	        await axios.get('${pageContext.request.contextPath}/customer/laundry/customerSearch/rest/clusterer/')

// //			테스트 코드 동작 시
// 			await axios.get('${pageContext.request.contextPath}/customer/json/EMD.geojson')
// 	        // 정상 통신 시에..
// 	        .then( (response) => {
// 	        	console.log('실행');
// 	        	console.log(response.data.positions);
	        	
// 	        	let data = response.data.features;
// 	        	let coordinates = [];
// 	        	let name = '';
	        	
// // 	        	jquery문
// // 	        	$.each(data, function(index, val) {
	        		
// // 	        		coordinates = val.geometry.coordinates;
// // 	        		name = val.properties.SIG_KOR_NM;
	        		
// // 	        		displayArea(coordinates, name);
// // 	        	})
	        	
// 	        	data.forEach(function(val,index) {
// 	        		coordinates = val.geometry.coordinates;
// 	        		name = val.properties.EMD_KOR_NM;
	        		
// 	        		displayArea(coordinates, name);
// 	        	})
		            
// 		    });
	        	
// 	    };
// // 	    axGet2();
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
// 	    let polygons = [];
// 	    let customOverlay;
	    
	    
// 	    function displayArea(coordinates, name) {
// 	    	let path = [];
// 	    	let points =[];
	    	
// // 	    	jquery문
// // 	    	$.each(coordinates[0], function(index, coordinate) {
// // 	    		var point = new Object();
// // 	    		point.x = coordinate[1];
// // 	    		point.y = coordinate[0];
// // 	    		points.push(point);
// // 	    		path.push(new kakaomaps.LatLng(coordinate[1], coordinate[0]));
// // 	    	})
	    	
// 	    	coordinates[0].forEach(function (coordinate, index) {
// 	    		let point = new Object();
// 	    		point.x = coordinate[1];
// 	    		point.y = coordinate[0];
// 	    		points.push(point);
// 	    		path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
// 	    	});
	    	
// 	    	// 다각형 생성
// 	    	let polygon = new kakao.maps.Polygon({
// 	    		map : map,
// 	    		path : path,
// 	    		strokeWeight : 1,
// 	    		strokeColor : '#004c80',
// 	    		strokeOpacity : 0.8,
// 	    		fillColor : '#fff',
// 	    		fillOpacity : 0.7
// 	    	});
	    	
// 	    	polygons.push(polygon);
	    	
// 	    	kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
// 	    		polygon.setOptions({
// 	    			fillColor : '#09f'
// 	    		});
// 	    		console.log("name : ", name);
	    		
// 	    		let content =  '<div class="area">' + name + '</div>';
// 	    		let customOverlay = new kakao.maps.CustomerOverlay({
// 	    	    	map : map,
// 	    	    	position : mouseEvent.latLng,
// 	    	    	content : content,
// 	    		}); 
	    		
	    		
// // 	    		customOverlay.setContent('<div class="area">' + name + '</div>');
// // 	    		customOverlay.setPosition(mouseEvent.latLng);
// // 	    		customOverlay.setMap(map);

// 	    	});
	    	
	    	
// 	    	kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
// 	    		customOverlay.setPosition(mouseEvent.latLng);
// 	    	});
	    	
	    	
// 	    	kakao.maps.event.addListener(polygon, 'mouseout', function(mouseEvent) {
// 	    		polygon.setOptions({
// 	    			fillColor : '#fff'
// 	    		});
// 	    		customOverlay.setMap(null);
// 	    	});
	    	
// 	    	kakao.maps.event.addListener(polygon, 'click', function() {
	    		
// 	    		let level = map.getLevel() -2; 
	    		
// 	    		map.setLevel(level, {anchor : centroid(points), animate : {
// 	    			duration : 350
// 	    		}});
	    		
// 	    		deletePolygon(polygons);
// 	    	});
	    	
// 	    }
	    
	    
	    
</script>
</body>
</html>