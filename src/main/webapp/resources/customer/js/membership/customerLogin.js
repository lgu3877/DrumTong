function submit() {
        console.log('submit작동');
        loginInputs = document.querySelectorAll('input.login-input-boxs');
        loginAlert = document.getElementsByClassName('login-alert');
        cnt = 0;

        for (i = 0; i < loginInputs.length; i++) {
          if (loginInputs[i].value === '') {
            loginInputs[i].style.border = '1px solid red';
            loginAlert[0].style.display = 'block';
          } else {
            cnt++;
          }
        }

        if (loginInputs[0].value === '' && loginInputs[1].value === '') {
          console.log('얼럿 시작 둘다없음');
          loginAlert[0].innerText = '입력된 정보가 없습니다';
        } else if (loginInputs[0].value === '') {
          console.log('얼럿 시작 아디없엉');
          loginAlert[0].innerText = '아이디를 입력해주세요';
        } else if (loginInputs[1].value === '') {
          console.log('얼럿 시작 비번내놔');
          loginAlert[0].innerText = '비밀번호를 입력해주세요';
        }

        if (cnt !== loginInputs.length) return;
        document.getElementById('loginForm').submit();
      } //submit 체크 함수 종료
