//function listup() {
//            newRow = document.createElement("div");
//            newRow.setAttribute("class", "pac_payLists");
//            newRow.innerHTML =
//                `<div class="pac_payCard_name">카드번호</div>
//                        <input class="pac_payCard_num1" type="text" value=""></input>
//                        -
//                        <input class="pac_payCard_num2" type="text" value=""></input>
//                        <button class="pac_payCard_add">확인</button>`
//
//            pac_payList = document.getElementById("pac_payList");
//            pac_payList.appendChild(newRow);
//}

function cardup() {
    newRow = document.createElement("div");
    newRow.setAttribute("class", "pac_payLists");
    newRow.innerHTML =
        `<div class="pac_payCard_name">신규 입력</div>
        	<select name="cardbank" class="pac_payCard_kind">
				<option value="신한">신한</option>
				<option value="현대">현대</option>
				<option value="하나">하나</option>
				<option value="우리">우리</option>
				<option value="국민">국민</option>
				<option value="농협">농협</option>
				<option value="롯데">롯데</option>
				<option value="기타">기타</option>
			</select>
            <input class="pac_payCard_num1" type="text" value=""></input>
            -
            <input class="pac_payCard_num2" type="text" value=""></input>
            <button class="pac_payCard_save" onclick="saveCard()">확인</button>`

    pac_payList = document.getElementById("pac_payList");
    pac_payList.appendChild(newRow);

}

function saveCard() {
    addList = document.querySelectorAll(".pac_payLists");
    console.log();

    for (i = 0; i < addList.length; i++) {
        if (addList[i].children[1].value === '' || addList[i].children[2].value === '') {
            addList[i].remove();
        }
    }
}