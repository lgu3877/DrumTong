<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>

<section class="section_Joinchange">
        <h1 class="join_mainName">개인정보 수정</h1>

        <article class="join_change">
            <div class="join_fo1">
                <div class="join_fo1_1" id="join_fo1_1"></div>
                <form method="POST" class="join_fo1_2" enctype="multipart/form-data">
                    <input class="join_fo1_2_file" type="file" name="user">
                    <input class="join_fo1_2_sub" type="button" id="submit" name="submit" value="추가">
                </form>
            </div>

            <form>
                <p class="join_name">아이디</p>
                <input class="join_inputbox" type="text" name="id" placeholder="ID" required>
            </form>
            <hr>

            <form>
                <p class="join_name">비밀번호</p>
                <input class="join_inputbox" type="password" name="password" placeholder="password" required>
                <button class="join_button">수정</button>
            </form>
            <hr>

            <form>
                <p class="join_name">이름</p>
                <input class="join_inputbox" type="text" name="name" placeholder="이름" required>
                <button class="join_button">수정</button>
            </form>
            <hr>

            <form>
                <p class="join_name">성별</p>
                <select class="join_inputbox join_gender" required>
                    <option value="">선택</option>
                    <option value="man">남성</option>
                    <option value="woman">여성</option>
                </select>
            </form>
            <hr>

            <form>
                <p class="join_name">생년월일</p>
                <input class="join_inputbox" type="date" name="birthday" placeholder="생년월일">
            </form>
            <hr>

            <form>
                <p class="join_name">전화번호</p>
                <input class="join_inputbox join_pnum" type="text" id="phonenum" placeholder="전화번호">
                <input class="join_button join_pum_ok" type="button" id="phonemun_ok" value="인증하기"
                    onclick="phonemunok()"></input>
            </form>
            <hr>


            <form>
                <p class="join_name">이메일</p>
                <input class="join_inputbox" type="email" name="email" placeholder="E-mail">
            </form>
            <hr>

            <form>
                <p class="join_name">주소</p>
                <input class="join_inputbox join_joso" type="text" name="email" placeholder="우편번호">
                <input class="join_button join_joso_ok" type="submit" name="joso_select" value="주소찾기"></input>
                <input class="join_inputbox" type="text" name="joso_realjoso" placeholder="상세주소">
            </form>
            <hr>

            <!-- <div class="join_cmp">
                <input class="join_complete" type="submit" name="joso_complete" value="확인"></input>
            </div> -->

        </article>
    </section>

    <script>
        function FileSubmit(event) {
            if (event.type === 'keypress' && event.key !== 'Enter') {
                return;
            }
            form = document.forms[0]; // 폼 안의 input3개 다 가져옴
            console.log(form);

            const request = new XMLHttpRequest();
            request.open("POST", cpath + "/customer/account/customerJoinChange/", true); // 비동기식 처리(true)
            
            formData = new FormData(document.forms[0]);
            request.onreadystatechange = ajaxFileEvent;
            request.send(formData);
        }

        function ajaxFileEvent() {
            if (this.readyState === 4 && this.status === 200) {
                resultData = JSON.parse(this.response);
                h3 = document.createElement('h3');
                h3.innerHTML = resultData.name; // 이름 불러오는 코드
                img = document.createElement('img');
                img.src = cpath + "/img/" + resultData.image;

                document.getElementById('join_fo1_1').appendChild(h3);
                document.getElementById('join_fo1_1').appendChild(img);
            }
        }
    </script>

    <script type="text/javascript">
        // 문서가 불러와지면 곧바로 실행 (onload="")
        cpath = '${pageContext.request.contextPath}';
        document.getElementById('submit').addEventListener('click', FileSubmit);
    </script>
    
<%@ include file="../main/customerFooter.jsp"%>