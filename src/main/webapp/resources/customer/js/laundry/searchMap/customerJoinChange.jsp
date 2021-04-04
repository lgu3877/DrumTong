<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
 
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>customerDrumtong :: customerJoinChange</title>
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet" type="text/css">
    <link rel="stylesheet" href="${cpath }/customer/css/customerStyle.css">
    <link rel="stylesheet" href="${cpath }/customer/css/account/customerJoinChange.css">
	
	<script type="text/javascript" src="${cpath }/customer/js/main/customerHeader.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	 
	<script type="text/javascript" src="${cpath }/customer/js/account/customerJoinChange.js"></script>
	
	<!-- 다음 주소 검색 script function -->
	<%@ include file="/resources/daumAddressSearch/daumAddressSearch.jsp" %>
	<!-- Axios script -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>

<body>

<%@ include file="../main/customer_Header.jsp"%>

<section class="section_Joinchange">
        <h1 class="join_mainName">개인정보 수정</h1>

        <article class="join_change">
            <div class="join_fo1">
                <div class="join_fo1_1" id="join_fo1_1"><img style="width: 200px; height: 150px;"></div>
                <form method="POST" class="join_fo1_2" enctype="multipart/form-data">
                    <input class="join_fo1_2_file" type="file" id="photoID" name="user" >
                    <input class="join_fo1_2_sub" type="button" id="submit" name="submit" value="저장" >
                    <input class="join_fo1_2_sub" type="button" id="delete" name="delete" value="삭제" >
                </form>
            </div>

            <form>
                <p class="join_name">아이디</p>
                <input class="join_inputbox" type="text" name="id" placeholder="ID" readonly value="${member.id }" >
            </form>
            <hr>

            <form id="updatePW" onsubmit="return newPwInputCreate();">
                <p class="join_name">비밀번호 <span id="passwordSpan" style="color:grey"> 현재 비밀번호를 입력하세요 </span></p>
                <input id="originalPw" class="join_inputbox" type="password" name="pw" placeholder="현재 비밀번호를 입력하세요" required >
                <button id="password_ok" class="join_button">수정</button>
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
                <input onchange="changeData('birth','birth')" class="join_inputbox" type="date" name="birthday" id="birth" placeholder="생년월일" value="${member.birth }" >
            </form>
            <hr>

            <form onsubmit="return false;">
                <p class="join_name">전화번호 <span id="phonenumSpan" style="color:grey;"> EX) 000-0000-0000</span></p>
                <input onkeyup="checkInput('phonenum', 'phonenum')" class="join_inputbox join_pnum" type="text" id="phonenum" placeholder="전화번호" value="${member.phonenum }" >
                <input class="join_button join_pum_ok" type="button" id="phonenum_ok" value="인증하기" 
                	onclick="changeData('phonenum','phonenum')">
            </form>
            <hr>


            <form onsubmit="return false;">
                <p class="join_name">이메일  <span id="emailSpan" style="color:grey;"> EX) abc123@naver.com</span></p>
                <input onkeyup="checkInput('email', 'email')" class="join_inputbox" type="email" name="email" id="email" placeholder="E-mail" value="${member.email }" >
                <input class="join_button join_pum_ok" type="button" id="email_ok" value="인증하기"
                	onclick="changeData('email','email')">
            </form>
            <hr>

            <form onsubmit="return false;">
                <p class="join_name">집 주소</p>
                <input class="join_inputbox join_joso" type="text" id="mainAddress1" name="email" placeholder="우편번호" readonly value="${member.mainaddress }" >
                <input class="join_button join_joso_ok" type="submit" name="joso_select" value="주소찾기" onclick="searchAddress(document.getElementById('mainAddress1'), document.getElementById('subAddress1'), null, null, null)" >
                <input class="join_inputbox" type="text" id="subAddress1" name="joso_realjoso" placeholder="상세주소" value="${member.detailaddress }" >
                <input class="join_button join_pum_ok" type="button" id="address_ok1" value="저장하기" 
                	onclick="changeDataAddress('mainaddress','detailaddress','1')">
            </form>
            <hr>

            <form onsubmit="return false;">
                <p class="join_name">배송지</p>
                <input class="join_inputbox join_joso" type="text" id="mainAddress2" name="email" placeholder="우편번호" readonly value="${member.mainreceiptaddress }" >
                <input class="join_button join_joso_ok" type="submit" name="joso_select" value="주소찾기" onclick="searchAddress(document.getElementById('mainAddress2'), document.getElementById('subAddress2'), document.getElementById('emdcode'), null, null)" >
                <input class="join_inputbox" type="text" id="subAddress2" name="joso_realjoso" placeholder="상세주소" value="${member.detailreceiptaddress }" >
                <input class="join_inputbox" type="hidden" id="emdcode" name="joso_emdcode">
                <input class="join_button join_pum_ok" type="button" id="address_ok2" value="저장하기" 
                	onclick="changeDataAddress_emd('mainreceiptaddress','detailreceiptaddress','emdcode','2')">
            </form>
            <hr>

            <!-- <div class="join_cmp">
                <input class="join_complete" type="submit" name="joso_complete" value="확인"></input>
            </div> -->

        </article>
    </section>

    <script>
    	function imgView(address){
    		img = document.querySelectorAll('div.join_fo1_1 img')[0];
    		if(address !== ''){
	    		img.src = 'https://drumtongbucket.s3.ap-northeast-2.amazonaws.com/' + address;
    		} else {
	    		img.src = address;
    		}
    	}
        function FileSubmit(cpath) {
            if (event.type === 'keypress' && event.key !== 'Enter') {
                return;
            }
            form = document.forms[0]; // 폼 안의 input3개 다 가져옴
            
        	formData = new FormData(form);
			if(form.children[0].files.length === 0){
				alert('새로운 이미지 파일이 없습니다.');
				return false;
			}
            console.log(form.children[0].files[0]);
            var axPost = async (form) => {
		        await axios.post(cpath + "/customer/account/customerJoinChange/rest/phontoID/", formData, {
					headers: {"Content-Type": `multipart/form-data`,}, 
				})
	
		        .then( (response) => {
		          if(response.data === true){
		                // 새 비밀번호, 새 비밀번호 확인을 입력하는 input 박스 2개 만들기
		            form.reset();
		            alert('정상적으로 변경되었습니다.');
		          } else{
		            alert('이미지가가 정상적으로 변경되지 않았습니다. 다시 시도해주세요');
		          }
		          return false;
		        });
		      }
		      axPost(form);
        }
        
        function FileDelete(event){
        	if (event.type === 'keypress' && event.key !== 'Enter') {
                return;
            }
        	var axGet = async () => {
        		await axios.get(cpath + '/customer/account/customerJoinChange/rest/deletePhontoID/')
        		
        		.then( (response) => {
        			if(response.data === true){
        				imgView('');
        				alert('프로필 이미지가 삭제되었습니다.');
        			} else{
        				alert('이미지가 정상적으로 삭제되지 않았습니다. 새로고침(F5) 후 다시 시도해주세요');
        			}
        		});
        	}
        	axGet();
        }

    </script>

    <script type="text/javascript">
        // 문서가 불러와지면 곧바로 실행 (onload="")
