<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!-- calendar -->
    <div id="calander" class="calendar">
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
                <button class="calendar_btn" onclick="showMenu('months')")>
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
            <div id="calendar-days" class="days">

            </div>
        </div>
    </div>

	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/calendar.js"></script>


</body>
</html>