// 현재 날짜, 년, 월, 일
const today = new Date(); // 날짜
const currentYear = today.getFullYear(); // 년
const currentMonth = today.getMonth() + 1; // 월
const currentDate = today.getDate(); // 일
// 0 ~ 6 (일요일 ~ 토요일)
const currentDay = today.getDay(); // 요일

// (윤)년, 월, 일
const months = [
  "1월",
  "2월",
  "3월",
  "4월",
  "5월",
  "6월",
  "7월",
  "8월",
  "9월",
  "10월",
  "11월",
  "12월",
];

// 현재 년도 설정
document.getElementById(
  "current-year"
).innerHTML = `<span id="year-value">${currentYear}</span> <i class="fas fa-angle-down"></i>`;

// 현재 월 설정
document.getElementById(
  "current-month"
).innerHTML = `<span id="month-value">${currentMonth}</span> <i class="fas fa-angle-down"></i>`;

// dropdown years
function createYears() {
  const startYear = currentYear;
  const endYear = currentYear + 3;

  for (let i = startYear; i < endYear; i++) {
    const yearDiv = document.createElement("div");
    yearDiv.innerHTML = i;
    yearDiv.classList.add("dropdown_item");

    // 옵션에서 '년' 클릭시 달력 재구성
    yearDiv.onclick = () => {
      document.getElementById("calendar-days").innerHTML = "";

      const selectedMonth = document.getElementById("month-value").innerText;
      document.getElementById("year-value").innerText = i;

      showMenu("years");
      loadDays(i, selectedMonth, currentDate);
    };

    document.getElementById("years").appendChild(yearDiv);
  }
}

// dropdown months
function createMonths() {
  for (let i = 0; i < months.length; i++) {
    const monthDiv = document.createElement("div");
    monthDiv.innerHTML = months[i];
    monthDiv.classList.add("dropdown_item");

    // 옵션에서 '월' 클릭시 달력 재구성
    monthDiv.onclick = () => {
      document.getElementById("calendar-days").innerHTML = "";

      const selectedYear = document.getElementById("year-value").innerText;
      document.getElementById("month-value").innerText = i + 1;

      showMenu("months");
      loadDays(selectedYear, i + 1, currentDate);
    };

    document.getElementById("months").appendChild(monthDiv);
  }
}

// dropdown 이벤트 > open & close
function showMenu(id) {
  //   console.log(document.getElementById("years"));
  const dropdown = document.getElementById(id).style;

  if (dropdown.display === "none") {
    dropdown.display = "block";
  } else {
    dropdown.display = "none";
  }
}

// 날짜 구성 > 출력
function loadDays(year, month, day) {
  const lastDate = new Date(year, month, 0).getDate();
  const prevLastDate = new Date(year, month - 1, 0).getDate();
  const startDay = new Date(year, month - 1, 1).getDay();
  //   const firstdate = new Date(year, month - 1, 1).getDate();
  //   const prevLastDay = new Date(year, month - 1, 0).getDay();

  //   console.log(`현재 ${year}년 ${month}월`);
  //   console.log(`시작 일: ${firstdate}`);
  //   console.log(`마지막 일: ${lastDate}`);
  //   console.log(`지난달 마지막 일: ${prevLastDate}`);
  //   console.log(`지난달 마지막 요일: ${prevLastDay}`);
  //   console.log(`시작 요일: ${swipeDay(startDay)}`);

  let currentCount = 0;
  let lastCount = 0;

  // 캘릭터 생성 ( 6주 > 7일 )
  for (let week = 0; week < 6; week++) {
    const weekDiv = document.createElement("div");
    weekDiv.className = "week";

    // 첫 주(지난 달 마지막까지)
    if (week === 0) {
      for (let day = startDay - 1; day >= 0; day--) {
        const date = document.createElement("div");
        date.classList.add("lastDays");
        date.innerHTML = prevLastDate - day;

        weekDiv.appendChild(date);
      }

      for (let day = startDay; day < 7; day++) {
        const date = document.createElement("div");
        date.classList.add("currentDays");
        date.innerHTML = ++currentCount;

        weekDiv.appendChild(date);
      }
    }

    // 둘째 주 ~ 마지막
    else {
      for (let day = 0; day < 7; day++) {
        if (currentCount < lastDate) {
          const date = document.createElement("div");
          date.classList.add("currentDays");
          date.innerHTML = ++currentCount;

          weekDiv.appendChild(date);
        } else {
          const date = document.createElement("div");
          date.classList.add("nextDays");
          date.innerHTML = ++lastCount;
          weekDiv.appendChild(date);
        }
      }
    }

    document.getElementById("calendar-days").appendChild(weekDiv);
  }
}

createYears();
createMonths();
loadDays(currentYear, currentMonth, currentDate);

// 요일
// function swipeDay(dayIndex) {
//   switch (dayIndex) {
//     case 0:
//       return "일요일";
//     case 1:
//       return "월요일";
//     case 2:
//       return "화요일";
//     case 3:
//       return "수요일";
//     case 4:
//       return "목요일";
//     case 5:
//       return "금요일";
//     case 6:
//       return "토요일";
//     default:
//       alert("잘못된 입력");
//   }
// }

// 마지막 날짜 반환
// function getLastDate(year, month) {
//   return new Date(year, month + 1).getDate();
// }
