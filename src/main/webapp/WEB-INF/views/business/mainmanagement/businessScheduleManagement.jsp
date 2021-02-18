<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- selectEST.status 값을 status에 c:set 해줍니다 -->
<c:set var = "status" value="${selectEST.status}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- title -->
    <title>businessScheduleManagement :: Laundry</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- header css 처음 등록할 때 쓸 헤더입니다. ( status eq 'FAIL' )-->
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
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

	<!-- objects from DB -->
	<script type="text/javascript">
		let bscheduledays = ${bscheduledays};
		const holiday = bscheduledays.holiday; // holiday > 'Y' or 'N'
		delete bscheduledays.holiday; // holiday 삭제
		
		console.log(bscheduledays);
		console.log(holiday);
	</script>

</head>
<body>


	<!-- 	온라인 계약이 진행 중인 상태이면은 기본 헤더를 보여준다 -->
	<c:if test="${status eq 'FAIL' }">
		<%@ include file="../main/businessHeader.jsp" %>
	</c:if>
	
	<!-- side-header(navbar) -->
	<!-- 	온라인 계약이 수행되었다면 관리헤더와 관리서브메뉴를 보여준다. -->
	<c:if test="${status eq 'SUCCESS' }">
		<%@ include file="../main/businessSideHeader.jsp" %>
	</c:if>
	
	
	<!-- section -->
	<section>
	
	<!-- top-header(membership) -->
	<!-- 온라인 계약이 수행되었다면 관리헤더와 관리서브메뉴를 보여준다. -->
	<c:if test="${status eq 'SUCCESS' }">
		<%@ include file="../main/businessSubHeader.jsp" %>
	</c:if>
	
	
<!-- 	[750줄] 닫는 태그 세션의 상태가 FAIL이면 POST 형식   -->
<!-- 	SUCCESS이면 REST형식으로 처리해준다. -->
<!-- 	[전체 폼]에 대한 c:if문 -->

	<c:if test="${status eq 'FAIL' }">
			<form method="POST">
	</c:if>
		
	
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
					
					<!-- status 가 SUCCESS일때만 버튼이 생성된다. ( Rest를 위한 버튼 ) -->
					<c:if test="${status eq 'SUCCESS' }">
						<div id="complete-working-hour" class="btn update_btn">
							<div class="icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="btn_title">수정 완료</div>
						</div>
					</c:if>
					
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
						<!-- 토/일 선택 라디오버튼 -->
						<div class="checkbox_con">
<!-- 							<input id="weekday-only" type="checkbox" name="" value=""> -->
<!-- 							<button id="weekday-only-btn" class="checkBtn transparent" onclick="checkOption('weekday-only')" disabled>토요일 운영</button> -->
<!-- 							<input id="whole-week" type="checkbox" name="" value=""> -->
<!-- 							<button id="whole-week-btn" class="checkBtn transparent" onclick="checkOption('whole-week')" disabled>일요일 운영</button> -->
							
