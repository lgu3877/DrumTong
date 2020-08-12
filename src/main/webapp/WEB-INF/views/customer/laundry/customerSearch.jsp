<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>

<section class="section_search">

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

            <div class="laundryList_map">
                여기는 지도
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