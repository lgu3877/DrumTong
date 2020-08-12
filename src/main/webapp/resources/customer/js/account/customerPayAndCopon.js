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

function listup() {
    newRow = document.createElement("div");
    newRow.setAttribute("class", "pac_payLists");
    newRow.innerHTML =
        `<div class="pac_payCard_name">카드번호</div>
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