var currentMonth = document.getElementById('current-year-month');
var calendarBody = document.getElementById('calendar-body');

// today & first day
var today = new Date();
var firstDay = new Date(today.getFullYear(), today.getMonth(), 1);

// arrays
var dayList = [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ];
var monthList = [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
var leapYearDays = [ 31, 29, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
var notLeapYearDays = [31, 28, 30, 31, 30, 31, 31, 30, 31, 30, 31];

var calendarStart = firstDay;
var calendarYear;

// leap year check
if (firstDay.getFullYear() % 4 === 0) {
	calendarYear = leapYearDays;
} else {
	calendarYear = notLeapYearDays;
}

//var clickedDate = document.getElementById(today.getDate());
//clickedDate.classList('active');

// button event
var prevBtn = document.getElementById('prev');
var nextBtn = document.getElementById('next');
prevBtn.addEventListener('click', prev);
nextBtn.addEventListener('click', next);

//var tdGroup = [];


// create calendar
function showCalendar() {
	let monthCnt = 100;
	let cnt = 1;
	
	for (var i = 0; i < 6; i++) {
		
		var $tr = document.createElement('tr');
		$tr.setAttribute('id', monthCnt);
		
		for (var j = 0; j < 7; j++) {
			if (i === 0 && j < firstDay.getDay() || cnt > calendarYear[firstDay.getMonth()]) {
				var $td = document.createElement('td');
				$tr.appendChild($td);
			} else {
				var $td = document.createElement('td');
				$td.textContent = cnt;
				$td.setAttribute('id', cnt);
				$tr.appendChild($td);
				cnt++;
			}
		}
		monthCnt++;
		calendarBody.appendChild($tr);
	}
	document.getElementById('current-year-month').innerHTML 
		= "<span>" + firstDay.getFullYear() + ". " + (firstDay.getMonth() + 1) + "</span>";
}


// remove calendar
function removeCalender() {
	let catchTr = 100;
	for (var i = 10; i < 106; i++) {
		var $tr = document.getElementById(catchTr);
		$tr.remove();
		catchTr++;
	}
}


// previous month
function prev() {
	// If previous month becomes last December
	if(firstDay.getMonth() === 1) {
		firstDay = new Date(first.getFullYear()-1, 12, 1);
		calendarStart = firstDay;
		
		if(calendarStart.getFullYear() % 4 === 0) {
			calendarYear = leapYearDays;
		} 
		else {
			calendarYear = notLeapYearDays;
		}
	} 
	// in the same year
	else {
		firstDay = new Date(firstDay.getFullYear(), firstDay.getMonth()-1, 1);
		calendarStart = firstDay;
	}
	document.getElementById('current-year-month').innerHTML 
		= "<span>" + firstDay.getFullYear() + ". " + (firstDay.getMonth() - 1) + "</span>";

	removeCalender()
	showCalendar();
	
//	clickedDate = document.getElementById(calendarStart.getDate());
//	clickedDate.classList.add('active');
//	clickStart();
//	reshowingList();
}

// next month
function next() {
	// If previous month becomes last December
	if(firstDay.getMonth() === 12) {
		firstDay = new Date(first.getFullYear()+1, 12, 1);
		calendarStart = firstDay;
		
		if(calendarStart.getFullYear() % 4 === 0) {
			calendarYear = leapYearDays;
		} 
		else {
			calendarYear = notLeapYearDays;
		}
	} 
	// in the same year
	else {
		firstDay = new Date(firstDay.getFullYear(), firstDay.getMonth()+1, 1);
		calendarStart = firstDay;
	}
	document.getElementById('current-year-month').innerHTML 
		= "<span>" + firstDay.getFullYear() + ". " + (firstDay.getMonth() + 1) + "</span>";

	removeCalender()
	showCalendar();
	
//	clickedDate = document.getElementById(calendarStart.getDate());
//	clickedDate.classList.add('active');
//	clickStart();
//	reshowingList();
}

showCalendar();