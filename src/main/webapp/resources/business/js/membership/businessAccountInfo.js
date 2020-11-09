 
  // origininput이라는 클래스를 이용하여 수정 버튼의 스타일 생성
  var origininput = document.querySelectorAll("input.origininput");
   
  for (i = 0; i < origininput.length; i++) {
          origininput[i].setAttribute("type", "button");
          origininput[i].setAttribute("value", "수정");
          origininput[i].setAttribute("onclick", "changeInput(this)");
  }


   // 수정 버튼 클릭시
   // 입력 input 태그가 활성화됨
   // 입력 및 취소 버튼 활성화됨
   function changeInput(obj) {
      
      var inputdiv = obj.parentNode;
      var inputid = inputdiv.children[0].id;
      inputdiv.children[0].readOnly = false;
      inputdiv.children[0].value = '';
      inputdiv.removeChild(inputdiv.children[2]);		// 수정 버튼 삭제 시켰음
      
      var newdiv = document.createElement('div');
      newdiv.setAttribute("class", "newdiv");
      
      var submit = document.createElement('input');
      submit.setAttribute("type", "button");
      submit.setAttribute("value", "입력");
      submit.setAttribute("class", "newinput");
      submit.setAttribute("name", inputid)
      submit.setAttribute("onclick", "inputData(this)");
      
      newdiv.appendChild(submit);

      var cancle = document.createElement('input');
      cancle.setAttribute("type", "button");
      cancle.setAttribute("value", "취소");
      cancle.setAttribute("class", "newinput");
      cancle.setAttribute("name", inputdiv.children[1].value);		// hidden 이 가지고 있는 value 값을 'name' 으로 저장 -> 취소 누르면 이 name 값을 원래 자리로 반환
      cancle.setAttribute("onclick", "cancle(this)");
      newdiv.appendChild(cancle);
      
      
      switch (inputdiv.children[0].id) {
      case 'genderboolean':
         genderbooleanCreate(inputdiv, inputdiv.children[0].id);
         break;
      case 'phone':
         phonenumCreate(inputdiv);
		 submit.setAttribute('onclick', '');
         break;
      case 'address':
         addressCreate(inputdiv, inputdiv.children[0].id);
         break;
      case 'inputemail':
         emailCreate(inputdiv);
         submit.setAttribute('onclick', '');
         break;
      case 'inputcrn':
         delegatecrnCreate(inputdiv);
         submit.setAttribute('onclick', '');
       break;
      case 'pw':
         submit.setAttribute('type', 'submit');
         submit.setAttribute('onclick', '');
		 inputdiv.children[0].placeholder = '비밀번호를 입력바랍니다';
         break;
      default:
         break;
      }
      
      inputdiv.appendChild(newdiv);
   }
   
   
   // 비동기식 입력값 전달
   function inputData(obj) {
   // anx 비동기식으로 작동시키도록 하자 -> oblur
   
   const whereparam = document.getElementById("BPERSONID");
   let div = (obj.parentNode).parentNode;
   let inputChange = div.children[0];


        const axPost = async (ob) => {   // async : 비동기 실행 함수
          await axios.post('/drumtong/business/membership/rest/', ob)
          // 정상
     		.then( (response) => {
            const data = response.data;
            if(data === true){  
           		axcancle(obj, inputChange.value);
            }
            else if(data === false){ console.log('responsedata2 실행'); }            
           })
        }
        const axPostAddress = async (ob) => {   // async : 비동기 실행 함수
          await axios.post('/drumtong/business/membership/rest/', ob)
          // 정상
     		.then( (response) => {
           })
        }
   
   switch (div.children[0].id) {
      case 'genderboolean':
         inputChange = div.querySelector('select');
         break;
      case 'address':		// address 는 비동기식으로 보내야 하는 객체가 두가지인데다 입력 후 반환하는 값은 '메인 주소 + 상세 주소' 값이어야 한다
	 	 inputChange = div.children[2].children[0];
		 let ob1={
		   'fieldname': inputChange.name,
           'paramdata': inputChange.value,
           'wheredata': whereparam.id,
           'whereparam': whereparam.value,
         };
	 	 var inputChange2 = div.children[2].children[2];
		 let ob2={
			'fieldname': inputChange2.name,
           'paramdata': inputChange2.value,
           'wheredata': whereparam.id,
           'whereparam': whereparam.value,
         };
		 axPostAddress(ob1);
		 axPostAddress(ob2);
				
    	 axcancle(obj, inputChange.value + ' ' + inputChange2.value );
		
         break;
      case 'phone':
	  case 'inputcrn':
	  case 'inputemail':
		 inputChange = div.children[2].children[0];
	 break;
      default:
         break;
      }
   
   if(div.children[0].id != 'address') {
   let ob={
          'fieldname': inputChange.name,
           'paramdata': inputChange.value,
           'wheredata': whereparam.id,
        'whereparam': whereparam.value,
      };      
          axPost(ob);
         
   }
   }
   
   // axious 로 입력하고 난 이후
   // '수정' 버튼을 다시 활성화시키고, 입력한 값을 원래 보기 위치에 나타내야 함
   function axcancle(obj, axReturn) {
      var inputdiv = obj.parentNode.parentNode;

      inputdiv.children[0].readOnly = true;
      inputdiv.children[0].value = axReturn;
      inputdiv.removeChild(inputdiv.children[2]);
      
      var origininput = document.createElement('input');
      origininput.setAttribute("type", "button");
      origininput.setAttribute("value", "수정");
      origininput.setAttribute("onclick", "changeInput(this)");
      origininput.setAttribute("class", "origininput");
      
      switch (inputdiv.children[0].id) {
	  case 'pw':
      case 'phone':
	  case 'inputemail':
	  case 'inputcrn':
	  case 'address':
         axspecialcancle(inputdiv, axReturn);
         break;
      case 'genderboolean':
         if(axReturn === 'W')
            axReturn = '여성';
         else
            axReturn = '남성';            
         axspecialcancle(inputdiv, axReturn);
         break;
      default:
         break;
      }
      
      inputdiv.querySelector('input[type="hidden"]').value = axReturn;
      inputdiv.appendChild(origininput);      
   }
   
      
   // 취소 버튼 클릭시
   // input[type=text] 태그 readonly 상태로 변환
   function cancle(obj) {
      var inputdiv = obj.parentNode.parentNode;
      inputdiv.children[0].readOnly = true;
      inputdiv.children[0].value = inputdiv.children[2].children[1].name;	// '수정' -> '취소' 입력 버튼에 저장된 name 으로써 원래 hidden에 있었던 value
      inputdiv.removeChild(inputdiv.children[2]);
      
      var origininput = document.createElement('input');
      origininput.setAttribute("type", "button");
      origininput.setAttribute("value", "수정");
      origininput.setAttribute("onclick", "changeInput(this)");
      origininput.setAttribute("class", "origininput");
      
      switch (inputdiv.children[0].id) {
      case 'genderboolean':
      case 'phone':
      case 'address':
      case 'inputemail':
      case 'inputcrn':
         specialcancle(inputdiv);
         break
      case 'pw':
         inputdiv.children[0].value = '';
         inputdiv.children[0].placeholder = '비밀번호';
         break
      default:
         break;
      }            
      inputdiv.appendChild(origininput);      
   }
   
   // 성별 쪽 입력란 활성화
   function genderbooleanCreate(inputdiv, id) {
      inputdiv.children[0].style.display = 'none';
   
      var select = document.createElement('select');
      select.setAttribute("name", id);
      select.setAttribute("id", id);
      select.setAttribute("class", "input");
      
      var option1 = document.createElement('option');
      var option2 = document.createElement('option');
      option1.setAttribute("value","M");
      option2.setAttribute("value","W");
      option1.innerHTML = '남성';
      option2.innerHTML = '여성';
      
      select.appendChild(option1);
      select.appendChild(option2);
      
      inputdiv.appendChild(select);
      
   }
   
   // 휴대폰 번호 입력란 활성화
   function phonenumCreate(inputdiv) {
      inputdiv.children[0].style.display = 'none';
      
      var div = document.createElement('div');
      div.setAttribute("class", "input");
      
      var input1 = document.createElement('input');
      input1.setAttribute("type", "text");
      input1.setAttribute("name", "phonenum");
      input1.setAttribute("id", "phonenum");
      input1.setAttribute("placeholder", "- 을 넣어주세요");
      input1.setAttribute("class", "phonenum");
      
      var input2 = document.createElement('input');
      input2.setAttribute("type", "button");
      input2.setAttribute("id", "checkphone");
      input2.setAttribute("value", "인증하기");
      input2.setAttribute("onclick", "phoneCheck()");
      input2.setAttribute("class", "certification");
      
      var ul = document.createElement('ul');
      var li1 = document.createElement('li');
      var li2 = document.createElement('li');
      
      li1.innerHTML = "통신사에 따라 최대 1분까지 소요될 수 있습니다.";
      li2.innerHTML = "인증번호가 도착하지 않을 경우 '인증번호 재전송'을 눌러주세요.";
      
      ul.appendChild(li1);
      ul.appendChild(li2);
      
      div.appendChild(input1);
      div.appendChild(input2);
      div.appendChild(ul);
      
      inputdiv.appendChild(div);
   }
   
   
   // 이메일 입력란 활성화
   function emailCreate(inputdiv) {
      inputdiv.children[0].style.display = 'none';
      
      var div = document.createElement('div');
      div.setAttribute("class", "input");
      
      var input1 = document.createElement('input');
      input1.setAttribute("type", "text");
      input1.setAttribute("name", "email");
      input1.setAttribute("id", "email");
      input1.setAttribute("maxlength", "50");
      input1.setAttribute("placeholder", "이메일 주소를 입력하세요");
      input1.setAttribute("class", "email");
      
      var input2 = document.createElement('input');
      input2.setAttribute("type", "button");
      input2.setAttribute("id", "checkemail");
      input2.setAttribute("value", "인증하기");
      input2.setAttribute("onclick", "emailCheck(this)");
      input2.setAttribute("class", "certification2");
      
      div.appendChild(input1);
      div.appendChild(input2);
            
      inputdiv.appendChild(div);
   }
   
   // 사업자번호 입력 활성화
   function delegatecrnCreate(inputdiv) {
      inputdiv.children[0].style.display = 'none';
      
      var div = document.createElement('div');
      div.setAttribute("class", "input");
      
      var input1 = document.createElement('input');
      input1.setAttribute("type", "text");
      input1.setAttribute("name", "delegatecrn");
      input1.setAttribute("id", "delegatecrn");
      input1.setAttribute("placeholder", "-를 포함하여 입력하세요");
      input1.setAttribute("class", "delegatecrn");
      
      var input2 = document.createElement('input');
      input2.setAttribute("type", "button");
      input2.setAttribute("id", "checkemail");
      input2.setAttribute("value", "인증하기");
      input2.setAttribute("onclick", "delegatecrnCheck()");
      input2.setAttribute("class", "certification2");
      
      div.appendChild(input1);
      div.appendChild(input2);
            
      inputdiv.appendChild(div);
   }
   
   
   // 주소 입력란 활성화
   function addressCreate(inputdiv, id) {
      inputdiv.children[0].style.display = 'none';
      
      var div = document.createElement('div');
      div.setAttribute("class", "input");
      
      var input1 = document.createElement('input');
      input1.setAttribute("type", "text");
      input1.setAttribute("name", "mainaddress");
      input1.setAttribute("id", "mainaddress");
	  input1.readOnly = true;
      input1.setAttribute("placeholder", "우편번호");
      input1.setAttribute("class", "mainaddress");
      
      
      var input2 = document.createElement('input');
      input2.setAttribute("type", "button");
      input2.setAttribute("value", "주소찾기");
      input2.setAttribute("onclick", "searchAddress()");
      input2.setAttribute("class", "search");
      
      var input3 = document.createElement('input');
      input3.setAttribute("type", "text");
      input3.setAttribute("name", "detailaddress");
      input3.setAttribute("id", "detailaddress");
      input3.setAttribute("maxlength", "25");
      input3.setAttribute("placeholder", "나머지 주소를 입력하세요");
      input3.setAttribute("class", "detailadress");
      
      div.appendChild(input1);
      div.appendChild(input2);
      div.appendChild(input3);
      
      inputdiv.appendChild(div);
   }
   

   // 성별, 주소, 휴대폰번호 입력란 -> 입력란이 다른 것들과 다름
   // 따라서, 취소 버튼도 다르게 생성함
   function specialcancle(inputdiv) {
      inputdiv.children[0].style.display = '';
      inputdiv.children[0].value = inputdiv.children[1].value;
      inputdiv.removeChild(inputdiv.children[2]);
   }

   // axious 입력 후 원래 상태로 되돌리기 위한 기능
   function axspecialcancle(inputdiv, axReturn) {
      inputdiv.children[0].style.display = '';
      inputdiv.children[0].value = axReturn;
      inputdiv.removeChild(inputdiv.children[2]);
   }
   
   // 주소 찾기
   function searchAddress() {
        new daum.Postcode(
                {
                    oncomplete : function(data) {
                        var fullRoadAddr = data.roadAddress;
                        var extraRoadAddr = '';

                        if (data.bname !== ''
                                && /[동|로|가]$/g.test(data.bname)) {
                            extraRoadAddr += data.bname;
                        }
                        if (data.buildingName !== ''
                                && data.apartment === 'Y') {
                            extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                    + data.buildingName : data.buildingName);
                        }
                        if (extraRoadAddr !== '') {
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }
                        if (fullRoadAddr !== '') {
                            fullRoadAddr += extraRoadAddr;
                        }

                        document.getElementById('mainaddress').value = fullRoadAddr; //5자리 새우편번호 사용
                    }
                }).open();
    }

  // 휴대폰 인증
  function phoneCheck() {
        var regExp = /^\d{3}-\d{3,4}-\d{4}$/;

        const phonenum = document.getElementById('phonenum').value;
		var submit = document.getElementById('phonenum').parentNode.parentNode.querySelector('input[value="입력"]');
		
        if (phonenum === '') {
        	alert('전화번호를 입력부탁드립니다');
        }

        else if (regExp.test(phonenum) === false) {
          	alert('000-0000-0000 양식으로 입력바랍니다')
          	return false;
        } 
        else if(regExp.test(phonenum) === true ) {
        	alert('인증 완료!');
          	document.getElementById('phonenum').readOnly = true;
          	document.getElementById('phonenum').style.backgroundColor = 'grey';
			submit.setAttribute('onclick','inputData(this)');
           	return true;
        }
      }

  // 이메일 인증
  function emailCheck(obj) {
        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        const email = document.getElementById('email').value;
		var submit = document.getElementById('email').parentNode.parentNode.querySelector('input[value="입력"]');
		var pkemail = obj.parentNode.parentNode.querySelector('input[type="hidden"]').value

        if (email === '') {
         	alert('이메일을 입력부탁드립니다');
        }

        else if (regExp.test(email) === false) {
         	alert('-----@------.com 양식으로 입력바랍니다')
          	return false;
        } 
        else if(regExp.test(email) === true ) {
			if (email === pkemail) {
				alert('기존에 사용중인 이메일 주소입니다');
				return false;
			}				
        	alert('인증 완료!');
          	document.getElementById('email').readOnly = true;
          	document.getElementById('email').style.backgroundColor = 'grey';
			submit.setAttribute('onclick','inputData(this)');
          	return true;
        }
      }

  // 사업자번호 인증
  function delegatecrnCheck() {
        var regExp = /^\d{3}-\d{2}-\d{5}$/;

        const delegatecrn = document.getElementById('delegatecrn').value;
	    var submit = document.getElementById('delegatecrn').parentNode.parentNode.querySelector('input[value="입력"]');

        if (delegatecrn === '') {
         	alert('사업자번호를 입력부탁드립니다')
        }

        else if (regExp.test(delegatecrn) === false) {
         	alert('000-00-00000 양식으로 입력바랍니다')
          	return false;
        } 
        else if(regExp.test(delegatecrn) === true ) {
        	alert('인증 완료!');
          	document.getElementById('delegatecrn').readOnly = true;
          	document.getElementById('delegatecrn').style.backgroundColor = 'grey';
		  	submit.setAttribute('onclick','inputData(this)');
          	return true;
      }
}

	function newpw() {
		var whereparam = document.getElementById('BPERSONID');
		var id = document.getElementById('id');
		var pw = document.getElementById('pw');
		
		let ob={
		   'fieldname': pw.name,
           'paramdata': pw.value,
           'wheredata': whereparam.id,
           'whereparam': whereparam.value,
		   'id': id.value,            
      	};

        const axPost = async (ob) => {   // async : 비동기 실행 함수
          await axios.post('/drumtong/business/membership/rest/', ob)
          // 정상
     		.then( (response) => {
            const data = response.data;
			console.log(data);
            if(data === true){  
           		return true;
            }
            else if(data === false){ 
				alert('비밀번호가 틀렸습니다');
				return false;
			}            
           })
        }
		return axPost(ob);
	}