<!-- 							토일 선택 라디오버튼 [건욱] -->
							<input id="weekendBoth" type="radio" name="weekends" value="">
							<button id="weekendBoth-btn" class="checkBtn transparent" onclick="checkOption('weekendBoth')" disabled>토/일 운영</button>
							
							<input id="weekendSat" type="radio" name="weekends" value="">
							<button id="weekendSat-btn" class="checkBtn transparent" onclick="checkOption('weekendSat')" disabled>토요일만 운영</button>
							
							<input id="weekendSun" type="radio" name="weekends" value="">
							<button id="weekendSun-btn" class="checkBtn transparent" onclick="checkOption('weekendSun')" disabled>일요일만 운영</button>
						
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
								<input class="time_input hour" type="number" name="hour" max="24" placeholder="시">
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
								<input class="time_input hour" type="number" name="hour" max="24" placeholder="시">
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
								<input class="time_input hour" type="number" name="hour" max="24" placeholder="시">
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
								<input class="time_input hour" type="number" name="hour" max="24" placeholder="시">
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
								<input class="time_input hour" type="number" name="hour" max="24" placeholder="시">
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
								<input class="time_input hour" type="number" name="hour" max="24" placeholder="시">
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
					<!-- status 가 SUCCESS일때만 버튼이 생성된다. ( Rest를 위한 버튼 ) -->
					<c:if test="${status eq 'SUCCESS' }">
						<div id="complete-holiday" class="btn update_btn">
							<div class="icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="btn_title">수정 완료</div>
						</div>
					</c:if>
					</div>
				</div>

			<!-- input -->
				<div class="holiday_input_con">
				<!-- 정기 휴무 -->
					<div class="select_wrapper form">
					<!-- 주 선택 -->
						<div id="reg-holiday-week" class="select_box_con">
							<select name="restWeek">
								<option selected hidden="true" disabled>&nbsp;주 선택&nbsp;</option>
								<option value="allweek">매주</option>
								<option value="firstweek">첫째 주</option>
								<option value="secondweek">둘째 주</option>
								<option value="thirdweek">셋째 주</option>
								<option value="forthweek">넷째 주</option>
								<option value="fifthweek">다섯째 주</option>
								<option value="sixthweek">여섯째 주</option>
							</select>
						</div>
					<!-- 일 선택 -->
						<div id="reg-holiday-day" class="day_selector_con">
							<div class="day_selector">
								<input type="checkbox" name="restDay" value = "월">
								월
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay" value = "화">
								화
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay" value = "수">
								수
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay" value = "목">
								목
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay" value = "금">
								금
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay" value = "토">
								토
							</div>
							<div class="day_selector">
								<input type="checkbox" name="restDay" value = "일">
								일
							</div>
						</div>
						
						<!-- 휴뮤등록 버튼 -->
						<div class="day_select_btn btn" onclick="updateRegHoliday()">휴무등록 </div>
					</div>
					
				<!-- 저장된 정기 휴무일 표기 -->
					<div class="form">
						<ul id="reg-holiday-schedule" class="h_schedule_con"></ul>
					</div>
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
					 
					 <!-- status 가 SUCCESS일때만 버튼이 생성된다. ( Rest를 위한 버튼 ) -->
					<c:if test="${status eq 'SUCCESS' }">
						<div id="complete-holiday" class="btn update_btn">
							<div class="icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="btn_title">휴무 등록</div>
						</div>
					</c:if>
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
		
	<!-- [66줄] 여는 태그  세션의 상태가 FAIL이면 POST 형식   -->
	<!-- 	SUCCESS이면 REST형식으로 처리해준다. -->
	<!-- 	[전체 폼]에 대한 c:if문 -->
	<c:if test="${status eq 'FAIL' }">
	
	<!-- 전체 form submit -->
		<div>
			<input type="submit" value="계약 완료">
		</div>
	
	</form>
			
	</c:if>
		
		
	</section>

<!-- footer -->
	<%-- <%@ include file="../main/businessFooter.jsp" %> --%>
	
	<!-- global functions -->
	<script type="text/javascript">
		//랜덤 String 생성
		function generateRandomString(length) {
			let result = "";
			const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
			const charArray = characters.split("");
				
			for (let i = 0; i < length; i++) {
				result += charArray[Math.ceil(Math.random() * (characters.length - 1))];
			}
			
			// 동일한 난수가 생성되엇을 경우(로또 맞을 확률)
			if (document.getElementById(result)) {
				alert("축하드립니다. 17,067,655,527,413,216e+89의 확률을 뚫으셨습니다.");
				location.reload();
				return;
			}
			
			return result;
		}
	</script>
	
	<!-- 영업시간 -->
	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/interface.js"></script>
	
	<!-- 달력 -->
	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/calendar.js"></script>

	<!-- 임시휴무 -->
	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/tmpHolidayButtons.js"></script>
	
	<!-- 정기휴무 -->
	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/regularHoliday.js"></script>
	
	<!-- 필터 -->
	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/filter.js"></script>
	
	<!-- 업데이트 -->
	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/update.js"></script>
</body>
</html>