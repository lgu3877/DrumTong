
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
		console.log('실행 changeInput');
		console.log("obj : " + obj);
		var inputdiv = obj.parentNode;
		inputdiv.children[0].readOnly = false;
		inputdiv.removeChild(inputdiv.children[1]);
		
		var newdiv = document.createElement('div');
		newdiv.setAttribute("class", "newdiv");
		
		var submit = document.createElement('input');
		submit.setAttribute("type", "button");
		submit.setAttribute("value", "입력");
		submit.setAttribute("class", "newinput");
		submit.setAttribute("onclick", "inputData(this)");

		
		
		newdiv.appendChild(submit);

		var cancle = document.createElement('input');
		cancle.setAttribute("type", "button");
		cancle.setAttribute("value", "취소");
		cancle.setAttribute("class", "newinput");
		cancle.setAttribute("onclick", "cancle(this)");
		newdiv.appendChild(cancle);
		
		
		switch (inputdiv.children[0].id) {
		case 'genderboolean':
			genderbooleanCreate(inputdiv, inputdiv.children[0].id);
			break;
		case 'phonenum':
			phonenumCreate(inputdiv, inputdiv.children[0].id);
			break;
		case 'address':
			addressCreate(inputdiv, inputdiv.children[0].id);
			break;
		default:
			break;
		}
		
		inputdiv.appendChild(newdiv);
	}
	
	
	
	function inputData(obj) {
	// anx 비동기식으로 작동시키도록 하자 -> oblur
	
	const whereparam = document.getElementById("BPERSONID");
	let div = (obj.parentNode).parentNode;
	let inputChange = div.children[0];
	
	let ob={
  		  'fieldname': inputChange.name,
   		  'paramdata': inputChange.value,
   		  'wheredata': whereparam.id,
		  'whereparam': whereparam.value,
		};
		
		console.log(inputChange.value);
		console.log(ob.paramdata);
		console.log(ob.whereparam);
		
		console.log('axPOST 실행');
        const axPost = async (ob) => {	// async : 비동기 실행 함수

          await axios.post('/drumtong/business/membership/rest/', ob)
          // 정상
          
          .then( (response) => {
            const data = response.data;
            console.log("data : ", data);
            if(data === true){  
              console.log('responsedata 실행');
			  inputChange.value = inputChange.value;
			  cancle(obj);
            }
            else if(data === false){
              console.log('responsedata2 실행');
            }
            
            })
          }
          axPost(ob);
			
	}
	
	
	
	
	
	// 취소 버튼 클릭시
	// input[type=text] 태그 readonly 상태로 변환
	function cancle(obj) {
		var inputdiv = obj.parentNode.parentNode;
		inputdiv.removeChild(inputdiv.children[1]);
		inputdiv.children[0].readOnly = true;
		
		var origininput = document.createElement('input');
		origininput.setAttribute("type", "button");
		origininput.setAttribute("value", "수정");
		origininput.setAttribute("onclick", "changeInput(this)");
		origininput.setAttribute("class", "origininput");
		
		switch (inputdiv.children[0].id) {
		case 'genderboolean':
			specialcancle(inputdiv);
			break; 
		case 'phonenum':
			specialcancle(inputdiv);
			break;
		case 'address':
			specialcancle(inputdiv);
			break;
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
		option1.innerHTML = '남자';
		option2.innerHTML = '여자';
		
		select.appendChild(option1);
		select.appendChild(option2);
		
		inputdiv.appendChild(select);
		
	}
	
	// 휴대폰 번호 입력란 활성화
	function phonenumCreate(inputdiv, id) {
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
		input2.setAttribute("value", "인증하기");
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
	
	// 주소 입력란 활성화
	function addressCreate(inputdiv, id) {
		inputdiv.children[0].style.display = 'none';
		
		var div = document.createElement('div');
		div.setAttribute("class", "input");
		
		var input1 = document.createElement('input');
		input1.setAttribute("type", "text");
		input1.setAttribute("name", "mainaddress");
		input1.setAttribute("id", "mainaddress");
		input1.setAttribute("placeholder", "우편번호");
		input1.setAttribute("class", "mainaddress");
		
		
		var input2 = document.createElement('input');
		input2.setAttribute("type", "button");
		input2.setAttribute("value", "주소찾기");
		input2.setAttribute("onclick", "searchAddress()");
		input2.setAttribute("class", "search");
		
		var input3 = document.createElement('input');
		input3.setAttribute("type", "text");
		input3.setAttribute("name", "detailadress");
		input3.setAttribute("id", "detailadress");
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
		inputdiv.removeChild(inputdiv.children[1]);
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