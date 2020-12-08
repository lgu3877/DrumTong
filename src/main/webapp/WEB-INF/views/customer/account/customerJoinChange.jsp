<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/customerHeader.jsp"%>
	<!-- Axios script -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<!-- 다음 주소 검색 script function -->
	<script>
	function searchAddress() {
        new daum.Postcode(
                {
                    oncomplete : function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                                && /[동|로|가]$/g.test(data.bname)) {
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                                && data.apartment === 'Y') {
                            extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                    + data.buildingName : data.buildingName);
                        }
                        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraRoadAddr !== '') {
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }
                        // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                        if (fullRoadAddr !== '') {
                            fullRoadAddr += extraRoadAddr;
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('mainAddress').value = fullRoadAddr; //5자리 새우편번호 사용
                        document.getElementById('subAddress').value = '';
                        
                    }
                }).open();
    }
	</script>
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
                <input class="join_inputbox" type="text" name="id" placeholder="ID" readonly value="${member.id }">
            </form>
            <hr>

            <form id="updatePW" onsubmit="return newPwInputCreate();">
                <p class="join_name">비밀번호</p>
                <input id="originalPw" class="join_inputbox" type="password" name="pw" placeholder="현재 비밀번호를 입력하세요" required>
                <button class="join_button">수정</button>
            </form>
            <hr>

            <form onsubmit="return changeData('name', 'name');">
                <p class="join_name">이름</p>
                <input class="join_inputbox" type="text" id="name" name="name" placeholder="이름" required value="${member.name }">
                <button class="join_button">수정</button>
            </form>
            <hr>

            <form>
                <p class="join_name">성별</p>
                <select onchange="changeData('genderboolean','gender')" class="join_inputbox join_gender" required id="gender">
                    <option value="M" ${member.genderboolean == 77 ? 'selected' : ''}>남성</option>
                    <option value="W" ${member.genderboolean == 87 ? 'selected' : ''}>여성</option>
                </select>
            </form>
            <hr>

            <form>
                <p class="join_name">생년월일</p>
                <input onchange="changeData('birth','birth')" class="join_inputbox" type="date" name="birthday" id="birth" placeholder="생년월일" value="${member.birth }">
            </form>
            <hr>

            <form onsubmit="return false;">
                <p class="join_name">전화번호</p>
                <input class="join_inputbox join_pnum" type="text" id="phonenum" placeholder="전화번호" value="${member.phonenum }">
                <input class="join_button join_pum_ok" type="button" id="phonemun_ok" value="인증하기" 
                	onclick="changeData('phonenum','phonenum')"/>
            </form>
            <hr>


            <form onsubmit="return false;">
                <p class="join_name">이메일</p>
                <input class="join_inputbox" type="email" name="email" id="email" placeholder="E-mail" value="${member.email }">
                <input class="join_button join_pum_ok" type="button" id="email_ok" value="인증하기"
                	onclick="changeData('email','email')"/>
            </form>
            <hr>

            <form onsubmit="return false;">
                <p class="join_name">주소</p>
                <input class="join_inputbox join_joso" type="text" id="mainAddress" name="email" placeholder="우편번호" readonly value="${member.mainaddress }">
                <input class="join_button join_joso_ok" type="submit" name="joso_select" value="주소찾기" onclick="searchAddress()"></input>
                <input class="join_inputbox" type="text" id="subAddress" name="joso_realjoso" placeholder="상세주소" value="${member.detailaddress }">
                <input class="join_button join_pum_ok" type="button" id="address_ok" value="저장하기" 
                	onclick="changeDataAddress()"/>
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

	<script>	// 영경 스크립트
		function newPwInputCreate(){
			pw = document.getElementById('originalPw').value;
			console.log("현재 비밀번호 : ", pw);
			// 비밀번호가 일치하는지 체크하는 메서드 만들기
			
			var axPost = async (pw) => {
				ob = {
					"pw" : pw,
				}
		        await axios.post('/drumtong/customer/account/customerJoinChange/rest/pwCheck/', ob)
	
		        .then( (response) => {
		          if(response.data === true){
		                // 새 비밀번호, 새 비밀번호 확인을 입력하는 input 박스 2개 만들기
		            alert('비밀번호가 일치합니다');
		            updatePW();
		            return false;
		          } else{
		            alert('비밀번호가 일치하지 않습니다');
		            document.getElementById('originalPw').value ='';
		          }
		        });
		      }
		      axPost(pw);
			
			return false;
		}
	
		function updatePW(){
			var pwForm = document.getElementById('updatePW');
			pwForm.removeChild(document.getElementById('originalPw'));
			
			var newPwInput = document.createElement('input');
			newPwInput.setAttribute("class", "join_inputbox");
			newPwInput.setAttribute("type", "password");
			newPwInput.setAttribute("name", "pw");
			newPwInput.setAttribute("placeholder", "새 비밀번호 입력");
			newPwInput.setAttribute("required", "required");
			
			var newPwConfirmInput = document.createElement('input');
			newPwConfirmInput.setAttribute("class", "join_inputbox");
			newPwConfirmInput.setAttribute("type", "password");
			newPwConfirmInput.setAttribute("name", "pwConfirm");
			newPwConfirmInput.setAttribute("placeholder", "새 비밀번호 재입력");
			newPwConfirmInput.setAttribute("required", "required");
			
			pwForm.appendChild(newPwInput);
			pwForm.appendChild(newPwConfirmInput);
			
			// 여기서부터 작업하기
			pwForm.onsubmit = function onsubmit(event) {return changePW(newPwInput, newPwConfirmInput);};
		}
		
		function changePW(newPwInput, newPwConfirmInput){
			pw = newPwInput.value;
			pwCf = newPwConfirmInput.value;
			if(pw == pwCf){
				var axPost = async (pw) => {
					ob = {
						"pw" : pwCf,
					}
			        await axios.post('/drumtong/customer/account/customerJoinChange/rest/Change/pw/', ob)
		
			        .then( (response) => {
			          if(response.data === true){
			                // 새 비밀번호, 새 비밀번호 확인을 입력하는 input 박스 2개 만들기
			            alert('정상적으로 변경되었습니다.');
			            returnInputPw(newPwInput, newPwConfirmInput);
			          } else{
			            alert('비밀번호가 정상적으로 변경되지 않았습니다. 다시 시도해주세요');
			            newPwInput.value = '';
			            newPwConfirmInput.value = '';
			          }
			          return false;
			        });
			      }
			      axPost(pw);
			} else {
				alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
			}
			
			return false;
		}
		
		function returnInputPw(newPwInput, newPwConfirmInput){
			var pwForm = document.getElementById('updatePW');
			pwForm.removeChild(newPwInput);
			pwForm.removeChild(newPwConfirmInput);
			
			var newPwInput = document.createElement('input');
			newPwInput.setAttribute("id", "originalPw");
			newPwInput.setAttribute("class", "join_inputbox");
			newPwInput.setAttribute("type", "password");
			newPwInput.setAttribute("name", "pw");
			newPwInput.setAttribute("placeholder", "현재 비밀번호를 입력하세요");
			newPwInput.setAttribute("required", "required");
			
			pwForm.appendChild(newPwInput);
			pwForm.onsubmit = function onsubmit(event) {return newPwInputCreate();};
		}
		
		function changeData(typeName, InputBoxId){
			InputBox = document.getElementById(InputBoxId);
			var axPost = async (InputBox) => {
				ob = {};
				ob[typeName] = InputBox.value;
				
				console.log(ob);
				console.log('testtest');
		        await axios.post('/drumtong/customer/account/customerJoinChange/rest/Change/' + typeName + '/', ob)
	
		        .then( (response) => {
		          if(response.data === true){
		        	if(typeName!='mainaddress')
		            	alert('정상적으로 변경되었습니다.');
		          } else{
		            alert('정상적으로 변경되지 않았습니다. 다시 시도해주세요');
		            InputBox.value = '';
		          }
		          return false;
		        });
	      	}	
		    axPost(InputBox);
		    return false;
		}
		
		function changeDataAddress(){
			changeData('mainaddress', 'mainAddress');
			changeData('detailaddress', 'subAddress');
		}
	</script>
	
<%@ include file="../main/customerFooter.jsp"%>