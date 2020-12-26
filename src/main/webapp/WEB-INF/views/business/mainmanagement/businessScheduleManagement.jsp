<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- title -->
    <title>businessScheduleManagement :: Laundry</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- content css -->
	<link rel="stylesheet" href="${cpath }/business/css/management/businessScheduleManagement.css">
	<!-- calendar css -->
	<link rel="stylesheet" href="${cpath }/business/css/management/businessScehduleCalendar.css">

	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   	
   	<!-- jQuery -->
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>

	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp"%>

	<!-- section -->
	<section>
		<!-- top-header(membership) -->
		<%@ include file="../main/businessSubHeader.jsp"%>

		<!-- 일정관리 -->	
		<!-- <form class="content_wrapper"> -->
		<div class="content_wrapper">
			<!-- 영업 시간-->
			<!-- <form class="working_hour"> -->
			<div class="working_hour">
				<!-- title -->	
				<div class="content_title_con">
					<div>
						<span class="content_title">영업 시간 설정</span>
						<i class="far fa-question-circle" style="font-weight: 600">도움말</i>
					</div>
					<!-- buttons -->
					<div class="btn_con">
					<!-- 
						<div id="modify-working-hour" class="btn format_btn">
							<div class="icon_con">
								<i class="fas fa-plus-square"></i>
							</div>
							<div class="btn_title">시간 수정</div>
						</div>
					 -->
						<div id="complete-working-hour" class="btn update_btn">
							<div class="icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="btn_title">수정 완료</div>
						</div>
					</div>
				</div>
				<!-- input -->
				<div class="working_hour_input form">
				
					<!-- 체크 옵션 -->
					<div class="select_con">
						<!-- 주말 운영 옵션 -->
						<div class="radio_con">
							<button id="week-only-btn" class="btn radioBtn" onclick="radioSelect('week-only')">
								주말 휴무
							</button>
							<input id="week-only" type="radio" name="workingHour">
							
							<button id="weekend-also-btn" class="btn radioBtn" onclick="radioSelect('weekend-also')">
								주말 운영
							</button>
							<input id="weekend-also" type="radio" name="workingHour">
						</div>
						<!-- 토/일 선택 체크박스 -->
						<div class="checkbox_con">
							<input id="weekday-only" type="checkbox" name="" value="">
							<button id="weekday-only-btn" class="checkBtn transparent" onclick="checkOption('weekday-only')" disabled>토요일 운영</button>
							<input id="whole-week" type="checkbox" name="" value="">
							<button id="whole-week-btn" class="checkBtn transparent" onclick="checkOption('whole-week')" disabled>일요일 운영</button>
						
						</div>
					</div>	
					
				<!-- 시간 입력 -->
					<div class="input_time_form">
						<ul class="input_title_con">
							<li class="day_range">
								<div>
									월 ㅡ 금
								</div>
							</li>
							<li class="day_range">
								<div>
									토							
								</div>
							</li>
							<li class="day_range">
								<div>
									일
								</div>
							</li>
						</ul>
						<ul class="input_time_con">
						<!-- mon ~ fri -->
							<li class="time_range">
							<!-- from -->
								<div class="time_zone_con">
									<div>
										<input class="time_zone_input" type="radio" name="since" value="daytime">
										<button class="btn time_zone_btn border_r">오전</button>
									</div>
									<div>
										<input class="time_zone_input" type="radio" name="since" value="nighttime">
										<button class="btn time_zone_btn border_l">오후</button>
									</div>
								</div>
								<input class="time_input hour" type="number" name="hour" max="12" placeholder="시">
								<input class="time_input minute" type="number" name="minute" max="59" placeholder="분">
								<div class="time_range_text">
									<span>부터</span>
								</div>
							<!-- to -->
								<div class="time_zone_con">
									<div>
										<input class="time_zone_input" type="radio" name="until" value="daytime">
										<button class="btn time_zone_btn border_r">오전</button>
									</div>
									<div>				
										<input class="time_zone_input" type="radio" name="until" value="nighttime">
										<button class="btn time_zone_btn border_l">오후</button>
									</div>
								</div>
								<input class="time_input hour" type="number" name="hour" max="12" placeholder="시">
								<input class="time_input minute" type="number" name="minute" max="59" placeholder="분">
								<div class="time_range_text">
									<span>까지</span>
								</div>
								<div class="all_day_con">
									<button class="btn" onclick="clearInputs(this)">
										<i class="far fa-clock"></i>
										<span>24시간</span>
									</button>
								</div>
							</li>
							
							
						<!-- sat -->
							<li class="time_range">
							<!-- from -->
								<div class="time_zone_con">
									<div>
										<input class="time_zone_input" type="radio" name="since" value="daytime">
										<button class="btn time_zone_btn border_r">오전</button>
									</div>
									<div>
										<input class="time_zone_input" type="radio" name="since" value="nighttime">
										<button class="btn time_zone_btn border_l">오후</button>
									</div>
								</div>
								<input class="time_input hour" type="number" name="hour" max="12" placeholder="시">
								<input class="time_input minute" type="number" name="minute" max="59" placeholder="분">
								<div class="time_range_text">
									<span>부터</span>
								</div>
							<!-- to -->
								<div class="time_zone_con">
									<div>
										<input class="time_zone_input" type="radio" name="until" value="daytime">
										<button class="btn time_zone_btn border_r">오전</button>
									</div>
									<div>				
										<input class="time_zone_input" type="radio" name="until" value="nighttime">
										<button class="btn time_zone_btn border_l">오후</button>
									</div>
								</div>
								<input class="time_input hour" type="number" name="hour" max="12" placeholder="시">
								<input class="time_input minute" type="number" name="minute" max="59" placeholder="분">
								<div class="time_range_text">
									<span>까지</span>
								</div>
								<div class="all_day_con">
									<button class="btn" onclick="clearInputs(this)">
										<i class="far fa-clock"></i>
										<span>24시간</span>
									</button>
								</div>
							</li>
							
							
						<!-- sun -->	
							<li class="time_range">
								<!-- from -->
								<div class="time_zone_con">
									<div>
										<input class="time_zone_input" type="radio" name="since" value="daytime">
										<button class="btn time_zone_btn border_r">오전</button>
									</div>
									<div>
										<input class="time_zone_input" type="radio" name="since" value="nighttime">
										<button class="btn time_zone_btn border_l">오후</button>
									</div>
								</div>
								<input class="time_input hour" type="number" name="hour" max="12" placeholder="시">
								<input class="time_input minute" type="number" name="minute" max="59" placeholder="분">
								<div class="time_range_text">
									<span>부터</span>
								</div>
							<!-- to -->
								<div class="time_zone_con">
									<div>
										<input class="time_zone_input" type="radio" name="until" value="daytime">
										<button class="btn time_zone_btn border_r">오전</button>
									</div>
									<div>				
										<input class="time_zone_input" type="radio" name="until" value="nighttime">
										<button class="btn time_zone_btn border_l">오후</button>
									</div>
								</div>
								<input class="time_input hour" type="number" name="hour" max="12" placeholder="시">
								<input class="time_input minute" type="number" name="minute" max="59" placeholder="분">
								<div class="time_range_text">
									<span>까지</span>
								</div>
								<div class="all_day_con">
									<button class="btn" onclick="clearInputs(this)">
										<i class="far fa-clock"></i>
										<span>24시간</span>
									</button>
								</div>
							</li>							
						</ul>
					</div>
				</div>
				
			</div>
			<!-- </form> -->
			
			<!-- 정기 휴무 설정 -->
			<!-- <form class="holiday"> -->
			<div class="holiday">
				<!-- title -->
				<div class="content_title_con">
					<div>
						<span class="content_title">정기 휴무 설정</span> 
						<i class="far fa-question-circle" style="font-weight: 600">도움말</i>
					</div>
					<!-- button -->
					<div class="btn_con">
					<!-- 
						<div id="modify-holiday" class="btn format_btn">
							<div class="icon_con">
								<i class="fas fa-plus-square"></i>
							</div>
							<div class="btn_title">일자 변경</div>
						</div>
					-->	
						<div id="complete-holiday" class="btn update_btn">
							<div class="icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="btn_title">수정 완료</div>
						</div>
					</div>
				</div>

			<!-- input -->
				<div class="holiday_input_con">
				<!-- 정기 휴무 -->
					<div class="select_wrapper form">
					<!-- 주 선택 -->
						<div class="select_box_con">
							<select>
								<option selected hidden="true" disabled>&nbsp;주 선택&nbsp;</option>
								<option>매주</option>
								<option>첫째 주</option>
								<option>둘째 주</option>
								<option>셋째 주</option>
								<option>넷째 주</option>
								<option>다섯째 주</option>
								<option>여섯째 주</option>
							</select>
						</div>
					<!-- 일 선택 -->
						<div class="day_selector_con">
							<div class="day_selector">
								<input type="checkbox" name="restDay">
								월
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay">
								화
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay">
								수
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay">
								목
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay">
								금
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay">
								토
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay">
								일
							</div>
						</div>
						
						<div class="day_select_btn btn">
							휴무 등록
						</div>
					</div>
					
				<!-- 저장된 정기 휴무일 표기 -->
					<ul class="h_schedule_con form">
						<li class="h_schedule_list">
					<!-- 내용 -->
					<!-- 1 -->
							<div class="h_schedule_context">
								<p class="scheduled_days">
									매월 
										<span class="h_week">[첫째 주]</span> |
										<span class="h_day">[일요일]</span>
										<span class="h_day">[화요일]</span>
									휴무
								</p>						
							</div>
							<div class="h_schedule_delete">
								<p>삭제</p>
							</div>
						</li>
					<!-- 2 -->
						<li class="h_schedule_list">
							<div class="h_schedule_context">
								<p class="scheduled_days">
									매월 
										<span class="h_week">[셋째 주]</span> |
										<span class="h_day">[월요일]</span>
										<span class="h_day">[목요일]</span>
										<span class="h_day">[금요일]</span>
										<span class="h_day">[토요일]</span>
									휴무
								</p>
							</div>
							<div class="h_schedule_delete">
								<p>삭제</p>
							</div>
						</li>
					<!-- 3 -->
						<li class="h_schedule_list">
							<div class="h_schedule_context">
								<p class="scheduled_days">
									매월 
										<span class="h_week">[다섯째 주]</span> |
										<span class="h_day">[월요일]</span>
										<span class="h_day">[토요일]</span>
									휴무
								</p>
							</div>
							<div class="h_schedule_delete">
								<p>삭제</p>
							</div>
						</li>
					</ul>

				<!-- 달력 -->
					<div id="calander" class="calendar form">
						<div class="calendar_selector_con">
						<!-- year(left) -->
							<div class="year_selector">
								<button class="calendar_btn" onclick="showMenu('years')">
									<span id="current-year"></span>
								</button>
								<div id="years" class="years" style="display: none;"></div>
							</div>
						<!-- month(right) -->
							<div class="month_selector">
								<button class="calendar_btn" onclick="showMenu('months')">
									<span id="current-month"></span>
								</button>
								<div id="months" class="months" style="display: none;"></div>
							</div>
						</div>

					<!-- date & day -->
						<div class="calendar_day_con">
						<!-- day of week -->
							<div class="day_of_week">
								<div class="day">일요일</div>
								<div class="day">월요일</div>
								<div class="day">화요일</div>
								<div class="day">수요일</div>
								<div class="day">목요일</div>
								<div class="day">금요일</div>
								<div class="day">토요일</div>
							</div>

						<!-- days -->
							<div id="calendar-days" class="days"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- </form> -->
			
			
		<!-- 임시 휴무 설정 -->
			<!-- </form> -->
			<div class="tmp_holiday">
				<!-- title -->
				<div class="content_title_con">
					<div>
						<span class="content_title">임시 휴무 설정</span> 
						<i class="far fa-question-circle" style="font-weight: 600">도움말</i>
					</div>
					<!-- button -->
					<div class="btn_con">
					<!-- 
						<div id="modify-holiday" class="btn format_btn">
							<div class="icon_con">
								<i class="fas fa-plus-square"></i>
							</div>
							<div class="btn_title">휴무 수정</div>
						</div>
					 -->
						<div id="complete-holiday" class="btn update_btn">
							<div class="icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="btn_title">휴무 등록</div>
						</div>
					</div>
				</div>
				
			<!-- context -->
				<div class="tmp_holiday_input_con">
				
				<!-- 기간 설정 -->
				<!-- 사유 작성 -->
					<div class="tmp_holiday_reason_con">

					<!-- <form> -->
						<div class="form">
							<!-- 제목 & 유형 -->
							<div class="reason_title">임시 휴무 기간 선택 및 사유 작성</div>

							<div class="set_day_range_con">
								<input id="startDay" type="date" name="startDay" pattern="\d{4}-\d{2}-\d{2}">
								<!-- <label for="startDay">시작 일</label> -->

								<!-- 화살표 -->
								<div class="date_arrow">
									<i class="fas fa-long-arrow-alt-right"></i>
								</div>
								<!-- to -->
								<input id="endDay" type="date" name="endDay" pattern="\d{4}-\d{2}-\d{2}">
								<!-- <label for="endDay">마지막 일</label> -->
							</div>
							<div id="date-error-msg" class="error_msg text_red"></div>

						<!-- 사유 -->
							<div class="text_area_con">
								<textarea class="text_area" cols="100" rows="30"></textarea>
							</div>
						<!-- 버튼 -->
							<button class="reason_btn btn">작성 완료</button>
						</div>
					<!-- </form> -->	
						
					</div>
					
				<!-- 임시 영업 중지 목록 -->
					<div class="tmp_holiday_list_con">
					<!-- <form> -->
						<div class="tmp_holiday_list form">
							
							<ul class="list_con">
							<!-- 필터링 -->
								<li class="list_filter">
									<ul class="list_filter_content">
										<li id="view_all" class="list_filter_content_item" onclick="pageReload()">
											전체보기
											<i class="fas fa-caret-down"></i>
										</li>
										<li id="view_recent" class="list_filter_content_item" onclick="sort('recent')">
											가까운 날짜 순
											<i class="fas fa-caret-down"></i>
										</li>
										<li id="view_old" class="list_filter_content_item" onclick="sort('late')">
											먼 날짜 순
											<i class="fas fa-caret-down"></i>
										</li>
										<li id="view_month" class="list_filter_content_item" onclick="openCalendar()">
											월 검색
											<i class="fas fa-calendar-alt"></i>
										</li>
									<!-- 월 선택 드랍다운 -->
										<li>
											<div id="month-selector" class="s_month_selector"></div>
										<li>
									</ul>
								</li>
							<!-- 리스트 -->
								<li id="schedule-container" class="list_content_con">
								
								<!-- sample 1 -->
									<ul class="list_content">
										<li class="period_con">
											<div class="period_view_default">
												<div class="list_start_day">2020-10-07</div>
												<div class="arrow">~</div>
												<div class="list_end_day">2019-04-06</div>
											</div>
											<div class="period_view_input">
												<input type="date" name="updateStartDay" pattern="\d{4}-\d{2}-\d{2}">
												<div class="arrow">~</div>
												<input type="date" name="updateEndDay" pattern="\d{4}-\d{2}-\d{2}">
											</div>
										</li>
										<li class="reason_con">
											<div class="reason_view_default">
												회장님 돌잔치합니다. 돌잡이 피죤 잡음
											</div>
											<input class="reason_view_input" type="text" name="updateReason" placeholder="휴무 사유를 적어주세요." maxlength="300">												
										</li>
										<li class="update_icon_con">
											<i class="fas fa-pen-square" onclick="updateSchedule(this)"></i>
										</li>
										<li class="cancle_icon_con">
											<i class="fas fa-times" onclick="cancleUpdate(this)"></i>
										</li>
										<li>
											<i class="fas fa-trash-alt" onclick="deleteSchedule(this)"></i>
										</li>
										<li class="complete_icon_con">
											<i class="fas fa-check-square" onclick="postSchedule(this)"></i>
										</li>
									</ul>
									
									
									
								<!-- sample 2 -->
									<ul class="list_content">
										<li class="period_con">
											<div class="period_view_default">
												<div class="list_start_day">2020-10-05</div>
												<div class="arrow">~</div>
												<div class="list_end_day">2020-11-06</div>
											</div>
											<div class="period_view_input">
												<input type="date" name="updateStartDay" pattern="\d{4}-\d{2}-\d{2}">
												<div class="arrow">~</div>
												<input type="date" name="updateEndDay" pattern="\d{4}-\d{2}-\d{2}">
											</div>
										</li>
										<li class="reason_con">
											<div class="reason_view_default">
												사업자 생일 파티로 임시 휴무합니다.
											</div>
											<input class="reason_view_input" type="text" name="updateReason" placeholder="휴무 사유를 적어주세요." maxlength="300">												
										</li>
										<li class="update_icon_con">
											<i class="fas fa-pen-square" onclick="updateSchedule(this)"></i>
										</li>
										<li class="cancle_icon_con">
											<i class="fas fa-times" onclick="cancleUpdate(this)"></i>
										</li>
										<li>
											<i class="fas fa-trash-alt" onclick="deleteSchedule(this)"></i>
										</li>
										<li class="complete_icon_con">
											<i class="fas fa-check-square" onclick="postSchedule(this)"></i>
										</li>
									</ul>
									
									
								<!-- sample 3 -->
									<ul class="list_content">
										<li class="period_con">
											<div class="period_view_default">
												<div class="list_start_day">2021-08-05</div>
												<div class="arrow">~</div>
												<div class="list_end_day">2021-08-06</div>
											</div>
											<div class="period_view_input">
												<input type="date" name="updateStartDay" pattern="\d{4}-\d{2}-\d{2}">
												<div class="arrow">~</div>
												<input type="date" name="updateEndDay" pattern="\d{4}-\d{2}-\d{2}">
											</div>
										</li>
										<li class="reason_con">
											<div class="reason_view_default">
												사장님이 돌아가셨습니다.
											</div>
											<input class="reason_view_input" type="text" name="updateReason" placeholder="휴무 사유를 적어주세요." maxlength="300">												
										</li>
										<li class="update_icon_con">
											<i class="fas fa-pen-square" onclick="updateSchedule(this)"></i>
										</li>
										<li class="cancle_icon_con">
											<i class="fas fa-times" onclick="cancleUpdate(this)"></i>
										</li>
										<li>
											<i class="fas fa-trash-alt" onclick="deleteSchedule(this)"></i>
										</li>
										<li class="complete_icon_con">
											<i class="fas fa-check-square" onclick="postSchedule(this)"></i>
										</li>
									</ul>
									
									
								</li>
							</ul>
							
							
							
						</div>
					<!-- </form> -->
					</div>
					
						
				</div>
			</div>
			<!-- </form> -->
		</div>
		<!-- </form> -->
	</section>

<!-- footer -->
	<%-- <%@ include file="../main/businessFooter.jsp" %> --%>

	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/interface.js"></script>
	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/calendar.js"></script>
	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/tmpHolidayButtons.js"></script>
	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/filter.js"></script>


</body>
</html>