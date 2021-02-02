// 테이블 초기 레이아웃 (13, 13, 48, 10, 10 - %)
const thead = document.getElementById("item-list-thead");
const tbody = document.getElementById("item-list-tbody");
const ths = thead.getElementsByTagName("th");

for (let i = 0; i < ths.length; i++) {
	switch(i) {
	case 0:
		ths[i].style.width = "18%";
		break;
	case 1:
		ths[i].style.width = "18%";
		break;
	case 2:
		ths[i].style.width = "18%";
		break;
	case 3:
		ths[i].style.width = "18%";
		break;
	case 4:
		ths[i].style.width = "18%";
		break;
	case 5:
		ths[i].style.width = "10%";
		break;
	default:
		alert("설정된 항목 6개 초과");
	}
}