//         cpath = '${pageContext.request.contextPath}';
        cpath = '';
        console.log('cpath : ', '${pageContext.request.contextPath}');
        document.getElementById('submit').addEventListener('click', FileSubmit);
        document.getElementById('delete').addEventListener('click', FileDelete);

        document.getElementById('photoID').addEventListener('change', Preview);
        
        function Preview(){
        	photo = document.getElementById('photoID');
        	priview = document.getElementById('join_fo1_1').children[0];
        	
        	var img = new Image();		
    		img.src = URL.createObjectURL(photo.files[0]);
        	
    		img.onload = function() {
    			priview.setAttribute('src', img.src);
    		}
    		
    		
        }


    </script>

	<script>	// 영경 스크립트
		function newPwInputCreate(){
			pw = document.getElementById('originalPw').value;
			// 비밀번호가 일치하는지 체크하는 메서드 만들기
			
			var axPost = async (pw) => {
				ob = {
					"pw" : pw,
				}
		        await axios.post(cpath + '/customer/account/customerJoinChange/rest/pwCheck/', ob)
	
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
			newPwInput.setAttribute("id", "passwordInput");
			newPwInput.setAttribute("type", "password");
			newPwInput.setAttribute("name", "pw");
			newPwInput.setAttribute("placeholder", "새 비밀번호 입력");
			newPwInput.setAttribute("required", "required");
			newPwInput.setAttribute("onkeyup", "checkInput('password', 'passwordInput')");
			
			var newPwConfirmInput = document.createElement('input');
			newPwConfirmInput.setAttribute("class", "join_inputbox");
			newPwConfirmInput.setAttribute("id", "passwordInputConfirm");
			newPwConfirmInput.setAttribute("type", "password");
			newPwConfirmInput.setAttribute("name", "pwConfirm");
			newPwConfirmInput.setAttribute("placeholder", "새 비밀번호 재입력");
			newPwConfirmInput.setAttribute("required", "required");
			
			pwForm.appendChild(newPwInput);
			pwForm.appendChild(newPwConfirmInput);
			
			console.log(document.getElementById('passwordSpan'));
			document.getElementById('passwordSpan').innerHTML='비밀번호는 영문자 ,숫자 특수문자의 조합 7~15자리로';
			
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
			        await axios.post(cpath + '/customer/account/customerJoinChange/rest/Change/pw/', ob)
		
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
			
			
			document.getElementById('passwordSpan').innerHTML=' 현재 비밀번호를 입력하세요 ';
			document.getElementById('passwordSpan').style.color='grey';
		}
		
		function changeData(typeName, InputBoxId){ // type이름은 db 컬럼 이름이어야 하고, inputboxid는 값이 들어있는 id이어야 한다.
			InputBox = document.getElementById(InputBoxId);
			var axPost = async (InputBox) => {
				ob = {};
				ob[typeName] = InputBox.value;
				
		        await axios.post(cpath + '/customer/account/customerJoinChange/rest/Change/' + typeName + '/', ob)
	
		        .then( (response) => {
		          if(response.data === true){
		        	if(!typeName.includes('detail') && !typeName.includes('emdcode') )
		        		// address를 저장하는 방식이 세 번 나누어 저장되는데 세 번 다 경고문이 뜨지 않도록 설정해주기
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
		
		function changeDataAddress(type1, type2, n){
			changeData(type1, 'mainAddress'+n);
			changeData(type2, 'subAddress'+n);
		}
		
		function changeDataAddress_emd(type1, type2, type3, n){
			changeDataAddress(type1, type2, n);
			changeData(type3, 'emdcode');
		}
		
		function checkInput(type, InputId){
			var checkInputBox = document.getElementById(InputId);
			var inputButton = document.getElementById(type + "_ok");
			var boxRedSpan = document.getElementById(type + 'Span');
			console.log(inputButton);
			var regExp;
			switch(type){
				case "email":
					regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					break;
				case "phonenum":
					regExp = /^\d{3}-\d{3,4}-\d{4}$/;
					break;
				case "password":
					regExp = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
					break;
			};
			
			var value;
			
			if(regExp.test(checkInputBox.value) == false){
				checkInputBox.style.border='2px solid red';
				boxRedSpan.style.color='red';
				value='none';
			} else{
				checkInputBox.style.border='';
				boxRedSpan.style.color='grey';
				value='';
			}
			inputButton.style.display=value;
		}

    	imgView('${cLogin.profileimg}');
	</script>
	
<%@ include file="../main/customerFooter.jsp"%>

</body>
</html>